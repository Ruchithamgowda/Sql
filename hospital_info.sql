CREATE DATABASE my_hospital_info;

USE my_hospital_info;

SHOW DATABASES;

CREATE TABLE hospital_info (
    hospital_id INT PRIMARY KEY,
    hospital_name VARCHAR(100),
    city VARCHAR(50),
    state VARCHAR(50),
    country VARCHAR(50),
    established_year INT
);

INSERT INTO hospital_info (hospital_id, hospital_name, city, state, country, established_year) VALUES
(1, 'Apollo Hospital', 'Bangalore', 'Karnataka', 'India', 1983),
(2, 'Fortis Hospital', 'Mumbai', 'Maharashtra', 'India', 1996),
(3, 'Narayana Health', 'Chennai', 'Tamil Nadu', 'India', 2000),
(4, 'Manipal Hospital', 'Bangalore', 'Karnataka', 'India', 1991),
(5, 'Columbia Asia Hospital', 'Delhi', 'Delhi', 'India', 2005),
(6, 'St. John’s Hospital', 'Hyderabad', 'Telangana', 'India', 1963),
(7, 'BGS Global Hospital', 'Bangalore', 'Karnataka', 'India', 2007),
(8, 'Sakra World Hospital', 'Kolkata', 'West Bengal', 'India', 2014),
(9, 'Vydehi Hospital', 'Pune', 'Maharashtra', 'India', 2000),
(10, 'Ramaiah Hospital', 'Bangalore', 'Karnataka', 'India', 2004),
(11, 'Sparsh Hospital', 'Ahmedabad', 'Gujarat', 'India', 2006),
(12, 'Cloudnine Hospital', 'Bangalore', 'Karnataka', 'India', 2007),
(13, 'Kidwai Cancer Institute', 'Bangalore', 'Karnataka', 'India', 1973),
(14, 'Jayadeva Cardiology', 'Bangalore', 'Karnataka', 'India', 1972),
(15, 'KLES Hospital', 'Belagavi', 'Karnataka', 'India', 2006);

SHOW TABLES;

SELECT * FROM hospital_info;
//AND
SELECT * FROM hospital_info WHERE state = 'Maharashtra' AND city = 'Mumbai' AND hospital_id = 5;
// OR
SELECT * FROM hospital_info WHERE bed_capacity > 1000 OR city = 'Mumbai';
// IN
SELECT * FROM hospital_info WHERE state IN ('Maharashtra', 'Karnataka', 'Delhi');
// NOT IN
SELECT * FROM hospital_info WHERE state NOT IN ('Maharashtra', 'Karnataka', 'Delhi');
//BETWEEN
SELECT * FROM hospital_info WHERE established_year BETWEEN 1900 AND 2000;
//NOT BETWEEN
SELECT * FROM hospital_info WHERE established_year NOT BETWEEN 1900 AND 2000;
//Like (letter ends '%letter')
SELECT * FROM hospital_info WHERE city LIKE '%E';
//NOT Like (letter start with 'letter%')
SELECT * FROM hospital_info WHERE city LIKE 'M%';