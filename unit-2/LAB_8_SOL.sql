##### LAB SQL QUERIES 8 #####

USE sakila;

# 1. Rank films by length (filter out the rows that have nulls or 0s in length column). In your output, only select the columns title, length, and the rank.

SELECT title, length, RANK() OVER (ORDER BY length DESC) AS "Ranking"
FROM film
WHERE length != "" and length != 0 and length is not null; 

SELECT title, length, DENSE_RANK() OVER (ORDER BY length DESC) AS "Ranking"
FROM film
WHERE length != "" and length != 0 and length is not null;

SELECT title, length, ROW_NUMBER() OVER (ORDER BY length DESC) AS "Ranking"
FROM film
WHERE length != "" and length != 0 and length is not null;

# 2. Rank films by length within the rating category (filter out the rows that have nulls or 0s in length column). In your output, only select the columns title, length, rating and the rank.

SELECT title, length, rating, RANK() OVER (PARTITION BY rating ORDER BY length DESC) AS "Ranking"
FROM film
WHERE length != "" and length != 0 and length is not null; 

SELECT title, length, rating, DENSE_RANK() OVER (PARTITION BY rating ORDER BY length DESC) AS "Ranking"
FROM film
WHERE length != "" and length != 0 and length is not null; 

SELECT title, length, rating, ROW_NUMBER() OVER (PARTITION BY rating ORDER BY length DESC) AS "Ranking"
FROM film
WHERE length != "" and length != 0 and length is not null; 

# 3. How many films are there for each of the categories in the category table. Use appropriate join to write this query

SELECT C.category_id, C.name, count(*) AS num_of_films
FROM category C
JOIN film_category FC
ON C.category_id = FC.category_id
GROUP BY C.category_id, C.name;

# Which actor (name) has appeared in the most films? ### SOLUTION: Gina Degeneres

SELECT A.actor_id, A.first_name, A.last_name, COUNT(*) as num_of_films
FROM actor A
JOIN film_actor FA
ON A.actor_id = FA.actor_id
GROUP BY A.actor_id, A.first_name, A.last_name
ORDER BY num_of_films DESC
LIMIT 1;

# Most active customer  (the customer that has rented the most number of films)

SELECT C.customer_id, C.first_name, C.last_name, COUNT(R.rental_id) as num_of_rentals ### SOLUTION: Eleanor Hunt, 46 rentals
FROM customer C
JOIN rental R
ON C.customer_id = R.customer_id
GROUP BY C.customer_id, C.first_name, C.last_name
ORDER BY num_of_rentals DESC
LIMIT 1;

