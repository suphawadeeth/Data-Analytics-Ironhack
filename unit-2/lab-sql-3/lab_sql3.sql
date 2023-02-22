# Lab | SQL Queries 3

# Instructions

USE sakila;

# How many distinct (different) actors' last names are there?
SELECT COUNT(DISTINCT(last_name))
FROM actor;

# In how many different languages where the films originally produced? (Use the column language_id from the film table)
-- Check table
SELECT *
FROM film;

SELECT COUNT(DISTINCT(language_id))
FROM film;

# How many movies were released with "PG-13" rating?
SELECT COUNT(title)
FROM film
WHERE rating = "PG-13";


# Get 10 the longest movies from 2006.
SELECT title, length
FROM film
WHERE release_year = 2006
ORDER BY length DESC
LIMIT 10;

# How many days has been the company operating (check DATEDIFF() function)?
-- Check some tables to find the first day of operation
SELECT *
FROM payment
ORDER BY payment_date ASC;

SELECT *
FROM rental
ORDER BY rental_date ASC;

SELECT *
FROM customer
ORDER BY create_date ASC;

-- Check some tables to find the latest day of operation
SELECT *
FROM payment
ORDER BY last_update DESC;

SELECT *
FROM rental
ORDER BY last_update DESC;

-- Latest operation_date is in the "last_update" column from "rental" table, where the oldest date is in "rental_date" column from "rental" table (which is the same date as "payment_date from payment). 
-- Use DATEDIFF(latest_date, oldest_date) AS day_of_operation
SELECT DATEDIFF(max(last_update), min(rental_date)) AS day_of_operation
FROM rental;


# Show rental info with additional columns month and weekday. Get 20.
-- Check "rental" table
SELECT *
FROM rental
LIMIT 10;

-- Show rental info with additional columns month and weekday. Get 20.
SELECT *, date_format(rental_date, "%M") AS "month", date_format(rental_date, "%W") AS "weekday"
FROM rental
ORDER BY rental_date DESC
LIMIT 20;


# Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.
SELECT *,
CASE
	WHEN DAYNAME(rental_date) = "Saturday" OR DAYNAME(rental_date) = "Sunday"
    THEN "weekend"
    ELSE "weekday"
    END AS day_type
FROM rental;


# How many rentals were in the last month of activity?
-- I'll use "rental_date" in "rental" table as to show ```how many "rents" were made.``` 
-- order them to check the latest date of the activity
SELECT *
FROM rental
ORDER BY rental_date DESC
LIMIT 10;

-- Then count the number of "rent" that were made during 30 days (from the latest date of activity)
SELECT COUNT(*) AS rental_lastmonth
FROM rental
WHERE rental_date BETWEEN 
DATE_SUB(
(
	SELECT rental_date FROM rental
    ORDER BY rental_date DESC LIMIT 1
    ), 
    INTERVAL 30 day) 
    AND 
(
	SELECT rental_date FROM rental
    ORDER BY rental_date DESC LIMIT 1
    );

-- Or use datediff() < 30 (represents 30 days from the reference point)
SELECT COUNT(*) AS rental_lastmonth
FROM rental
WHERE DATEDIFF(
(
	SELECT rental_date from rental
    ORDER BY rental_date DESC
    LIMIT 1), 
	(rental_date)) < 30;