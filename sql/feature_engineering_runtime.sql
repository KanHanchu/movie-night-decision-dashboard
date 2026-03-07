USE [movie-night-decision-dashboard];
GO
-- Runtime bucket classification

SELECT
    movie_id,
    title,
    runtime_minutes,
    CASE
        WHEN runtime_minutes < 90 THEN 'short'
        WHEN runtime_minutes BETWEEN 90 AND 120 THEN 'medium'
        WHEN runtime_minutes BETWEEN 120 AND 150 THEN 'long'
        ELSE 'epic'
    END AS runtime_bucket
FROM movies_clean;

-- Runtime bucket statistics

SELECT
    CASE
        WHEN runtime_minutes < 90 THEN 'short'
        WHEN runtime_minutes BETWEEN 90 AND 120 THEN 'medium'
        WHEN runtime_minutes BETWEEN 120 AND 150 THEN 'long'
        ELSE 'epic'
    END AS runtime_bucket,
    AVG(rating) AS avg_rating,
    COUNT(*) AS movie_count
FROM movies_clean
GROUP BY
    CASE
        WHEN runtime_minutes < 90 THEN 'short'
        WHEN runtime_minutes BETWEEN 90 AND 120 THEN 'medium'
        WHEN runtime_minutes BETWEEN 120 AND 150 THEN 'long'
        ELSE 'epic'
    END
ORDER BY avg_rating DESC;