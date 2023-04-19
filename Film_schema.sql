create database film_kartoteka;
use film_kartoteka;
CREATE TABLE movies (
    movie_id INT AUTO_INCREMENT PRIMARY KEY,
    movie_name VARCHAR(255) NOT NULL,
    description TEXT,
    movie_length INT,
    release_date DATE
);

CREATE TABLE actors (
    actor_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL
);

CREATE TABLE movie_actors (
    movie_id INT,
    actor_id INT,
    PRIMARY KEY (movie_id, actor_id),
    FOREIGN KEY (movie_id) REFERENCES movies(movie_id),
    FOREIGN KEY (actor_id) REFERENCES actors(actor_id)
);
 
CREATE TABLE awards (
    award_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    date DATE,
    place VARCHAR(255),
    film_id INT,
    FOREIGN KEY (film_id) REFERENCES movies(movie_id)
);

CREATE TABLE Category (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(255) NOT NULL
);

CREATE TABLE filmCategory (
    movie_id INT NOT NULL,
    category_id INT NOT NULL,
    PRIMARY KEY (movie_id, category_id),
    FOREIGN KEY (movie_id) REFERENCES movies(movie_id),
    FOREIGN KEY (category_id) REFERENCES Category(category_id)
);
DELIMITER //

CREATE FUNCTION get_longest_movie_in_category(category_name VARCHAR(255))
RETURNS VARCHAR(255)
BEGIN
    DECLARE max_length INT;
    DECLARE movie_name VARCHAR(255);

    SELECT MAX(m.movie_length) INTO max_length
    FROM movies m
    JOIN filmCategory fc ON m.movie_id = fc.movie_id
    JOIN Category c ON fc.category_id = c.category_id
    WHERE c.category_name = category_name;

    RETURN max_length;
END //

CREATE PROCEDURE delete_empty_categories()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE category_id INT;
    DECLARE category_name VARCHAR(255);

    DECLARE category_cursor CURSOR FOR SELECT category_id, category_name FROM Category;

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    OPEN category_cursor;

    category_loop: LOOP
        FETCH category_cursor INTO category_id, category_name;

        IF done THEN
            LEAVE category_loop;
        END IF;
        IF NOT EXISTS (
            SELECT 1 FROM filmCategory WHERE category_id = category_id
        ) THEN
            DELETE FROM Category WHERE category_id = category_id;
            SELECT CONCAT('Deleted empty category: ', category_name);
        END IF;
    END LOOP;

    -- Close the cursor
    CLOSE category_cursor;
END //
DELIMITER ;
CREATE VIEW movie_actor_count AS
SELECT m.movie_id, m.movie_name, COUNT(DISTINCT a.actor_id) AS actor_count
FROM movies m
JOIN filmActor fa ON m.movie_id = fa.movie_id
JOIN actors a ON fa.actor_id = a.actor_id
GROUP BY m.movie_id, m.movie_name;
