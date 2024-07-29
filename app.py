import datetime
import traceback

import pyodbc
from dotenv import load_dotenv
from flask import (Flask, flash, jsonify, redirect, render_template, request,
                   send_from_directory, session, url_for)
from werkzeug.utils import secure_filename

app = Flask(__name__, template_folder="templates")
app.secret_key = 'a6d73b93ebd82df2fe65d279231ab7642a'  # Ensure this is a strong secret key

connection_string = (
    'Driver={ODBC Driver 17 for SQL Server};Server=tcp:hackathondatabase.database.windows.net,1433;Database=hachathon;Uid=hackathon-admin;Pwd={Pune@2024};Encrypt=yes;TrustServerCertificate=no;Connection Timeout=30;'
)

def get_connection():
    return pyodbc.connect(connection_string)

@app.route("/thankyou")
def thankyou():
    return render_template("thankyou.html")

@app.route("/", methods=["GET", "POST"])
@app.route("/register", methods=["POST", "GET"])
def register():
    if request.method == "POST":
        try:
            # Extract form data
            fullname = request.form.get("Fullname")
            email = request.form.get("email")
            mobile = request.form.get("mobile")
            gender = request.form.get("gender")
            dob = request.form.get("dob")
            education_level = request.form.get("level")
            college = request.form.get("college")
            marks = request.form.get("marks")
            course = request.form.get("Course")
            specialization = request.form.get("Specialization")
            primary_skill = request.form.get("primarySkill")
            secondary_skill = request.form.get("secondarySkill")
            position_applying = request.form.get("positionApplying")
            alternate_mobile = request.form.get("altphone")
            alternate_email = request.form.get("altemail")
            home_state = int(request.form.get("homeState"))
            home_city = int(request.form.get("homeCity"))
            current_state = int(request.form.get("currState"))
            current_city = int(request.form.get("currCity"))
            preferred_location = request.form.get("prefCity")

            # Get current date and time for DOE
            doe = datetime.datetime.now()

            # Validate if all necessary fields are present
            if not all([fullname, email, mobile, gender, dob, education_level, college, marks, course, specialization, primary_skill, secondary_skill, home_state, home_city, current_state, current_city, preferred_location]):
                flash("Please fill in all required fields.")
                return redirect(url_for("register"))

            with get_connection() as conn:
                cursor = conn.cursor()
                cursor.execute(
                    "SELECT EmailId, Mobile FROM StudentData WHERE EmailId = ? OR Mobile = ?",
                    (email, mobile),
                )
                existing_user = cursor.fetchone()
                if existing_user:
                    flash("You are already registered with this email or mobile number.")
                    return redirect(url_for("register"))

                cursor.execute("SELECT state_id, state_name FROM states")
                states = cursor.fetchall()
                
                cursor.execute("SELECT city_id, city_name, state_id FROM cities")
                cities = cursor.fetchall()
                
                print(fullname, email, mobile, gender, dob, education_level, college, marks, course, specialization, primary_skill, secondary_skill,
                     position_applying, alternate_mobile, alternate_email, states[home_state-1][1], cities[home_city-1][1], states[current_state-1][1], cities[current_city-1][1], preferred_location, doe)

                cursor.execute(
                    "INSERT INTO StudentData (Fullname, EmailId, Mobile, Gender, DOB, EducationLevel, College, Marks, Course, Specialization, PrimarySkill, SecondarySkill, PositionApplying, AlternateMobile, AlternateEmail, HomeState, HomeCity, CurrentState, CurrentCity, PreferredLocation, DOE) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)",
                    (fullname, email, mobile, gender, dob, education_level, college, marks, course, specialization, primary_skill, secondary_skill,
                     position_applying, alternate_mobile, alternate_email, states[home_state-1][1], cities[home_city-1][1], states[current_state-1][1], cities[current_city-1][1], preferred_location, doe)
                )
               
                conn.commit()
                flash("Registration successful")
                return redirect(url_for("thankyou"))

        except Exception as e:
            traceback.print_exc()  # Print the full traceback for debugging
            flash(f"An error occurred during registration: {str(e)}")
            return redirect(url_for("register"))

    # Fetch data for the registration form
    try:
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
            cursor.execute("SELECT * FROM positions")
            positions_list = cursor.fetchall()
            positions = [{"id": pos[0], "name": pos[1]} for pos in positions_list]
    except Exception as e:
        print(f"Database error: {e}")
        flash("An error occurred while fetching form data.")
        return render_template("registration.html")

    return render_template("registration.html", skills=skills, courses=courses, levels=levels, cities=cities_list, states=states_list, positions=positions)

@app.route("/get_cities")
def get_cities():
    state_id = request.args.get("state_id", type=int)
    if (state_id is None):
        return jsonify({"cities": []})

    try:
        with get_connection() as conn:
            cursor = conn.cursor()
            cursor.execute("SELECT city_id, city_name FROM cities WHERE state_id = ?", (state_id,))
            cities = cursor.fetchall()
            cities_list = [{"id": city[0], "name": city[1]} for city in cities]

    except Exception as e:
        print(f"Database error: {e}")
        return jsonify({"cities": []})

    return jsonify({"cities": cities_list})

if __name__ == "__main__":
    app.run(host='0.0.0.0', port=5000)
