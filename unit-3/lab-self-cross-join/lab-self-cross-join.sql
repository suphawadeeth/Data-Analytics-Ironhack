# Instructions
USE sakila;

# Get all pairs of actors that worked together.
-- working together >> having the same film_id 
SELECT FA1.actor_id, FA2.actor_id, FA1.film_id 
FROM film_actor FA1 
JOIN film_actor FA2 
ON FA1.film_id = FA2.film_id # having the same film_id
AND FA1.actor_id < FA2.actor_id # pair with other actors
;




# Get all pairs of customers that have rented the same film more than 3 times.
SELECT R1.customer_id, R2.customer_id, I.film_id, COUNT(*) AS num_of_rents
FROM rental R1
JOIN rental R2
ON R1.customer_id < R2.customer_id # pair with other customers
JOIN inventory I 
ON R1.inventory_id = I.inventory_id 
GROUP BY R1.customer_id, R2.customer_id, I.film_id
HAVING num_of_rents > 3
ORDER BY R1.customer_id, R2.customer_id, I.film_id, num_of_rents DESC
;



# Get all possible pairs of actors and films.
SELECT A.actor_id, CONCAT(A.first_name, " ", A.last_name) AS actor_name, F.title
FROM actor A
CROSS JOIN film F
ORDER BY A.actor_id, F.title;
