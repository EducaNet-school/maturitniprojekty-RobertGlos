SELECT m.movie_name, COUNT(DISTINCT a.actor_id) AS actor_count
FROM movies m
JOIN movie_actors ma ON m.movie_id = ma.movie_id
JOIN actors a ON ma.actor_id = a.actor_id
GROUP BY m.movie_id, m.movie_name;

SELECT actors.first_name, actors.last_name, movies.movie_name
FROM actors
JOIN movie_actors ON actors.actor_id = movie_actors.actor_id
JOIN movies ON movie_actors.movie_id = movies.movie_id
ORDER BY actors.last_name, actors.first_name;

SELECT c.category_name, m.movie_name, m.movie_length
FROM Category c
JOIN filmCategory fc ON c.category_id = fc.category_id
JOIN movies m ON fc.movie_id = m.movie_id
WHERE m.movie_length = (
    SELECT MAX(movie_length) 
    FROM movies 
    JOIN filmCategory ON movies.movie_id = filmCategory.movie_id 
    WHERE filmCategory.category_id = c.category_id
);
SELECT a.first_name, a.last_name
FROM actors a
JOIN movie_actors ma ON a.actor_id = ma.actor_id
JOIN movies m ON ma.movie_id = m.movie_id
JOIN filmCategory fc ON m.movie_id = fc.movie_id
JOIN Category c ON fc.category_id = c.category_id
WHERE c.category_name = 'comedy';

SELECT m.movie_name, COUNT(*) as num_awards
FROM movies m
JOIN awards a ON m.movie_id = a.film_id
GROUP BY m.movie_id
ORDER BY num_awards DESC;