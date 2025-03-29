CREATE DATABASE my_Cricket_info;
USE my_Cricket_info;
SHOW DATABASES;

CREATE TABLE Cricket_info (
    Player_ID INT PRIMARY KEY,
    Player_Name VARCHAR(50),
    Age INT,
    Country VARCHAR(50),
    Matches_Played INT,
    Runs_Scored INT,
    Wickets_Taken INT,
    Batting_Avg FLOAT,
    Bowling_Avg FLOAT,
    Role VARCHAR(30)
);

INSERT INTO Cricket_info VALUES
(1, 'Virat Kohli', 35, 'India', 250, 12000, 4, 57.5, 0.0, 'Batsman'),
(2, 'MS Dhoni', 42, 'India', 350, 10500, 1, 50.2, 0.0, 'Wicketkeeper'),
(3, 'Joe Root', 33, 'England', 200, 9000, 5, 50.1, 30.0, 'Batsman'),
(4, 'Jasprit Bumrah', 30, 'India', 100, 500, 250, 12.5, 25.0, 'Bowler'),
(5, 'Steve Smith', 34, 'Australia', 180, 8500, 3, 52.0, 0.0, 'Batsman'),
(6, 'Ben Stokes', 32, 'England', 120, 5000, 150, 40.2, 35.5, 'All-rounder'),
(7, 'Kane Williamson', 33, 'New Zealand', 140, 8000, 2, 55.0, 0.0, 'Batsman'),
(8, 'David Warner', 37, 'Australia', 160, 7500, 1, 48.0, 0.0, 'Batsman'),
(9, 'Babar Azam', 30, 'Pakistan', 130, 7000, 0, 50.5, 0.0, 'Batsman'),
(10, 'Pat Cummins', 31, 'Australia', 90, 1200, 200, 25.0, 22.0, 'Bowler'),
(11, 'Hardik Pandya', 30, 'India', 70, 1500, 70, 35.0, 28.0, 'All-rounder'),
(12, 'Shakib Al Hasan', 38, 'Bangladesh', 200, 6000, 250, 45.5, 30.0, 'All-rounder'),
(13, 'Faf du Plessis', 39, 'South Africa', 170, 7000, 1, 45.2, 0.0, 'Batsman'),
(14, 'Mitchell Starc', 33, 'Australia', 120, 1000, 230, 20.0, 24.5, 'Bowler'),
(15, 'Rohit Sharma', 37, 'India', 230, 11000, 2, 51.5, 0.0, 'Batsman');

SHOW TABLES;

SELECT * FROM Cricket_info;

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

// ADD 2 COLUMNS TO EACH TABLE
ALTER TABLE Cricket_info ADD COLUMN Strike_Rate FLOAT;
ALTER TABLE Cricket_info ADD COLUMN Economy_Rate FLOAT;

ALTER TABLE FootBall_info ADD COLUMN Saves INT;
ALTER TABLE FootBall_info ADD COLUMN Pass_Accuracy FLOAT;

// RENAME 4 COLUMNS
ALTER TABLE Cricket_info RENAME COLUMN Runs_Scored TO Total_Runs;
ALTER TABLE Cricket_info RENAME COLUMN Matches_Played TO Games_Played;

ALTER TABLE FootBall_info RENAME COLUMN Goals_Scored TO Total_Goals;
ALTER TABLE FootBall_info RENAME COLUMN Matches_Played TO Games_Played;

// UPDATE 5 RECORDS IN EACH TABLE USING AND, OR, IN, NOT IN
SET SQL_SAFE_UPDATES = 0;
UPDATE Cricket_info SET Batting_Avg = 55 WHERE Country = 'India' AND Player_Name = 'Virat Kohli';
UPDATE Cricket_info SET Total_Runs = 9500 WHERE Player_ID IN (3, 5);
SET SQL_SAFE_UPDATES = 1;

SET SQL_SAFE_UPDATES = 0;
UPDATE FootBall_info SET Total_Goals = 780 WHERE Player_Name = 'Cristiano Ronaldo' OR Player_Name = 'Lionel Messi';
UPDATE FootBall_info SET Yellow_Cards = 45 WHERE Position = 'Defender' AND Player_Name NOT IN ('Sergio Ramos');
SET SQL_SAFE_UPDATES = 1;

// DELETE 3 RECORDS FROM EACH TABLE
DELETE FROM Cricket_info WHERE Player_ID IN (14, 15, 13);

DELETE FROM FootBall_info WHERE Player_ID NOT IN (1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12);

// FETCH DATA USING DIFFERENT CONDITIONS
SELECT * FROM Cricket_info WHERE Age BETWEEN 30 AND 35;

SELECT * FROM FootBall_info WHERE Position LIKE 'For%';

INSTR: INSTRING:

'BANGALORE' 
SELECT INSTR('string', 'character');
SELECT INSTR('Bangalore', 'n'); 
SELECT INSTR('Bangalore', 'a'); 

SELECT Player_Name, INSTR(Player_Name, 'k') AS Position FROM Cricket_info;

substr:

Bangalore
SELECT SUBSTR('Karnataka', 1, 5); 
SELECT Country, SUBSTR(Country, 2, 8) FROM Cricket_info;

Length:

SELECT Player_Name, LENGTH(Player_Name) AS Name_Length FROM Cricket_info;

LTRIM: LEFT REMOVE
RTRIM: RIGHT REMOVE

SELECT Player_Name, LTRIM(Player_Name) FROM Cricket_info; 
SELECT Player_Name, RTRIM(Player_Name) FROM Cricket_info; 


SELECT UPPER(Player_Name) AS Uppercase_Name FROM Cricket_info;
SELECT LOWER(Player_Name) AS Lowercase_Name FROM Cricket_info;


concat:

SELECT CONCAT(name,team,country,matches,runs,wickets) from cricket_info;


Aggregate Functions:
Alias: 
1) count:
SELECT COUNT(*) AS No_of_Players FROM Cricket_info;
SELECT COUNT(Country) FROM Cricket_info;

select * from cricket_info;

2) sum:
SELECT SUM(Wickets_Taken) AS Total_Wickets FROM Cricket_info;


3) max:
SELECT MAX(Runs_Scored) AS High_Score FROM Cricket_info;


4) min:
SELECT MIN(Runs_Scored) AS Min_Runs FROM Cricket_info;

5) avg:
SELECT avg(runs) as avg_runs from cricket_info;
