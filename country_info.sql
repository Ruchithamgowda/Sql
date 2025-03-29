CREATE DATABASE my_country_info;

USE my_country_info;

SHOW DATABASES;

CREATE TABLE country_info (
    country_id INT PRIMARY KEY,
    country_name VARCHAR(50),
    continent VARCHAR(50),
    population BIGINT,
    gdp FLOAT,
    currency VARCHAR(20)
);

INSERT INTO country_info (country_id, country_name, continent, population, gdp, currency) VALUES
(1, 'India', 'Asia', 1400000000, 3.73, 'INR'),
(2, 'USA', 'North America', 331000000, 21.43, 'USD'),
(3, 'China', 'Asia', 1440000000, 17.73, 'CNY'),
(4, 'Germany', 'Europe', 83000000, 4.5, 'EUR'),
(5, 'France', 'Europe', 67000000, 2.78, 'EUR'),
(6, 'UK', 'Europe', 68000000, 3.13, 'GBP'),
(7, 'Japan', 'Asia', 126000000, 5.08, 'JPY'),
(8, 'Canada', 'North America', 38000000, 1.64, 'CAD'),
(9, 'Australia', 'Oceania', 26000000, 1.4, 'AUD'),
(10, 'Brazil', 'South America', 213000000, 1.84, 'BRL'),
(11, 'Russia', 'Europe/Asia', 146000000, 1.7, 'RUB'),
(12, 'South Korea', 'Asia', 52000000, 1.63, 'KRW'),
(13, 'Italy', 'Europe', 60000000, 2.1, 'EUR'),
(14, 'South Africa', 'Africa', 59000000, 0.35, 'ZAR'),
(15, 'Mexico', 'North America', 126000000, 1.27, 'MXN');

SHOW TABLES;

SELECT * FROM country_info;

//OR 
SELECT * FROM country_info WHERE continent = 'Asia' OR continent = 'North America';

//IN
SELECT * FROM country_info WHERE continent IN ('Europe', 'Asia', 'South America');

//NOT IN
SELECT * FROM country_info WHERE continent NOT IN ('Europe', 'Oceania');

// BETWEEN 
SELECT * FROM country_info WHERE population BETWEEN 100000000 AND 1500000000;


//NOT BETWEEN
SELECT * FROM country_info WHERE gdp NOT BETWEEN 1000000000000 AND 5000000000000;

//AND
SELECT * FROM country_info WHERE gdp > 2000000000000 AND continent = 'Asia';

