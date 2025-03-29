CREATE DATABASE my_pkl_info;
USE my_pkl_info;
SHOW DATABASES;
DROP DATABASE my_pkl_info;
CREATE TABLE pkl_info (
    player_id INT PRIMARY KEY,
    player_name VARCHAR(100) NOT NULL UNIQUE,
    age INT NOT NULL,
    team VARCHAR(100) NOT NULL,
    position VARCHAR(50) NOT NULL,
    total_points INT NOT NULL,
    matches_played INT NOT NULL,
    status VARCHAR(50) NOT NULL,
    experience INT NOT NULL,
    salary DECIMAL(10,2) NOT NULL UNIQUE
);

SELECT * FROM pkl_info;

INSERT INTO pkl_info VALUES  
(1, 'Pardeep Narwal', 26, 'UP Yoddhas', 'Raider', 1200, 130, 'Active', 6, 7500000.00),  
(2, 'Maninder Singh', 30, 'Bengal Warriors', 'Raider', 980, 110, 'Active', 8, 6000000.00),  
(3, 'Fazel Atrachali', 31, 'Gujarat Giants', 'Defender', 250, 125, 'Active', 9, 5000000.00),  
(4, 'Naveen Kumar', 24, 'Dabang Delhi', 'Raider', 1050, 95, 'Active', 4, 7000000.00),  
(5, 'Sandeep Narwal', 32, 'U Mumba', 'All-Rounder', 480, 140, 'Retired', 10, 4500000.00),  
(6, 'Ajay Thakur', 35, 'Tamil Thalaivas', 'Raider', 800, 130, 'Retired', 12, 5500000.00),  
(7, 'Surjeet Singh', 29, 'Telugu Titans', 'Defender', 300, 100, 'Active', 7, 4701000.00),  -- Updated to avoid duplicate salary
(8, 'Rahul Chaudhari', 30, 'Jaipur Pink Panthers', 'Raider', 1100, 150, 'Active', 9, 6800000.00),  
(9, 'Mohit Chhillar', 31, 'Bengaluru Bulls', 'Defender', 270, 120, 'Active', 8, 4900000.00),  
(10, 'Deepak Hooda', 29, 'Jaipur Pink Panthers', 'All-Rounder', 650, 140, 'Active', 7, 5200000.00),  
(11, 'Rohit Kumar', 28, 'Patna Pirates', 'Raider', 950, 135, 'Active', 6, 6300000.00),  
(12, 'Siddharth Desai', 27, 'Telugu Titans', 'Raider', 720, 80, 'Active', 5, 5100000.00),  
(13, 'Nitin Tomar', 28, 'Puneri Paltan', 'Raider', 640, 100, 'Active', 6, 5300000.00),  
(14, 'Joginder Narwal', 34, 'Dabang Delhi', 'Defender', 210, 90, 'Active', 8, 4200000.00),  
(15, 'Vishal Bharadwaj', 26, 'Telugu Titans', 'Defender', 320, 110, 'Active', 5, 4800000.00),  
(16, 'Neeraj Kumar', 27, 'Patna Pirates', 'Defender', 290, 105, 'Active', 6, 4600000.00),  
(17, 'Sunil Kumar', 28, 'Gujarat Giants', 'Defender', 310, 115, 'Active', 7, 4702000.00),  -- Updated to avoid duplicate salary
(18, 'Vikas Kandola', 25, 'Haryana Steelers', 'Raider', 880, 90, 'Active', 4, 5900000.00),  
(19, 'Abhishek Singh', 26, 'U Mumba', 'Raider', 790, 85, 'Active', 5, 5800000.00),  
(20, 'Rinku Narwal', 27, 'Bengal Warriors', 'Defender', 280, 95, 'Active', 7, 4000000.00);

ALTER TABLE pkl_info ADD COLUMN player_rank VARCHAR(20);

SET SQL_SAFE_UPDATES = 0;
SET SQL_SAFE_UPDATES = 1;
UPDATE pkl_info 
SET player_rank = 
    CASE 
        WHEN total_points >= 1000 THEN 'Elite'
        WHEN total_points >= 700 THEN 'Pro'
        WHEN total_points >= 400 THEN 'Intermediate'
        ELSE 'Beginner'
    END;
    
    SELECT 
    COUNT(*) AS total_players,
    AVG(age) AS avg_age,
    MAX(salary) AS highest_salary,
    MIN(salary) AS lowest_salary,
    SUM(total_points) AS total_points_sum
FROM pkl_info;

SELECT team, COUNT(player_id) AS total_players, AVG(salary) AS avg_salary
FROM pkl_info
GROUP BY team
HAVING AVG(salary) > 5000000;

SELECT player_rank, COUNT(player_id) AS total_players
FROM pkl_info
GROUP BY player_rank
HAVING COUNT(player_id) > 2;


