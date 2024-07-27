import traceback

import pyodbc
from flask import (Flask, flash, redirect, render_template, request, session,
                   url_for)
from werkzeug.security import generate_password_hash

app = Flask(__name__, template_folder="templates")
app.secret_key = '1421bf16234ec11bdd0988cdd08688f389d3acd43f6a75ae1b04be21844452a8'  # Add a secret key for session management

connection_string = "Driver={ODBC Driver 17 for SQL Server};Server=RAMESH\\MSSQLSERVER02;Database=student;Trusted_Connection=yes;"

def get_connection():
    return pyodbc.connect(connection_string)

@app.route("/thankyou")
def thankyou():
    return render_template("thanyou.html")


@app.route("/", methods=["GET","POST"])
@app.route("/register", methods=["POST", "GET"])
def register():
    if request.method == "POST":
        try:
            fullname = request.form.get("Fullname")
            namelist = list(fullname.split(" "))
            fname = namelist[0]
            mname = namelist[1:len(namelist) - 1]
            mname_str = " ".join(mname) if mname else None
            lname = namelist[-1]
            if lname == fname:
                lname = None 
            email = request.form.get("email")
            mobile = request.form.get("mobile")
            gender = request.form.get("gender")
            dob = request.form.get("dob")
            edu = request.form.get("level")
            college = request.form.get("college")
            marks = request.form.get("marks")
            course = request.form.get("Course")
            specialization = request.form.get("Specialization")
            primary_skill = request.form.get("primarySkill")
            secondary_skill = request.form.get("secondarySkill")
            position = request.form.get("positionApplying")
            home_state = request.form.get("homeState")
            home_city = request.form.get("homeCity")
            current_state = request.form.get("currentState")
            current_city = request.form.get("currentCity")
            preferred_location = request.form.get("preferredLocation")

            # Validate if all necessary fields are present
            if not (fullname and email and mobile and gender and dob and edu and college and marks and course and specialization and primary_skill and secondary_skill and home_state and home_city and current_state and current_city and preferred_location):
                flash("Please fill in all required fields.")
                return redirect(url_for("register"))

            with get_connection() as conn:
                cursor = conn.cursor()

                cursor.execute(
                    "SELECT EmailId, Mobile FROM Students WHERE EmailId = ? OR Mobile = ?",
                    (email, mobile),
                )
                
                existing_user = cursor.fetchone()
                if existing_user:
                    dbmail, dbmobile = existing_user
                    if dbmail == email:
                        flash("A user is already registered with this E-Mail, please login.")
                    if dbmobile == mobile:
                        flash("An account already exists with this phone number, please login.")
                    return redirect(url_for("register"))

                cursor.execute(
                    "INSERT INTO Students (FirstName, MiddleName, LastName, EmailId, Mobile, Gender, DOB, EducationLevel, College, Marks, Course, Specialization, PrimarySkill, SecondarySkill, Position, HomeState, HomeCity, CurrentState, CurrentCity, PreferredLocation, FullName) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)",
                    (fname, mname_str, lname, email, mobile, gender, dob, edu, college, marks, course, specialization, primary_skill, secondary_skill, 
                     position, home_state, home_city, current_state, current_city, preferred_location, fullname),
                )
                cursor.execute(
                    "INSERT INTO Intern ()"
                )
                conn.commit()
                flash("Registration successful. Please login.")
                return redirect(url_for("loginpage"))

        except Exception as e:
            traceback.print_exc()  # Print the full traceback for debugging
            flash(f"An error occurred during registration: {str(e)}")
            return redirect(url_for("register"))

    # Fetch the skill list for the registration form
    with get_connection() as conn:
        cursor = conn.cursor()
        cursor.execute("SELECT skills FROM def_skills")
        skill_list = cursor.fetchall()
        skills = [skill[0] for skill in skill_list]
        cursor.execute("SELECT CourseID, CourseName FROM Courses")
        courses = cursor.fetchall()        
        cursor.execute("SELECT state_id, state_name FROM states")
        states = cursor.fetchall()
        states_list = [{"id": state[0], "name": state[1]} for state in states]
        
        cursor.execute("SELECT city_id, city_name, state_id FROM cities")
        cities = cursor.fetchall()
        cities_list = [{"id": city[0], "name": city[1], "state_id": city[2]} for city in cities]
        cursor.execute("SELECT LevelID, LevelName FROM EducationLevels")
        levels = cursor.fetchall()

    return render_template("registration.html", skills=skills, courses=courses, levels=levels, cities=cities_list, states=states_list)

if __name__ == "__main__":
    app.run(debug=True, port=5001)



