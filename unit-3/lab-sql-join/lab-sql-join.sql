# Instructions
USE sakila;

# List the number of films per category.
SELECT category.name, COUNT(*) AS num_film
FROM film
INNER JOIN film_category
ON film_category.film_id = film.film_id
INNER JOIN category
ON film_category.category_id = category.category_id
GROUP BY category.category_id
ORDER BY num_film DESC; 


# Display the first and the last names, as well as the address, of each staff member.

SELECT staff.first_name, staff.last_name, address.address
FROM staff
INNER JOIN address
ON address.address_id = staff.address_id
; 


# Display the total amount rung up by each staff member in August 2005.

SELECT SUM(amount)
FROM staff
INNER JOIN payment
ON payment.staff_id = staff.staff_id
WHERE payment.payment_date LIKE "2005-07%"
GROUP BY staff.staff_id;




# List all films and the number of actors who are listed for each film.

SELECT film.title, SUM(film_actor.actor_id)
FROM film
INNER JOIN film_actor
ON film_actor.film_id = film.film_id
INNER JOIN actor
ON film_actor.actor_id = actor.actor_id
GROUP BY film.film_id
; 





# Using the payment and the customer tables as well as the JOIN command, 
# list the total amount paid by each customer. List the customers alphabetically by their last names.


SELECT customer.first_name, customer.last_name AS surename, SUM(amount)
FROM customer
INNER JOIN payment
ON payment.customer_id = customer.customer_id
GROUP BY customer.customer_id
ORDER BY surename ASC
; 

