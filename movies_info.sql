CREATE DATABASE my_movies_info;
USE my_movies_info;
SHOW DATABASES;
CREATE TABLE movies_info (
    movie_id INT PRIMARY KEY, 
    movie_name VARCHAR(100) NOT NULL UNIQUE, 
    release_year INT NOT NULL, 
    genre VARCHAR(50), 
    director VARCHAR(100) NOT NULL, 
    lead_actor VARCHAR(100), 
    imdb_rating DECIMAL(3,1), 
    box_office DECIMAL(15,2) NOT NULL, 
    status VARCHAR(20), 
    duration INT NOT NULL
);

INSERT INTO movies_info VALUES
(1, 'Inception', 2010, 'Sci-Fi', 'Christopher Nolan', 'Leonardo DiCaprio', 8.8, 829895144, 'Released', 148),
(2, 'The Dark Knight', 2008, 'Action', 'Christopher Nolan', 'Christian Bale', 9.0, 1004558444, 'Released', 152),
(3, 'Interstellar', 2014, 'Sci-Fi', 'Christopher Nolan', 'Matthew McConaughey', 8.6, 677471339, 'Released', 169),
(4, 'Titanic', 1997, 'Romance', 'James Cameron', 'Leonardo DiCaprio', 7.9, 2201647264, 'Released', 195),
(5, 'Avatar', 2009, 'Sci-Fi', 'James Cameron', 'Sam Worthington', 7.8, 2923706026, 'Released', 162),
(6, 'Avengers: Endgame', 2019, 'Action', 'Anthony Russo', 'Robert Downey Jr.', 8.4, 2797800564, 'Released', 181),
(7, 'Joker', 2019, 'Drama', 'Todd Phillips', 'Joaquin Phoenix', 8.4, 1074251311, 'Released', 122),
(8, 'Parasite', 2019, 'Thriller', 'Bong Joon-ho', 'Song Kang-ho', 8.6, 263889051, 'Released', 132),
(9, 'The Godfather', 1972, 'Crime', 'Francis Ford Coppola', 'Marlon Brando', 9.2, 246120974, 'Released', 175),
(10, 'The Shawshank Redemption', 1994, 'Drama', 'Frank Darabont', 'Tim Robbins', 9.3, 28341469, 'Released', 142),
(11, 'Forrest Gump', 1994, 'Drama', 'Robert Zemeckis', 'Tom Hanks', 8.8, 678222864, 'Released', 142),
(12, 'The Matrix', 1999, 'Sci-Fi', 'Lana Wachowski', 'Keanu Reeves', 8.7, 463517383, 'Released', 136),
(13, 'Fight Club', 1999, 'Drama', 'David Fincher', 'Brad Pitt', 8.8, 101209345, 'Released', 139),
(14, 'The Lion King', 1994, 'Animation', 'Roger Allers', 'Matthew Broderick', 8.5, 987483777, 'Released', 88),
(15, 'Gladiator', 2000, 'Action', 'Ridley Scott', 'Russell Crowe', 8.5, 460583960, 'Released', 155),
(16, 'The Avengers', 2012, 'Action', 'Joss Whedon', 'Robert Downey Jr.', 8.0, 1518812988, 'Released', 143),
(17, 'Black Panther', 2018, 'Action', 'Ryan Coogler', 'Chadwick Boseman', 7.3, 1346913161, 'Released', 134),
(18, 'Iron Man', 2008, 'Action', 'Jon Favreau', 'Robert Downey Jr.', 7.9, 585796247, 'Released', 126),
(19, 'Deadpool', 2016, 'Comedy', 'Tim Miller', 'Ryan Reynolds', 8.0, 783112979, 'Released', 108),
(20, 'Django Unchained', 2012, 'Western', 'Quentin Tarantino', 'Jamie Foxx', 8.4, 449888588, 'Released', 165);

ALTER TABLE movies_info ADD COLUMN movie_category VARCHAR(20);

SET SQL_SAFE_UPDATES = 0;
SET SQL_SAFE_UPDATES = 1;

UPDATE movies_info  
SET movie_category =  
    CASE  
        WHEN imdb_rating >= 9 THEN 'Legendary'  
        WHEN imdb_rating >= 8 THEN 'Blockbuster'  
        ELSE 'Hit'  
    END;

SELECT 
    COUNT(movie_id) AS total_movies,
    AVG(imdb_rating) AS avg_rating,
    SUM(box_office) AS total_revenue,
    MIN(imdb_rating) AS min_rating,
    MAX(imdb_rating) AS max_rating
FROM movies_info;

SELECT genre, COUNT(movie_id) AS movie_count, AVG(imdb_rating) AS avg_rating
FROM movies_info
GROUP BY genre
HAVING COUNT(movie_id) > 2; 