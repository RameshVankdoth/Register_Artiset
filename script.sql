CREATE TABLE StudentData (
    StudentID INT PRIMARY KEY IDENTITY(1,1),
    Fullname NVARCHAR(100) NOT NULL,
    EmailId NVARCHAR(255) NOT NULL UNIQUE,
    Mobile NVARCHAR(20) NOT NULL UNIQUE,
    Gender NVARCHAR(10) NOT NULL,
    DOB DATE NOT NULL,
    EducationLevel NVARCHAR(100) NOT NULL,
    College NVARCHAR(255) NOT NULL,
    Marks NVARCHAR(10) NOT NULL,
    Course NVARCHAR(100) NOT NULL,
    Specialization NVARCHAR(255) NOT NULL,
    PrimarySkill NVARCHAR(255) NOT NULL,
    SecondarySkill NVARCHAR(255) NOT NULL,
    PositionApplying NVARCHAR(255),
    AlternateMobile NVARCHAR(20) NOT NULL,
    AlternateEmail NVARCHAR(255) NOT NULL,
    HomeState NVARCHAR(100) NOT NULL,
    HomeCity NVARCHAR(100) NOT NULL,
    CurrentState NVARCHAR(100) NOT NULL,
    CurrentCity NVARCHAR(100) NOT NULL,
    PreferredLocation NVARCHAR(100) NOT NULL,
    CreatedAt DATETIME DEFAULT GETDATE(),
    DOE DATETIME
);

select * from StudentData;

CREATE TABLE def_skills (
    SkillID INT IDENTITY(1,1) PRIMARY KEY,
    Skills NVARCHAR(100) UNIQUE
);
--adding the skills
INSERT INTO def_skills (skills) VALUES
('Agile Methodology'),
('Ansys'),
('API Design'),
('App Development'),
('Artificial Intelligence and Machine Learning'),
('Business Analyst'),
('CAT'),
('Catia'),
('C/C++'),
('Cloud Computing'),
('Combustion Engine'),
('Computer Vision'),
('Cyber Security'),
('Data Analysis and Visualizations'),
('Data Science'),
('Deep Learning'),
('Dev-OPs'),
('Digital Marketing'),
('Figma'),
('Finance'),
('Firebase'),
('Flutter'),
('Full Stack Web Development'),
('GitHub'),
('Hadoop'),
('Hibernate'),
('HTML, CSS, Bootstrap'),
('HR'),
('Internet of Things'),
('Java'),
('JavaScript'),
('Jsp servlet'),
('Marketing'),
('MERN Stack'),
('Non-Relational Database (Postgresql, Mongodb, NOSQL, Oracle, etc.)'),
('Operating System'),
('PHP'),
('PHPMYADMIN'),
('Perl'),
('Postman'),
('Power Bi'),
('Product Analyst'),
('Python'),
('QA'),
('QML'),
('R Programming'),
('SAP'),
('Selenium'),
('Software Engineering and Project Management'),
('Springboot'),
('SQL'),
('Typescript'),
('UI/UX'),
('Verilog');


CREATE TABLE states (
    state_id INT PRIMARY KEY IDENTITY(1,1),
    state_name VARCHAR(100) NOT NULL
);


-- inserting cities at once
INSERT INTO states (state_name) VALUES
('Andhra Pradesh'),
('Arunachal Pradesh'),
('Assam'),
('Bihar'),
('Chhattisgarh'),
('Goa'),
('Gujarat'),
('Haryana'),
('Himachal Pradesh'),
('Jharkhand'),
('Karnataka'),
('Kerala'),
('Madhya Pradesh'),
('Maharashtra'),
('Manipur'),
('Meghalaya'),
('Mizoram'),
('Nagaland'),
('Odisha'),
('Punjab'),
('Rajasthan'),
('Sikkim'),
('Tamil Nadu'),
('Telangana'),
('Tripura'),
('Uttar Pradesh'),
('Uttarakhand'),
('West Bengal');

