# Instructions
USE sakila;

-- Get film ratings.
SELECT film_id, title, rating
FROM film;


-- Get release years.
SELECT release_year
FROM film;


-- Get all films with ARMAGEDDON in the title.
SELECT *
FROM film;

SELECT title
FROM film
WHERE title LIKE "%ARMAGEDDON%";


-- Get all films with APOLLO in the title
SELECT title
FROM film
WHERE title LIKE "%APOLLO%";


-- Get all films which title ends with APOLLO.
SELECT title
FROM film
WHERE title LIKE "%APOLLO";

-- Get all films with word DATE in the title.
SELECT title
FROM film
WHERE title LIKE "%DATE%";



-- Get 10 films with the longest title.
SELECT title, LENGTH(title) AS title_length
FROM film
ORDER BY LENGTH(title) DESC
LIMIT 10;

-- Get 10 the longest films.
SELECT title, length AS film_length
FROM film
ORDER BY length DESC
LIMIT 10;

-- How many films include Behind the Scenes content?
SELECT COUNT(title)
FROM film
WHERE special_features LIKE ("%Behind%");

-- List films ordered by release year and title in alphabetical order.
SELECT *
FROM film
ORDER BY release_year DESC, title;