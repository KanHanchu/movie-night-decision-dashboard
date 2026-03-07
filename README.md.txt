# Movie Night Decision Dashboard

SQL + Power BI analysis of an IMDB movie dataset to help users quickly choose a movie based on ratings, runtime, and genre.

## Goals
- Explore patterns in movie ratings and genres
- Identify highly rated but lesser-known movies ("hidden gems")
- Analyze genre popularity and rating distributions

## Dataset
~5000 movies including:
- title
- year
- rating
- votes
- runtime
- genres
- directors

## SQL Techniques Used
- Data cleaning
- STRING_SPLIT for genre normalization
- JOIN between movies and genre tables
- Aggregate functions
- Window functions (ROW_NUMBER)
- Exploratory data analysis

## Next Steps
Create a Power BI dashboard for interactive movie exploration.