CREATE TABLE cities (
    city_id INT PRIMARY KEY IDENTITY(1,1),
    city_name VARCHAR(100) NOT NULL,
    state_id INT,
    FOREIGN KEY (state_id) REFERENCES states(state_id)
);

-- Andhra Pradesh (state_id: 1)
INSERT INTO cities (city_name, state_id) VALUES
('Anantapur', 1),
('Chittur',1),
('Guntur', 1),
('Kadapa', 1),
('Kakinada', 1),
('Nellore', 1),
('Rajahmundry', 1),
('Tirupati', 1),
('Vijayawada', 1),
('Visakhapatnam', 1);

-- Arunachal Pradesh (state_id: 2)
INSERT INTO cities (city_name, state_id) VALUES
('Aalo', 2),
('Bomdila', 2),
('Dirang', 2),
('Itanagar', 2),
('Naharlagun', 2),
('Pasighat', 2),
('Roing', 2),
('Tawang', 2),
('Tezpur', 2),
('Ziro', 2);

-- Assam (state_id: 3)
INSERT INTO cities (city_name, state_id) VALUES
('Bongaigaon', 3),
('Dhemaji', 3),
('Dibrugarh', 3),
('Guwahati', 3),
('Haflong', 3),
('Jorhat', 3),
('Karimganj', 3),
('Moran', 3),
('Nagaon', 3),
('Silchar', 3);

-- Bihar (state_id: 4)
INSERT INTO cities (city_name, state_id) VALUES
('Arrah', 4),
('Bhagalpur', 4),
('Chapra', 4),
('Darbhanga', 4),
('Gaya', 4),
('Motihari', 4),
('Muzaffarpur', 4),
('Patna', 4),
('Purnia', 4),
('Sasaram', 4);

-- Chhattisgarh (state_id: 5)
INSERT INTO cities (city_name, state_id) VALUES
('Ambikapur', 5),
('Bilaspur', 5),
('Dantewada', 5),
('Jagdalpur', 5),
('Janjgir', 5),
('Korba', 5),
('Raigarh', 5),
('Raipur', 5),
('Sarguja', 5),
('Uslapur', 5);

-- Goa (state_id: 6)
INSERT INTO cities (city_name, state_id) VALUES
('Bicholim', 6),
('Canacona', 6),
('Cortalim', 6),
('Margao', 6),
('Mapusa', 6),
('Panaji', 6),
('Ponda', 6),
('Quepem', 6),
('Sanguem', 6),
('Vasco da Gama', 6);

-- Gujarat (state_id: 7)
INSERT INTO cities (city_name, state_id) VALUES
('Ahmedabad', 7),
('Anand', 7),
('Bhavnagar', 7),
('Gandhinagar', 7),
('Junagadh', 7),
('Mehsana', 7),
('Navsari', 7),
('Rajkot', 7),
('Surat', 7),
('Vadodara', 7);

-- Haryana (state_id: 8)
INSERT INTO cities (city_name, state_id) VALUES
('Ambala', 8),
('Chandigarh', 8),
('Faridabad', 8),
('Gurgaon', 8),
('Hisar', 8),
('Jind', 8),
('Karnal', 8),
('Panipat', 8),
('Rohtak', 8),
('Sonipat', 8);

-- Himachal Pradesh (state_id: 9)
INSERT INTO cities (city_name, state_id) VALUES
('Bilaspur', 9),
('Chamba', 9),
('Dharamshala', 9),
('Hamirpur', 9),
('Kullu', 9),
('Mandi', 9),
('Manali', 9),
('Palampur', 9),
('Shimla', 9),
('Solan', 9);

-- Jharkhand (state_id: 10)
INSERT INTO cities (city_name, state_id) VALUES
('Bokaro', 10),
('Chaibasa', 10),
('Dhanbad', 10),
('Dumka', 10),
('Giridih', 10),
('Hazaribagh', 10),
('Jamshedpur', 10),
('Jhumri Telaiya', 10),
('Koderma', 10),
('Ranchi', 10);

