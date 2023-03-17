# Instructions
USE sakila;

# Write a query to display for each store its store ID, city, and country.

SELECT 
	store.store_id,
	city.city,
	country.country
FROM store
LEFT JOIN address
ON store.store_id = address.address_id
LEFT JOIN city
ON address.city_id = city.city_id
LEFT JOIN country
ON city.country_id = country.country_id;



# Write a query to display how much business, in dollars, each store brought in.

SELECT 	
	store.store_id, 
    SUM(payment.amount) AS total_amount_dollars
FROM payment
LEFT JOIN customer
ON payment.payment_id = customer.customer_id
LEFT JOIN store
ON store.store_id = customer.store_id
WHERE store.store_id IS NOT Null # there's Null in store table so I put condition to exclude null & show the output
GROUP BY store.store_id
;



# What is the average running time of films by category?

SELECT 	
	C.name,
    ROUND(AVG(length), 2) AS avg_length_by_category
FROM film F
LEFT JOIN film_category FC
ON F.film_id = FC.film_id
LEFT JOIN category C
ON FC.category_id = C.category_id
# WHERE store.store_id IS NOT Null # there's Null in store table so I put condition to exclude null & show the output
GROUP BY C.category_id
;




# Which film categories are longest?
SELECT 	
	C.name,
    ROUND(AVG(length), 2) AS avg_length_by_category
FROM film F
LEFT JOIN film_category FC
ON F.film_id = FC.film_id
LEFT JOIN category C
ON FC.category_id = C.category_id
GROUP BY C.category_id
ORDER BY avg_length_by_category DESC
LIMIT 1
;




# Display the most frequently rented movies in descending order.

SELECT 	
	F.title,
	COUNT(*) AS num_of_rents
FROM film F
LEFT JOIN inventory I
ON F.film_id = I.film_id
LEFT JOIN rental R
ON I.inventory_id = R.inventory_id
GROUP BY F.title
ORDER BY num_of_rents DESC
;




# Is "Academy Dinosaur" available for rent from Store 1?

SELECT 	
	F.title, S.store_id
FROM film F
LEFT JOIN inventory I
ON F.film_id = I.film_id
LEFT JOIN store S
ON I.store_id = S.store_id
WHERE F.title = "Academy Dinosaur" AND S.store_id = 1
GROUP BY F.title
;
# "Academy Dinosaur" is available for rent from Store 1
