CREATE DATABASE bmtc_details;
USE bmtc_details;
SHOW DATABASES;

CREATE TABLE bmtc_details (
    bus_id INT PRIMARY KEY,
    route_no VARCHAR(10),
    bus_type VARCHAR(20),
    source VARCHAR(50),
    destination VARCHAR(50),
    total_seats INT,
    available_seats INT,
    fare DECIMAL(5,2),
    driver_name VARCHAR(50),
    conductor_name VARCHAR(50)
);

INSERT INTO bmtc_details VALUES

(1, '201A', 'Volvo', 'Majestic', 'Electronic City', 50, 30, 45.00, 'Ravi Kumar', 'Suresh'),
(2, '202B', 'Ordinary', 'Majestic', 'Banashankari', 55, 20, 20.00, 'Rajesh', 'Anil'),
(3, '203C', 'AC', 'Yeshwantpur', 'Whitefield', 40, 15, 60.00, 'Manoj', 'Ganesh'),
(4, '204D', 'Sleeper', 'Hebbal', 'Silk Board', 35, 10, 70.00, 'Shankar', 'Mohan'),
(5, '205E', 'Non-AC', 'KR Market', 'BTM Layout', 45, 25, 30.00, 'Kiran', 'Deepak'),
(6, '206F', 'Electric', 'Jayanagar', 'Kengeri', 50, 40, 50.00, 'Mahesh', 'Karthik'),
(7, '207G', 'Volvo', 'RT Nagar', 'Electronic City', 50, 35, 55.00, 'Naveen', 'Suman'),
(8, '208H', 'Mini Bus', 'Malleshwaram', 'Hebbal', 30, 18, 25.00, 'Vikas', 'Pradeep'),
(9, '209I', 'Luxury', 'Banashankari', 'K.R. Puram', 60, 50, 80.00, 'Surya', 'Prakash'),
(10, '210J', 'Ordinary', 'Indiranagar', 'Sarjapur', 55, 30, 20.00, 'Santosh', 'Bharath'),
(11, '211K', 'Volvo', 'Kengeri', 'Marathahalli', 50, 28, 65.00, 'Sunil', 'Jeevan'),
(12, '212L', 'Non-AC', 'BTM Layout', 'Majestic', 40, 22, 35.00, 'Ramesh', 'Kumar'),
(13, '213M', 'Sleeper', 'Whitefield', 'K.R. Market', 35, 10, 75.00, 'Harish', 'Sharath'),
(14, '214N', 'Electric', 'Nagawara', 'Electronic City', 50, 45, 55.00, 'Lokesh', 'Girish'),
(15, '215O', 'Luxury', 'Yelahanka', 'Hebbal', 60, 50, 85.00, 'Madan', 'Vijay'),
(16, '216P', 'Mini Bus', 'Rajajinagar', 'Malleshwaram', 30, 20, 25.00, 'Ravi', 'Shashi'),
(17, '217Q', 'AC', 'J.P. Nagar', 'Majestic', 40, 18, 60.00, 'Vivek', 'Vinod'),
(18, '218R', 'Volvo', 'Electronic City', 'Hebbal', 50, 30, 50.00, 'Kishore', 'Deepak'),
(19, '219S', 'Non-AC', 'Silk Board', 'Kengeri', 45, 25, 30.00, 'Arun', 'Shankar'),
(20, '220T', 'Ordinary', 'K.R. Puram', 'Banashankari', 55, 30, 20.00, 'Naresh', 'Gopal');

SELECT * FROM bmtc_details;

CREATE DATABASE tourist_info;
USE tourist_info;
SHOW DATABASES;

CREATE TABLE tourist_info (
    tourist_id INT PRIMARY KEY,
    name VARCHAR(100),
    age INT,
    gender VARCHAR(10),
    nationality VARCHAR(50),
    city_visited VARCHAR(100),
    travel_cost DECIMAL(10,2),
    duration_days INT,
    travel_mode VARCHAR(50),
    rating FLOAT
);

INSERT INTO tourist_info VALUES

('John Doe', 30, 'Male', 'USA', 'Paris', 1500.50, 5, 'Flight', 4.5),
('Jane Smith', 28, 'Female', 'UK', 'Rome', 1200.00, 4, 'Train', 4.0),
('Alice Brown', 35, 'Female', 'Canada', 'Tokyo', 2000.75, 7, 'Flight', 4.8),
('Michael Lee', 40, 'Male', 'Australia', 'Dubai', 1800.25, 6, 'Flight', 4.2),
('David Wilson', 27, 'Male', 'Germany', 'New York', 1600.80, 5, 'Flight', 4.1),
('Emily Davis', 32, 'Female', 'France', 'London', 1300.60, 4, 'Train', 4.6),
('Robert Thomas', 29, 'Male', 'India', 'Sydney', 1400.40, 5, 'Flight', 4.3),
('Sophia Martinez', 33, 'Female', 'Mexico', 'Berlin', 1700.90, 6, 'Bus', 4.4),
('Daniel White', 31, 'Male', 'Brazil', 'Amsterdam', 1550.70, 5, 'Flight', 4.7),
('Olivia Harris', 26, 'Female', 'Japan', 'Singapore', 1900.10, 7, 'Flight', 4.9),
('William Johnson', 45, 'Male', 'USA', 'Bangkok', 1750.50, 6, 'Bus', 4.2),
('Ava Clark', 29, 'Female', 'UK', 'Bali', 1350.25, 5, 'Flight', 4.3),
('James Rodriguez', 38, 'Male', 'Spain', 'Vienna', 1450.80, 4, 'Train', 4.5),
('Isabella Lewis', 31, 'Female', 'Italy', 'Madrid', 1250.60, 5, 'Train', 4.1),
('Benjamin Walker', 34, 'Male', 'Netherlands', 'Istanbul', 1600.30, 6, 'Flight', 4.6),
('Charlotte Hall', 36, 'Female', 'Sweden', 'Seoul', 1850.90, 7, 'Flight', 4.7),
('Henry Adams', 28, 'Male', 'Norway', 'Mumbai', 1150.70, 5, 'Train', 4.3),
('Mia Nelson', 30, 'Female', 'Finland', 'Hong Kong', 1950.10, 6, 'Flight', 4.8),
('Alexander Carter', 37, 'Male', 'Russia', 'Toronto', 1400.50, 4, 'Bus', 4.4),
('Sophie Bennett', 25, 'Female', 'China', 'San Francisco', 1750.00, 5, 'Flight', 4.5);

 Performing Aggregate Functions
 
SELECT COUNT(*) AS total_buses, AVG(fare) AS avg_fare, MAX(fare) AS max_fare, MIN(fare) AS min_fare 
FROM bmtc_details;

SELECT COUNT(*) AS total_tourists, AVG(package_cost) AS avg_package_cost, SUM(package_cost) AS total_revenue 
FROM tourist_info;

 Performing Group By and Having
 
SELECT bus_type, COUNT(*) AS bus_count, AVG(fare) AS avg_fare 
FROM bmtc_details 
GROUP BY bus_type 
HAVING AVG(fare) > 40.00;

SELECT package_type, COUNT(*) AS package_count, AVG(package_cost) AS avg_cost 
FROM tourist_info 
GROUP BY package_type 
HAVING COUNT(*) > 3;
