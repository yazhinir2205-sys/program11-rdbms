-- Create Department table
CREATE TABLE Department (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50)
);

-- Create Student table
CREATE TABLE Student (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(50),
    DepartmentID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID)
);

-- Create Course table
CREATE TABLE Course (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(50)
);

-- Create Enrollment table
CREATE TABLE Enrollment (
    EnrollmentID INT PRIMARY KEY,
    StudentID INT,
    CourseID INT,
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Course(CourseID)
);

-- Insert values into Department
INSERT INTO Department VALUES
(1, 'Computer Science'),
(2, 'Commerce'),
(3, 'Mathematics');

-- Insert values into Student
INSERT INTO Student VALUES
(101, 'Anu', 1),
(102, 'Priya', 2),
(103, 'Kavi', 1);

-- Insert values into Course
INSERT INTO Course VALUES
(201, 'Database Management'),
(202, 'Python Programming'),
(203, 'Mathematics');

-- Insert values into Enrollment
INSERT INTO Enrollment VALUES
(301, 101, 201),
(302, 102, 203),
(303, 103, 202);

-- Create View
CREATE VIEW StudentDetails AS
SELECT 
    Student.StudentName,
    Course.CourseName,
    Department.DepartmentName
FROM Student
JOIN Department 
    ON Student.DepartmentID = Department.DepartmentID
JOIN Enrollment 
    ON Student.StudentID = Enrollment.StudentID
JOIN Course 
    ON Enrollment.CourseID = Course.CourseID;

-- Display the view
SELECT * FROM StudentDetails;
