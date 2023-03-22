# Lab | SQL Subqueries
# In this lab, you will be using the Sakila database of movie rentals. Create appropriate joins wherever necessary.
USE sakila;


# Instructions
# How many copies of the film Hunchback Impossible exist in the inventory system?
-- Check film_id from its title
SELECT *
FROM film
WHERE title = "Hunchback Impossible";
# film_id = 439

-- Simple query
SELECT film_id, COUNT(*)
FROM inventory
WHERE film_id = 439;
# the copy of film should be 6


-- Count the copy of this film in inventory table using subquery
SELECT film_id, COUNT(*)
FROM inventory
WHERE film_id = (
	SELECT film_id
	FROM film
	WHERE title = "Hunchback Impossible")
GROUP BY film_id;




# List all films whose length is longer than the average of all the films.
-- Check avg_length
SELECT AVG(length)
FROM film;
# 115.27

-- List film title that has the length > avg_length
SELECT title, length AS film_length
FROM film
WHERE length > (SELECT AVG(length)
				FROM film)
                ORDER BY film_length DESC;



# Use subqueries to display all actors who appear in the film Alone Trip.
-- Find film_id
SELECT *
FROM film
WHERE title = "Alone Trip";
# 17

-- Display actors in this film using simple query
SELECT *
FROM film_actor
WHERE film_id = 17
;

-- Display all actors (actor's name) using subquery
SELECT 
	actor_id, 
    first_name, 
    last_name, 
    (SELECT title FROM film WHERE title = "Alone Trip") AS film_title # show film_title as well
FROM actor
WHERE actor_id IN (
					SELECT actor_id
					FROM film_actor
					WHERE film_id = (
						SELECT film_id 
                        FROM film 
                        WHERE title = "Alone Trip"
));




# Sales have been lagging among young families, and you wish to target all family movies for a promotion. Identify all movies categorized as family films.
-- Find category_id of family 
SELECT *
FROM category
WHERE name = "Family";
# category_id = 8

-- List all movies (title, category) in family category
SELECT 
	title, 
	(SELECT name
	FROM category
	WHERE name = "Family") AS category
FROM film
JOIN film_category
USING (film_id)
WHERE category_id = (
	SELECT category_id
	FROM category
	WHERE name = "Family"
);






# Get name and email from customers from Canada using subqueries. Do the same with joins. Note that to create a join, you will have to identify the correct tables with their primary keys and foreign keys, that will help you get the relevant information.
SELECT 
	first_name, 
    last_name, 
    email, 
	(SELECT country
	FROM country
	WHERE country = "Canada") AS country
FROM customer
JOIN address
USING (address_id)
JOIN city
USING (city_id)
WHERE country_id = (
	SELECT country_id
	FROM country
	WHERE country = "Canada"
);





# Which are films starred by the most prolific actor? 
# Most prolific actor is defined as the actor that has acted in the most number of films. First you will have to find the most prolific actor and then use that actor_id to find the different films that he/she starred.

-- How many film each actor play, get top
SELECT actor_id, COUNT(*)
FROM film_actor
GROUP BY actor_id
ORDER BY COUNT(*) DESC;
# actor_id 107 is the most prolific actor, presented in 42 films

-- Find the film that this actor (id = 107) starred
SELECT 
	film_id, 
    title,
    actor_id
FROM film
JOIN film_actor
USING (film_id)
WHERE actor_id = 
(
	SELECT actor_id
	FROM film_actor
	GROUP BY actor_id
	ORDER BY COUNT(*) DESC
	LIMIT 1
);




# Films rented by most profitable customer. 
# You can use the customer table and payment table to find the most profitable customer ie the customer that has made the largest sum of payments

-- Find a customer with the largest payment
SELECT customer_id, SUM(amount) AS amount
FROM payment
GROUP BY customer_id
ORDER BY amount DESC;
# customer_id 526 has the largest payment

-- Film rented by this customer_id (526)
SELECT film_id, title
FROM film
JOIN inventory
USING (film_id)
JOIN rental
USING (inventory_id)
WHERE customer_id = 
(
	SELECT customer_id
	FROM payment
	GROUP BY customer_id
	ORDER BY SUM(amount) DESC
	LIMIT 1
);






# Get the client_id and the total_amount_spent of those clients who spent more than the average of the total_amount spent by each client.

-- Find  payment for each client
SELECT customer_id, SUM(amount) AS total_spent_each_customer
FROM payment
GROUP BY customer_id;

-- Find avg_total_spent of all client (avg of the result from the query above)
SELECT ROUND(AVG(total_spent_each_customer), 2) AS avg_spent_each_customer
FROM (
	SELECT customer_id, SUM(amount) AS total_spent_each_customer
	FROM payment
	GROUP BY customer_id
    )
    AS avg_spent_each_customer;
# avg_spent_each_customer = 112.55

-- List client_id and total_spent that that > avg_spent_each_customer
SELECT customer_id, ROUND(SUM(amount), 2) AS total_spent
FROM payment
GROUP BY customer_id
HAVING total_spent > (

SELECT ROUND(AVG(total_spent_each_customer), 2) AS avg_spent_each_customer
FROM (
	SELECT customer_id, SUM(amount) AS total_spent_each_customer
	FROM payment
	GROUP BY customer_id
    ) AS avg_spent_each_customer
    
)
ORDER BY total_spent DESC;
                    
     