/* 1. How many distinct (different) actors' last names are there?*/

select distinct last_name from actor;

/*2. In how many different languages where the films originally produced? (Use the column `language_id` from the `film` table)*/

select count(distinct(language_id)) from film;

/*3. How many movies were released with `"PG-13"` rating?*/

SELECT COUNT(*)
FROM film
WHERE rating = 'PG-13';

/*4. Get 10 the longest movies from 2006.*/

select * from film
where release_year = '2006'
order by length desc
limit 10;

/*5. How many days has been the company operating (check `DATEDIFF()` function)?*/

SELECT DATEDIFF(max(rental_date), min(rental_date)) from rental;

/*6. Show rental info with additional columns month and weekday. Get 20.*/

SELECT *, 
       MONTH(rental_date) AS month,
       DAYNAME(rental_date) AS weekday
FROM rental
LIMIT 20;

/*7. Add an additional column `day_type` with values 'weekend' and 'workday' depending on the rental day of the week.*/

SELECT *, 
       CASE
           WHEN DAYNAME(rental_date) = 'Saturday' OR DAYNAME(rental_date) = 'Sunday' THEN 'Weekend'
           ELSE 'Workday'
       END AS day_type,
       MONTH(rental_date) AS month,
       DAYNAME(rental_date) AS weekday
FROM rental;

/*8. How many rentals were in the last month of activity?*/

SELECT COUNT(*) AS rentals_last_month
FROM rental
WHERE MONTH(rental_date) = MONTH((SELECT MAX(rental_date) FROM rental))
AND YEAR(rental_date) = YEAR((SELECT MAX(rental_date) FROM rental));