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

SELECT SUM(domestic_box_gross) AS domestic_gross
FROM jlg_movies
Where title = 'Frozen';

SELECT writer
from jlg_movies
where title = 'Dumbo';

SELECT count(e_city) as Atlanta_Theatres
from jlg_theatres
where  e_city = 'Atlanta';

select * from jlg_now_showing ns
join jlg_theatres t
on ns.theater_id = t.location_id
where ns.now_showing = '2015-4-12'
and t.e_city = 'Centre'
and t.e_state = 'AL'
and (
    ns.show_times LIKE '%12:%'
    or ns.show_times LIKE '%13:%'
    or ns.show_times LIKE '%14:00%'
    )

SELECT m.director
FROM jlg_movies m
JOIN jlg_now_showing ns
ON m.imdb_id = ns.imdb_id
JOIN jlg_theatres t
on t.location_id = ns.theater_id
Where t.e_address = '70 W Duval Mine Rd'
And t.e_city = 'Green Valley'
And t.e_state = 'AZ'
AND ns.now_showing LIKE '%10:20'
AND ns.now_showing = '2017-12-03'
