[README (3).md](https://github.com/user-attachments/files/33247594/README.3.md)
# 🎓 University Course Management System

## 📌 Project Description

This project is a MySQL database system used to manage university students, courses, instructors, departments, and enrollments. It stores all the data in related tables and uses SQL queries to add, update, search, and analyze the information.

---

## 🛠️ Technologies Used

- MySQL
- SQL
- MySQL Command Line Client

---

## 📂 Database Name

`University`

---

## 📋 Tables Used

### 1. Students
Stores the details of all students.
- `student_id` – unique ID of the student (Primary Key)
- `first_name`, `last_name` – name of the student
- `email` – email address
- `department_id` – department the student belongs to (Foreign Key)
- `enrollment_date` – date the student joined

### 2. Courses
Stores the courses offered by the university.
- `course_id` – unique ID of the course (Primary Key)
- `course_name` – name of the course
- `credits` – number of credits
- `department_id` – department offering the course (Foreign Key)
- `instructor_id` – instructor teaching the course (Foreign Key)

### 3. Instructors
Stores the details of the instructors.
- `instructor_id` – unique ID of the instructor (Primary Key)
- `first_name`, `last_name` – name of the instructor
- `salary` – salary of the instructor
- `department_id` – department of the instructor (Foreign Key)

### 4. Enrollments
Connects students with the courses they have joined.
- `enrollment_id` – unique ID of the enrollment (Primary Key)
- `student_id` – the student (Foreign Key)
- `course_id` – the course (Foreign Key)
- `enrollment_date` – date of enrollment

### 5. Departments
Stores the university departments.
- `department_id` – unique ID of the department (Primary Key)
- `department_name` – name of the department

---

## ⚙️ Project Features

- Creating the database and tables
- Inserting sample data
- CRUD operations (Create, Read, Update, Delete)
- Retrieving students based on enrollment date
- Finding courses by department
- Counting students in courses
- Finding students enrolled in multiple courses
- Calculating average course credits
- Finding maximum instructor salary
- Counting students by department
- INNER JOIN
- LEFT JOIN
- Subqueries
- Extracting year from dates
- Concatenating names
- Using window functions
- Using CASE statements

---

## 🔍 SQL Concepts Used

- CREATE DATABASE
- CREATE TABLE
- INSERT
- SELECT
- UPDATE
- DELETE
- WHERE
- JOIN
- INNER JOIN
- LEFT JOIN
- GROUP BY
- HAVING
- LIMIT
- DISTINCT
- IN
- INTERSECT
- Aggregate functions such as COUNT(), AVG(), MAX()
- Subqueries
- YEAR()
- CONCAT()
- DATEDIFF()
- CASE
- ROW_NUMBER()

---

## 🗃️ Sample Data

The project contains sample records for:

- John Doe
- Jane Smith
- Alice Johnson
- Bob Lee
- Computer Science
- Mathematics
- Introduction to SQL
- Data Structures

---

## ▶️ How to Run the Project

1. Open **MySQL Command Line Client**.
2. Enter your MySQL password.
3. Create the database:
   ```sql
   CREATE DATABASE University;
   ```
4. Select the database:
   ```sql
   USE University;
   ```
5. Create all five tables (Departments, Instructors, Students, Courses, Enrollments).
6. Insert the sample data.
7. Run the queries one by one.
8. Check the output after each query.

---

## 📁 Project Structure

```
University-Course-Management-System/
│
├── Final Project.sql
└── README.md
```

The `Final Project.sql` file contains the database creation, table creation, sample data, and all the SQL queries used in this project.

---

## 📊 Expected Result

This project shows how SQL can be used to store, update, retrieve, and analyze university course-related information. After running the queries, the output displays details such as student lists, course counts, department-wise data, and enrollment information.

---

## 👩‍💻 Author

**Pankti Patel**

---

⭐ Thank you for taking the time to look at my project. I hope it helps you understand how a simple database system works. 😊
