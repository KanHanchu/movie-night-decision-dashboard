USE [movie-night-decision-dashboard];
GO

-- Preview dataset

SELECT TOP 20 *
FROM movies_clean;

-- Average rating

SELECT AVG(rating) AS avg_rating
FROM movies_clean;

-- Median rating

SELECT DISTINCT
PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY rating) OVER () AS median_rating
FROM movies_clean;

-- Movies per year

SELECT
    year,
    COUNT(*) AS movie_count
FROM movies_clean
GROUP BY year
ORDER BY year;

-- Runtime distribution

SELECT
    runtime_minutes,
    COUNT(*) AS movie_count
FROM movies_clean
GROUP BY runtime_minutes
ORDER BY runtime_minutes;

-- Top rated movies

SELECT TOP 20
    title,
    rating,
    votes
FROM movies_clean
ORDER BY rating DESC, votes DESC;