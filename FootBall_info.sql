CREATE DATABASE my_FootBall_info;
USE my_FootBall_info;
SHOW DATABASES;

CREATE TABLE FootBall_info (
    Player_ID INT PRIMARY KEY,
    Player_Name VARCHAR(50),
    Age INT,
    Country VARCHAR(50),
    Matches_Played INT,
    Goals_Scored INT,
    Assists INT,
    Yellow_Cards INT,
    Red_Cards INT,
    Position VARCHAR(30)
);

INSERT INTO FootBall_info VALUES
(1, 'Lionel Messi', 37, 'Argentina', 800, 750, 300, 50, 2, 'Forward'),
(2, 'Cristiano Ronaldo', 39, 'Portugal', 900, 800, 250, 55, 3, 'Forward'),
(3, 'Neymar', 34, 'Brazil', 500, 400, 200, 60, 5, 'Forward'),
(4, 'Kevin De Bruyne', 33, 'Belgium', 400, 150, 350, 40, 1, 'Midfielder'),
(5, 'Kylian Mbappe', 26, 'France', 350, 250, 150, 30, 0, 'Forward'),
(6, 'Luka Modric', 39, 'Croatia', 600, 120, 400, 35, 1, 'Midfielder'),
(7, 'Sergio Ramos', 38, 'Spain', 650, 100, 50, 150, 10, 'Defender'),
(8, 'Virgil van Dijk', 33, 'Netherlands', 450, 50, 20, 40, 3, 'Defender'),
(9, 'Robert Lewandowski', 37, 'Poland', 550, 500, 120, 20, 0, 'Forward'),
(10, 'Harry Kane', 32, 'England', 480, 350, 110, 15, 1, 'Forward'),
(11, 'Erling Haaland', 25, 'Norway', 180, 200, 50, 10, 0, 'Forward'),
(12, 'Bruno Fernandes', 31, 'Portugal', 300, 100, 200, 25, 0, 'Midfielder'),
(13, 'Mohamed Salah', 32, 'Egypt', 450, 320, 130, 18, 1, 'Forward'),
(14, 'Manuel Neuer', 39, 'Germany', 700, 0, 20, 5, 0, 'Goalkeeper'),
(15, 'Karim Benzema', 38, 'France', 600, 400, 150, 10, 0, 'Forward');

SHOW TABLES;

SELECT * FROM FootBall_info;
-- Count of players per country
SELECT COUNT(Player_Name) AS No_of_Players, Country 
FROM FootBall_info 
GROUP BY Country;

-- Count of goals per country (Assuming "Club" column exists)
SELECT COUNT(Total_Goals) AS No_of_Goals, Country 
FROM FootBall_info 
GROUP BY Country;

-- Maximum matches played per country
SELECT MAX(Games_Played) AS Max_Matches, Country 
FROM FootBall_info 
GROUP BY Country;

-- Minimum yellow cards per position
SELECT MIN(Yellow_Cards) AS Min_Cards, Position 
FROM FootBall_info 
GROUP BY Position;

-- Average matches played per country
SELECT AVG(Games_Played) AS Avg_Matches, Country 
FROM FootBall_info 
GROUP BY Country;
