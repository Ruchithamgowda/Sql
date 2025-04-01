CREATE DATABASE my_student_info;
USE my_student_info
SHOW DATABASES;

CREATE TABLE student_info (
    student_usn INT,
    student_name VARCHAR(20) NOT NULL UNIQUE,
    student_sem INT NOT NULL,
    branch VARCHAR(20),
    student_age INT UNIQUE,
    student_fees INT, check(student_age<24));
    
    select * from student_info;

