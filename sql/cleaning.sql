-- ==========================================
-- File: 01_data_cleaning.sql
-- Purpose: Prepare dataset tables
-- ==========================================

-- Original dataset: dbo.IMDB

-- Clean movie table created from IMDB


USE [movie-night-decision-dashboard];
GO
SELECT
    ID AS movie_id,
    title,
    year,
    runtime_minutes,
    rating,
    votes,
    directors,
    imdb_link
INTO movies_clean
FROM dbo.IMDB;

-- Split genres into separate rows

SELECT
    ID,
    TRIM(value) AS genre
INTO movie_genres_1
FROM dbo.IMDB
CROSS APPLY STRING_SPLIT(genres, ',');