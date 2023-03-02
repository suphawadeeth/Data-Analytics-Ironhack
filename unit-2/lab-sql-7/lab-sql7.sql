# Instructions
USE sakila;

# In the table actor, which are the actors whose last names are not repeated? 
# For example if you would sort the data in the table actor by last_name, you would see that there is Christian Arkoyd, Kirsten Arkoyd, and Debbie Arkoyd. These three actors have the same last name. So we do not want to include this last name in our output. Last name "Astaire" is present only one time with actor "Angelina Astaire", hence we would want this in our output list.

-- list of unique last name that are not repeated >>> return 66 rows
SELECT last_name, COUNT(last_name) AS count_lastname
FROM actor
GROUP BY last_name
HAVING count_lastname = 1;

-- Query to return first_name, last_name, count_lastname >>> return 66 rows
SELECT 
	MAX(first_name) AS first_name, 
	last_name,
	COUNT(last_name) AS count_lastname
FROM actor
GROUP BY last_name
HAVING count_lastname = 1;
# GROUP BY last_name >> return 121 rows (including last_name that are repeated), 
# then select first_name (using max() will return only 1 row of those who have repeated last_name e.g. in case that last_name are repeated 3 times, it will present only one person from this group of last_name by using MAX(first_name) >> hence return 121 rows, 
# so the rows of first_name & last_name are now equal and be able to present in the outcome
# But we want actor's names that have unique last name >> so use COUNT(last_name) + HAVING COUNT(last_name) = 1 to return only a row that have unique last_name >> return 66 rows

-- Or if don't want to show count_lastname column (show only first & last name)
# modify from query above to return first_name & uniq_lastname >>> return 66 rows
SELECT 
	MAX(first_name) AS first_name, 
    CASE 
	WHEN COUNT(last_name) = 1 
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

SELECT staff_id AS employee_id, COUNT(*) AS num_rentals_by_each_employee
FROM rental
GROUP BY staff_id;


# Using the film table, find out how many films were released each year.

SELECT release_year AS release_year, COUNT(title) AS num_film_released
FROM film
GROUP BY release_year;


# Using the film table, find out for each rating how many films were there.

SELECT rating, COUNT(rating) AS num_of_film
FROM film
GROUP BY rating;



# What is the mean length of the film for each rating type. Round off the average lengths to two decimal places

SELECT rating AS rating_type, ROUND(AVG(length), 2) AS avg_film_length
FROM film
GROUP BY rating;


# Which kind of movies (rating) have a mean duration of more than two hours?

SELECT rating AS rating_type, ROUND((AVG(length))/60, 2) AS avg_length_hour
FROM film
GROUP BY rating
HAVING avg_length_hour > 2;

