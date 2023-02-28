# Instructions
USE sakila;

# In the table actor, which are the actors whose last names are not repeated? 
# For example if you would sort the data in the table actor by last_name, you would see that there is Christian Arkoyd, Kirsten Arkoyd, and Debbie Arkoyd. These three actors have the same last name. So we do not want to include this last name in our output. Last name "Astaire" is present only one time with actor "Angelina Astaire", hence we would want this in our output list.
SELECT *
FROM actor;

-- list of unique last name that are not repeated >>> return 66 rows
SELECT last_name, COUNT(last_name) AS count_lastname
FROM actor
GROUP BY last_name
HAVING count_lastname = 1;

-- Query to return first_name, last_name, count_firstname >>> return 66 rows
# MAX() function and GROUP BY are used to return a single row, as this case applying max() to string value just to return row of the first_name with condition that having unique last_name
SELECT 
	MAX(first_name) AS first_name, 
	last_name,
	COUNT(DISTINCT first_name) AS count_firstname
FROM actor
GROUP BY last_name
HAVING count_firstname = 1;

-- Or if don't want to show count_firstname column (show only first & last name) >>> return 66 rows
SELECT 
	MAX(first_name) AS first_name, 
    CASE 
	WHEN COUNT(DISTINCT first_name) = 1 
    THEN last_name ELSE NULL 
    END AS uniq_lastname
FROM actor
GROUP BY last_name
HAVING uniq_lastname IS NOT NULL;


# Which last names appear more than once? >>> return 55 rows
# We would use the same logic as in the previous question but this time we want to include the last names of the actors where the last name was present more than once
SELECT last_name, COUNT(last_name) AS n_lastname
FROM actor
GROUP BY last_name
HAVING n_lastname > 1;


# Using the rental table, find out how many rentals were processed by each employee.
SELECT *
FROM rental;

SELECT staff_id AS employee_id, COUNT(*) AS num_rentals_by_each_employee
FROM rental
GROUP BY staff_id;


# Using the film table, find out how many films were released each year.
SELECT *
FROM film;

SELECT release_year AS release_year, COUNT(title) AS num_film_released
FROM film
GROUP BY release_year;


# Using the film table, find out for each rating how many films were there.
SELECT *
FROM film;

SELECT rating, COUNT(rating) AS num_of_film
FROM film
GROUP BY rating;



# What is the mean length of the film for each rating type. Round off the average lengths to two decimal places
SELECT *
FROM film;

SELECT rating AS rating_type, ROUND(AVG(length), 2) AS avg_film_length
FROM film
GROUP BY rating;


# Which kind of movies (rating) have a mean duration of more than two hours?
SELECT *
FROM film;

SELECT rating AS rating_type, ROUND((AVG(length))/60, 2) AS avg_length_hour
FROM film
GROUP BY rating
HAVING avg_length_hour > 2;

