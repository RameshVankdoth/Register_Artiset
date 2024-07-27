-- Table to store student registration details
CREATE TABLE StudentData (
    ID INT PRIMARY KEY IDENTITY(1,1),
    Fullname VARCHAR(255) NOT NULL,
    EmailId VARCHAR(255) NOT NULL UNIQUE,
    Mobile VARCHAR(20) NOT NULL UNIQUE,
    Gender CHAR(1),
    DOB DATE,
    EducationLevel VARCHAR(255),
    College VARCHAR(255),
    Marks DECIMAL(5, 2),
    Course VARCHAR(255),
    Specialization VARCHAR(255),
    PrimarySkill VARCHAR(255),
    SecondarySkill VARCHAR(255),
    PositionApplying VARCHAR(255),
    AlternateMobile VARCHAR(20),
    AlternateEmail VARCHAR(255),
    HomeState VARCHAR(255),
    HomeCity VARCHAR(255),
    CurrentState VARCHAR(255),
    CurrentCity VARCHAR(255),
    PreferredLocation VARCHAR(255),
    DOE DATETIME
);

-- Table to store state information
CREATE TABLE states (
    state_id INT PRIMARY KEY IDENTITY(1,1),
    state_name VARCHAR(100) NOT NULL
);

-- Table to store city information
CREATE TABLE cities (
    city_id INT PRIMARY KEY IDENTITY(1,1),
    city_name VARCHAR(100) NOT NULL,
    state_id INT,
    FOREIGN KEY (state_id) REFERENCES states(state_id)
);

-- Table to store course information
CREATE TABLE Courses (
    CourseID INT PRIMARY KEY IDENTITY(1,1),
    CourseName VARCHAR(255) NOT NULL
);

-- Table to store education levels
CREATE TABLE EducationLevels (
    LevelID INT PRIMARY KEY IDENTITY(1,1),
    LevelName VARCHAR(255) NOT NULL
);

-- Table to store predefined skills
CREATE TABLE def_skills (
    skills VARCHAR(255) PRIMARY KEY
);
