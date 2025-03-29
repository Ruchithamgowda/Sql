CREATE DATABASE my_state_info;

USE my_state_info;

SHOW DATABASES;

CREATE TABLE state_info (
    state_id INT PRIMARY KEY,
    state_name VARCHAR(50),
    country VARCHAR(50),
    population BIGINT,
    area FLOAT,
    capital VARCHAR(50)
);

INSERT INTO state_info (state_id, state_name, country, population, area, capital) VALUES
(1, 'Karnataka', 'India', 68000000, 191791, 'Bangalore'),
(2, 'Maharashtra', 'India', 124000000, 307713, 'Mumbai'),
(3, 'California', 'USA', 39500000, 423967, 'Sacramento'),
(4, 'New York', 'USA', 19400000, 141297, 'Albany'),
(5, 'Bavaria', 'Germany', 13000000, 70542, 'Munich'),
(6, 'Queensland', 'Australia', 5200000, 1851736, 'Brisbane'),
(7, 'Ontario', 'Canada', 14600000, 1076395, 'Toronto'),
(8, 'Sao Paulo', 'Brazil', 46000000, 248222, 'Sao Paulo'),
(9, 'Tokyo', 'Japan', 14000000, 2194, 'Tokyo'),
(10, 'Seoul', 'South Korea', 9600000, 605, 'Seoul'),
(11, 'Moscow', 'Russia', 12600000, 2561, 'Moscow'),
(12, 'Ile-de-France', 'France', 12000000, 12012, 'Paris'),
(13, 'Gauteng', 'South Africa', 15000000, 18178, 'Johannesburg'),
(14, 'Mexico City', 'Mexico', 9200000, 1485, 'Mexico City'),
(15, 'Lombardy', 'Italy', 10000000, 23894, 'Milan');

SHOW TABLES;

SELECT * FROM state_info;

//IN
SELECT * FROM state_info WHERE capital IN ('Mumbai', 'Bangalore');

NOT IN
SELECT * FROM state_info WHERE capital NOT IN ('Tokyo', 'Quebec City');

//BETWEEN
SELECT * FROM state_info WHERE population BETWEEN 10000000 AND 50000000;

//NOT BETWEEN
SELECT * FROM state_info WHERE area NOT BETWEEN 50000 AND 500000;

//AND
SELECT * FROM state_info WHERE country = 'India' AND population > 50000000;

//OR
SELECT * FROM state_info WHERE country = 'USA' OR country = 'Japan';

