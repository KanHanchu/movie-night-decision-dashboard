USE [movie-night-decision-dashboard];
GO
-- Genre popularity

SELECT
    genre,
    COUNT(*) AS movie_count
FROM movie_genres_1
GROUP BY genre
ORDER BY movie_count DESC;

-- Average rating by genre

SELECT
    g.genre,
    AVG(m.rating) AS avg_rating,
    COUNT(*) AS movie_count,
    AVG(m.votes) AS avg_votes
FROM movies_clean m
JOIN movie_genres_1 g
ON m.movie_id = g.ID
GROUP BY g.genre
ORDER BY avg_rating DESC;

-- Hidden gems

SELECT
    g.genre,
    m.title,
    m.rating,
    m.votes
FROM movies_clean m
JOIN movie_genres_1 g
ON m.movie_id = g.ID
WHERE m.rating >= 8
AND m.votes < 50000
ORDER BY m.rating DESC;

-- Top drama movies

SELECT
    m.title,
    m.rating,
    m.votes
FROM movies_clean m
JOIN movie_genres_1 g
ON m.movie_id = g.ID
WHERE g.genre = 'Drama'
ORDER BY m.rating DESC;