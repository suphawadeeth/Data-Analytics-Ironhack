# Instructions
USE sakila;

# Rank films by length (filter out the rows with nulls or zeros in length column). 
# Select only columns title, length and rank in your output.

SELECT title, length, DENSE_RANK() OVER (ORDER BY length DESC) AS ranking_by_length
FROM film
WHERE length IS NOT NULL;


# Rank films by length within the rating category (filter out the rows with nulls or zeros in length column). 
# In your output, only select the columns title, length, rating and rank.

SELECT title, length, rating, DENSE_RANK() OVER (PARTITION BY rating ORDER BY length DESC)
FROM film
WHERE length IS NOT NULL;


# How many films are there for each of the categories in the category table? 
# Hint: Use appropriate join between the tables "category" and "film_category".

-- This query returns category_id, category name and number_of_film_by_category
SELECT category.category_id, category.name, COUNT(*) AS num_film_by_category
FROM film 
INNER JOIN film_category
ON film_category.category_id = film.film_id
INNER JOIN category
ON category.category_id = film_category.category_id
GROUP BY category_id
ORDER BY num_film_by_category DESC;


# Which actor has appeared in the most films? 
# Hint: You can create a join between the tables "actor" and "film actor" and count the number of times an actor appears.

SELECT actor.actor_id, actor.first_name, actor.last_name, COUNT(film_actor.actor_id) AS num_of_roles
FROM actor
INNER JOIN film_actor
ON actor.actor_id = film_actor.actor_id
GROUP BY film_actor.actor_id
ORDER BY num_of_roles DESC
LIMIT 1;
# GINA DEGENERES appeared in 42 films

# Which is the most active customer (the customer that has rented the most number of films)? 
# Hint: Use appropriate join between the tables "customer" and "rental" and count the rental_id for each customer.


SELECT customer.first_name, customer.last_name, COUNT(rental.rental_id) AS num_of_rents
FROM rental
INNER JOIN customer
ON rental.customer_id = customer.customer_id
GROUP BY rental.customer_id
ORDER BY num_of_rents DESC
LIMIT 1;
# ELEANOR HUNT is the most active customer with number of rents = 46



# Bonus: Which is the most rented film? (The answer is Bucket Brotherhood).

SELECT inventory.film_id,
	(SELECT film.title FROM film WHERE film_id = inventory.film_id) AS film_title,
    COUNT(*) AS rent_num_of_the_film
FROM inventory
INNER JOIN rental
ON rental.inventory_id = inventory.inventory_id
INNER JOIN film
ON inventory.inventory_id = film.film_id
GROUP BY inventory.film_id
ORDER BY rent_num_of_the_film DESC
LIMIT 1;
# Bucket Brotherhood is the most rented film = 34 

