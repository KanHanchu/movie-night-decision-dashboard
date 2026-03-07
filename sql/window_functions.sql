USE [movie-night-decision-dashboard];
GO
-- Rank movies within each genre

SELECT
    g.genre,
    m.title,
    m.rating,
    m.votes,
    ROW_NUMBER() OVER(
        PARTITION BY g.genre
        ORDER BY m.rating DESC, m.votes DESC
    ) AS genre_rank
FROM movies_clean m
JOIN movie_genres_1 g
ON m.movie_id = g.ID;

-- Top movie per genre

SELECT *
FROM (
    SELECT
        g.genre,
        m.title,
        m.rating,
        ROW_NUMBER() OVER(
            PARTITION BY g.genre
            ORDER BY m.rating DESC, m.votes DESC
        ) AS rank_in_genre
    FROM movies_clean m
    JOIN movie_genres_1 g
    ON m.movie_id = g.ID
) ranked
WHERE rank_in_genre = 1;