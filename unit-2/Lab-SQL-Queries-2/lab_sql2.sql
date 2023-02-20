# Instructions

Use sakila;

# Select all the actors with the first name ‘Scarlett’.
SELECT *
FROM actor
WHERE FIRST_NAME = "Scarlett";

# Select all the actors with the last name ‘Johansson’.
SELECT *
FROM actor
WHERE LAST_NAME = "Johansson";

# How many films (movies) are available for rent?

-- check film table
SELECT *
FROM film
LIMIT 10;

-- Films available for rent (& distict title) 
SELECT COUNT(DISTINCT title)
FROM film;


# How many films have been rented?
-- Count distinct film title if the rental_duration > 0 (means it has been rented)
SELECT COUNT(DISTINCT title)
FROM film
WHERE rental_duration > 0;


# What is the shortest and longest rental period?
-- show rental_duration with MIN(), MAX()
SELECT MIN(rental_duration) AS "shortest rental period", MAX(rental_duration) AS "longest rental period"
FROM film;

# What are the shortest and longest movie duration? 
# Name the values max_duration and min_duration.
-- check film table
SELECT *
FROM film;

-- get the shortest and longest movie duration using "length" column
SELECT MIN(length) AS min_duration, MAX(length) AS max_duration
FROM film; 

# What's the average movie duration?
-- Calculate the mean of movie duration
SELECT SUM(length)/COUNT(title) AS avg_movie_duration
FROM film;

-- Shortest way
SELECT avg(length)
FROM film; 

# What's the average movie duration expressed in format (hours, minutes)?
SELECT TRUNCATE(SUM(length / 60)/COUNT(title), 0) AS "hours", TRUNCATE(SUM(length % 60)/COUNT(title), 2) AS "minutes"
FROM film;

-- Shortest way
SELECT TRUNCATE(avg(length)/60, 0) AS hours, TRUNCATE(avg(length)%60, 2) AS minutes
FROM film; 


# How many movies longer than 3 hours?
-- Calculate length into hours & count title that length > 3 hours
SELECT COUNT(title)
FROM film
WHERE length > (60*3);


# Get the name and email formatted. Example: Mary SMITH - mary.smith@sakilacustomer.org.
-- check customer table
SELECT *
FROM customer;

-- Get the name & email using concat()
SELECT CONCAT(first_name, " ", last_name, " - ", email) AS customer_info
FROM customer;


# What's the length of the longest film title?
-- check the title name & title length
SELECT title, LENGTH(title) AS title_length
FROM film
ORDER BY title_length DESC;

-- show the length of the longest film title
SELECT title AS "longest film title", length AS "length of the film"
FROM film 
ORDER BY LENGTH(title) DESC
LIMIT 1;

-- show the length of the longest film title using MAX()
# with the query above, you have to know the number of the longest film title in your table to set the LIMIT number
# therefore, it is simpler with MAX()
SELECT title AS "longest film title", length AS "length of the film"
FROM film
WHERE LENGTH(title) = (SELECT MAX(length(title)) from film);

