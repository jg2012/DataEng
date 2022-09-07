USE [pt-students-2022-8-30-de-eastern];

DROP TABLE IF EXISTS jlg_movies;

DROP TABLE IF EXISTS jlg_now_showing;
DROP TABLE IF EXISTS jlg_theatres;
DROP TABLE IF EXISTS jlg_theater_adj_zips;
DROP TABLE IF EXISTS jlg_adj_zips_dist;
DROP TABLE IF EXISTS jlg_royal_loal;


SELECT * INTO jlg_movies From rds_stream.dbo.movies;
SELECT TOP 10000 * INTO jlg_now_showing FROM rds_stream.dbo.now_showing;
SELECT TOP 10000 *INTO jlg_theatres FROM rds_stream.dbo.theaters;
SELECT TOP 10000 * INTO jlg_theater_adj_zips FROM rds_stream.dbo.theater_adj_zips;
SELECT TOP 10000 *INTO jlg_adj_zips_dist FROM rds_stream.dbo.adj_zip_dist;
SELECT TOP 10000 * INTO jlg_royal_loyal FROM rds_stream.dbo.royal_loyal;

SELECT * INTO jlg_movies2 FROM jlg_movies;
SELECT TOP 10 * FROM jlg_movies2;

SELECT TOP 10
    imdb_id,
    release_date,
    running_time_in_min,
    writer,
    actors,
    country,
    dvd_date,
    poster,
    imdb_rating,
    world_box_gross,
    international_box_gross,
    tickets_sold
FROM jlg_movies2

SELECT COUNT(*)
From jlg_movies2

SELECT count(DISTINCT title)
FROM jlg_movies2;

SELECT count(Distinct title)
from jlg_movies2
where actors LIKE '%Joaquin Phoenix%';

Select release_year, tickets_sold
from jlg_movies
WHERE release_year = 2020 , count(tickets_sold);

SELECT SUM(tickets_sold) AS tickets_sold
from jlg_movies
Where release_year = 2020;