-- Karnataka (state_id: 11)
INSERT INTO cities (city_name, state_id) VALUES
('Belagavi', 11),
('Bengaluru', 11),
('Davanagere', 11),
('Hospet', 11),
('Hubballi', 11),
('Kolar', 11),
('Mangaluru', 11),
('Mysuru', 11),
('Shimoga', 11),
('Udupi', 11);

-- Kerala (state_id: 12)
INSERT INTO cities (city_name, state_id) VALUES
('Alappuzha', 12),
('Kannur', 12),
('Kochi', 12),
('Kottayam', 12),
('Kozhikode', 12),
('Malappuram', 12),
('Palakkad', 12),
('Thiruvananthapuram', 12),
('Thrissur', 12),
('Wayanad', 12);

-- Madhya Pradesh (state_id: 13)
INSERT INTO cities (city_name, state_id) VALUES
('Bhopal', 13),
('Burhanpur', 13),
('Gwalior', 13),
('Indore', 13),
('Jabalpur', 13),
('Khandwa', 13),
('Ratlam', 13),
('Sagar', 13),
('Satna', 13),
('Ujjain', 13);

-- Maharashtra (state_id: 14)
INSERT INTO cities (city_name, state_id) VALUES
('Amravati', 14),
('Aurangabad', 14),
('Jalgaon', 14),
('Kolhapur', 14),
('Mumbai', 14),
('Nagpur', 14),
('Nashik', 14),
('Pune', 14),
('Solapur', 14),
('Thane', 14);

-- Manipur (state_id: 15)
INSERT INTO cities (city_name, state_id) VALUES
('Bishnupur', 15),
('Churachandpur', 15),
('Imphal', 15),
('Jiribam', 15),
('Kakching', 15),
('Moirang', 15),
('Senapati', 15),
('Tamenglong', 15),
('Thoubal', 15),
('Ukhrul', 15);

-- Meghalaya (state_id: 16)
INSERT INTO cities (city_name, state_id) VALUES
('Baghmara', 16),
('Bongaluru', 16),
('Jowai', 16),
('Khliehriat', 16),
('Mairang', 16),
('Nongpoh', 16),
('Nongstoin', 16),
('Shillong', 16),
('Tura', 16),
('Williamnagar', 16);

-- Mizoram (state_id: 17)
INSERT INTO cities (city_name, state_id) VALUES
('Aizawl', 17),
('Champhai', 17),
('Hnahthial', 17),
('Kolasib', 17),
('Lawngtlai', 17),
('Lunglei', 17),
('Mamit', 17),
('Saiha', 17),
('Saitual', 17),
('Serchhip', 17);

-- Nagaland (state_id: 18)
INSERT INTO cities (city_name, state_id) VALUES
('Dimapur', 18),
('Kiphire', 18),
('Kohima', 18),
('Longleng', 18),
('Mokokchung', 18),
('Mon', 18),
('Phek', 18),
('Tuensang', 18),
('Wokha', 18),
('Zunheboto', 18);

-- Odisha (state_id: 19)
INSERT INTO cities (city_name, state_id) VALUES
('Baripada', 19),
('Baleswar', 19),
('Berhampur', 19),
('Bhubaneswar', 19),
('Cuttack', 19),
('Jeypore', 19),
('Kendujhar', 19),
('Koraput', 19),
('Rourkela', 19),
('Sambalpur', 19);

-- Punjab (state_id: 20)
INSERT INTO cities (city_name, state_id) VALUES
('Amritsar', 20),
('Bathinda', 20),
('Ferozepur', 20),
('Hoshiarpur', 20),
('Jalandhar', 20),
('Ludhiana', 20),
('Mansa', 20),
('Mohali', 20),
('Patiala', 20),
('Rupnagar', 20);

