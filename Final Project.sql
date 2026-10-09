CREATE DATABASE University;
Query OK, 1 row affected (0.086 sec)

mysql> USE University;
Database changed

CREATE TABLE Students (
StudentID INT PRIMARY KEY,
FirstName VARCHAR(50),
LastName VARCHAR(50),
Email VARCHAR(100),
BirthDate DATE,
EnrollmentDate DATE
);
Query OK, 0 rows affected (1.043 sec)

CREATE TABLE Courses (
CourseID INT PRIMARY KEY,
CourseName VARCHAR(100),
DepartmentID INT,
Credits INT
);
Query OK, 0 rows affected (0.759 sec)

CREATE TABLE Instructors (
InstructorID INT PRIMARY KEY,
FirstName VARCHAR(50),
LastName VARCHAR(50),
Email VARCHAR(100),
DepartmentID INT,
Salary DECIMAL(10,2)
);
Query OK, 0 rows affected (0.864 sec)

CREATE TABLE Enrollments (
EnrollmentID INT PRIMARY KEY,
StudentID INT,
CourseID INT,
EnrollmentDate DATE
);
Query OK, 0 rows affected (0.763 sec)

CREATE TABLE Departments (
DepartmentID INT PRIMARY KEY,
DepartmentName VARCHAR(100) NOT NULL
);
Query OK, 0 rows affected (0.271 sec)

INSERT INTO Departments
VALUES (1, 'Computer Science');
Query OK, 1 row affected (0.584 sec)

INSERT INTO Departments
VALUES (2, 'Mathematics');
Query OK, 1 row affected (0.548 sec)

INSERT INTO Students
VALUES (1, 'John', 'Doe', 'john.doe@email.com', '2000-01-15', '2022-08-01');
Query OK, 1 row affected (0.078 sec)

INSERT INTO Students
VALUES (2, 'Jane', 'Smith', 'jane.smith@email.com', '1999-05-25', '2021-08-01');
Query OK, 1 row affected (0.025 sec)

INSERT INTO Courses
VALUES (101, 'Introduction to SQL', 1, 3);
Query OK, 1 row affected (0.107 sec)

INSERT INTO Courses
VALUES (102, 'Data Structures', 2, 4);
Query OK, 1 row affected (0.552 sec)

INSERT INTO Instructors
VALUES (1, 'Alice', 'Johnson', 'alice.johnson@univ.com', 1, 60000);
Query OK, 1 row affected (0.578 sec)

INSERT INTO Instructors
VALUES (2, 'Bob', 'Lee', 'bob.lee@univ.com', 2, 55000);
Query OK, 1 row affected (0.547 sec)

INSERT INTO Enrollments
VALUES (1, 1, 101, '2022-08-01');
Query OK, 1 row affected (0.572 sec)

INSERT INTO Enrollments
VALUES (2, 2, 102, '2021-08-01');
Query OK, 1 row affected (0.543 sec)

mysql> SELECT * FROM Students;
+-----------+-----------+----------+----------------------+------------+----------------+
| StudentID | FirstName | LastName | Email                | BirthDate  | EnrollmentDate |
+-----------+-----------+----------+----------------------+------------+----------------+
|         1 | John      | Doe      | john.doe@email.com   | 2000-01-15 | 2022-08-01     |
|         2 | Jane      | Smith    | jane.smith@email.com | 1999-05-25 | 2021-08-01     |
+-----------+-----------+----------+----------------------+------------+----------------+
2 rows in set (0.543 sec)

UPDATE Students
SET Email = 'john.updated@email.com'
WHERE StudentID = 1;
Query OK, 1 row affected (0.569 sec)
Rows matched: 1  Changed: 1  Warnings: 0

DELETE FROM Enrollments
WHERE EnrollmentID = 99;
Query OK, 0 rows affected (0.524 sec)

SELECT *
FROM Students
WHERE EnrollmentDate > '2022-12-31';
Empty set (0.565 sec)

SELECT c.*
FROM Courses c
JOIN Departments d
ON c.DepartmentID = d.DepartmentID
WHERE d.DepartmentName = 'Mathematics'
LIMIT 5;
+----------+-----------------+--------------+---------+
| CourseID | CourseName      | DepartmentID | Credits |
+----------+-----------------+--------------+---------+
|      102 | Data Structures |            2 |       4 |
+----------+-----------------+--------------+---------+
1 row in set (0.026 sec)

SELECT CourseID, COUNT(StudentID) AS TotalStudents
FROM Enrollments
GROUP BY CourseID
HAVING COUNT(StudentID) > 5;
Empty set (0.565 sec)

SELECT s.*
FROM Students s
JOIN Enrollments e ON s.StudentID = e.StudentID
JOIN Courses c ON e.CourseID = c.CourseID
WHERE c.CourseName = 'Introduction to SQL'

INTERSECT

SELECT s.*
FROM Students s
JOIN Enrollments e ON s.StudentID = e.StudentID
JOIN Courses c ON e.CourseID = c.CourseID
WHERE c.CourseName = 'Data Structures';
Empty set (0.045 sec)

SELECT DISTINCT s.*
FROM Students s
JOIN Enrollments e ON s.StudentID = e.StudentID
JOIN Courses c ON e.CourseID = c.CourseID
WHERE c.CourseName IN ('Introduction to SQL', 'Data Structures');
+-----------+-----------+----------+------------------------+------------+----------------+
| StudentID | FirstName | LastName | Email                  | BirthDate  | EnrollmentDate |
+-----------+-----------+----------+------------------------+------------+----------------+
|         1 | John      | Doe      | john.updated@email.com | 2000-01-15 | 2022-08-01     |
|         2 | Jane      | Smith    | jane.smith@email.com   | 1999-05-25 | 2021-08-01     |
+-----------+-----------+----------+------------------------+------------+----------------+
2 rows in set (0.029 sec)

SELECT AVG(Credits) AS AverageCredits
FROM Courses;
+----------------+
| AverageCredits |
+----------------+
|         3.5000 |
+----------------+
1 row in set (0.010 sec)

SELECT MAX(i.Salary) AS MaxSalary
FROM Instructors i
JOIN Departments d
ON i.DepartmentID = d.DepartmentID
WHERE d.DepartmentName = 'Computer Science';
+-----------+
| MaxSalary |
+-----------+
|  60000.00 |
+-----------+
1 row in set (0.010 sec)

SELECT d.DepartmentName, COUNT(e.StudentID) AS StudentCount
FROM Departments d
LEFT JOIN Courses c
ON d.DepartmentID = c.DepartmentID
LEFT JOIN Enrollments e
ON c.CourseID = e.CourseID
GROUP BY d.DepartmentName;
+------------------+--------------+
| DepartmentName   | StudentCount |
+------------------+--------------+
| Computer Science |            1 |
| Mathematics      |            1 |
+------------------+--------------+
2 rows in set (0.014 sec)

SELECT s.FirstName, s.LastName, c.CourseName
FROM Students s
JOIN Enrollments e
ON s.StudentID = e.StudentID
JOIN Courses c
ON e.CourseID = c.CourseID;
+-----------+----------+---------------------+
| FirstName | LastName | CourseName          |
+-----------+----------+---------------------+
| John      | Doe      | Introduction to SQL |
| Jane      | Smith    | Data Structures     |
+-----------+----------+---------------------+
2 rows in set (0.009 sec)

SELECT s.FirstName, s.LastName, c.CourseName
FROM Students s
LEFT JOIN Enrollments e
ON s.StudentID = e.StudentID
LEFT JOIN Courses c
ON e.CourseID = c.CourseID;
+-----------+----------+---------------------+
| FirstName | LastName | CourseName          |
+-----------+----------+---------------------+
| John      | Doe      | Introduction to SQL |
| Jane      | Smith    | Data Structures     |
+-----------+----------+---------------------+
2 rows in set (0.017 sec)

SELECT FirstName, LastName
FROM Students
WHERE StudentID IN (
SELECT StudentID
FROM Enrollments
WHERE CourseID IN (
SELECT CourseID
FROM Enrollments
GROUP BY CourseID
HAVING COUNT(StudentID) > 10
)
);
Empty set (0.579 sec)

SELECT FirstName, LastName, YEAR(EnrollmentDate) AS EnrollmentYear
FROM Students;
+-----------+----------+----------------+
| FirstName | LastName | EnrollmentYear |
+-----------+----------+----------------+
| John      | Doe      |           2022 |
| Jane      | Smith    |           2021 |
+-----------+----------+----------------+
2 rows in set (0.536 sec)

SELECT CONCAT(FirstName, ' ', LastName) AS FullName
FROM Instructors;
+---------------+
| FullName      |
+---------------+
| Alice Johnson |
| Bob Lee       |
+---------------+
2 rows in set (0.017 sec)

SELECT EnrollmentID, CourseID, StudentID,
ROW_NUMBER() OVER (ORDER BY EnrollmentID) AS RunningTotalStudents
FROM Enrollments;
+--------------+----------+-----------+----------------------+
| EnrollmentID | CourseID | StudentID | RunningTotalStudents |
+--------------+----------+-----------+----------------------+
|            1 |      101 |         1 |                    1 |
|            2 |      102 |         2 |                    2 |
+--------------+----------+-----------+----------------------+
2 rows in set (0.551 sec)

SELECT FirstName, LastName, EnrollmentDate,
CASE
WHEN DATEDIFF(CURRENT_DATE, EnrollmentDate) > (365 * 4)
THEN 'Senior'
ELSE 'Junior'
END AS StudentCategor
FROM Students;
+-----------+----------+----------------+-----------------+
| FirstName | LastName | EnrollmentDate | StudentCategory |
+-----------+----------+----------------+-----------------+
| John      | Doe      | 2022-08-01     | Senior          |
| Jane      | Smith    | 2021-08-01     | Senior          |
+-----------+----------+----------------+-----------------+
2 rows in set (0.573 sec)