-- Rajasthan (state_id: 21)
INSERT INTO cities (city_name, state_id) VALUES
('Ajmer', 21),
('Aligarh', 21),
('Bikaner', 21),
('Jaipur', 21),
('Jaisalmer', 21),
('Jodhpur', 21),
('Kota', 21),
('Nagaur', 21),
('Sikar', 21),
('Udaipur', 21);

-- Sikkim (state_id: 22)
INSERT INTO cities (city_name, state_id) VALUES
('Gangtok', 22),
('Mangan', 22),
('Namchi', 22),
('Rangpo', 22),
('Soreng', 22),
('Geyzing', 22),
('Jorethang', 22),
('Rangpo', 22),
('Singtam', 22),
('Tadong', 22);

-- Tamil Nadu (state_id: 23)
INSERT INTO cities (city_name, state_id) VALUES
('Chennai', 23),
('Coimbatore', 23),
('Cuddalore', 23),
('Dindigul', 23),
('Erode', 23),
('Madurai', 23),
('Nagercoil', 23),
('Salem', 23),
('Tiruchirappalli', 23),
('Tirunelveli', 23);

-- Telangana (state_id: 24)
INSERT INTO cities (city_name, state_id) VALUES
('Adilabad', 24),
('Hyderabad', 24),
('Karimnagar', 24),
('Khammam', 24),
('Mahbubnagar', 24),
('Nalgonda', 24),
('Nizamabad', 24),
('Ramagundam', 24),
('Warangal', 24),
('Zahirabad', 24);

-- Tripura (state_id: 25)
INSERT INTO cities (city_name, state_id) VALUES
('Agartala', 25),
('Belonia', 25),
('Dharmanagar', 25),
('Khowai', 25),
('Sepahijala', 25),
('Udaipur', 25),
('Ambassa', 25),
('Jirania', 25),
('Sabroom', 25),
('Teliamura', 25);

-- Uttar Pradesh (state_id: 26)
INSERT INTO cities (city_name, state_id) VALUES
('Agra', 26),
('Aligarh', 26),
('Allahabad', 26),
('Bareilly', 26),
('Firozabad', 26),
('Ghaziabad', 26),
('Gorakhpur', 26),
('Kanpur', 26),
('Lucknow', 26),
('Varanasi', 26);

-- Uttarakhand (state_id: 27)
INSERT INTO cities (city_name, state_id) VALUES
('Dehradun', 27),
('Haridwar', 27),
('Haldwani', 27),
('Nainital', 27),
('Rishikesh', 27),
('Roorkee', 27),
('Kashipur', 27),
('Pauri', 27),
('Rudrapur', 27),
('Tehri', 27);

-- West Bengal (state_id: 28)
INSERT INTO cities (city_name, state_id) VALUES
('Asansol', 28),
('Bardhaman', 28),
('Durgapur', 28),
('Howrah', 28),
('Kolkata', 28),
('Malda', 28),
('Midnapore', 28),
('Siliguri', 28),
('Jalpaiguri', 28),
('Kanchrapara', 28);


-- Create Courses Table
CREATE TABLE Courses (
    CourseID INT PRIMARY KEY IDENTITY(1,1),
    CourseName VARCHAR(255) NOT NULL UNIQUE
);

-- Insert Courses Data
INSERT INTO Courses (CourseName) VALUES
('B.Tech'),
('BBA'),
('M.Tech'),
('B.E'),
('B.Sc'),
('M.Sc'),
('MBA');

-- Create Education Levels Table
CREATE TABLE EducationLevels (
    LevelID INT PRIMARY KEY IDENTITY(1,1),
    LevelName VARCHAR(255) NOT NULL UNIQUE
);

-- Insert Education Levels Data
INSERT INTO EducationLevels (LevelName) VALUES
('Undergraduate'),
('Postgraduate'),
('PhD');


CREATE TABLE positions(
	pos_id INT PRIMARY KEY IDENTITY(1,1),
	Pos NVARCHAR(50)
);

INSERT INTO positions (pos) VALUES
('Python-Data Science Intern'),
('Java Full Stack'),
('Quality Assuarance'),
('Product Analyst');

select * from positions;