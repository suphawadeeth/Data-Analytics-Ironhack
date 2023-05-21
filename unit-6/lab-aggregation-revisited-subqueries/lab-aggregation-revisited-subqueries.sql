# Instructions
# Write the SQL queries to answer the following questions:

USE sakila;

-- Select the first name, last name, and email address of all the customers who have rented a movie.
SELECT first_name, last_name, email
FROM customer;

-- What is the average payment made by each customer (display the customer id, customer name (concatenated), and the average payment made).
SELECT C.customer_id, CONCAT(C.first_name, " ", C.last_name) AS full_name, 
ROUND(AVG(P.amount), 2) AS avg_payment
FROM payment P
JOIN customer C
ON C.customer_id = P.customer_id
GROUP BY C.customer_id;


# Select the name and email address of all the customers who have rented the "Action" movies.
-- Write the query using multiple join statements
SELECT DISTINCT CONCAT(C.first_name, " ", C.last_name) AS full_name, C.email, CT.name
FROM customer C 
JOIN rental R USING (customer_id)
JOIN inventory I USING (inventory_id)
JOIN film_category FC USING (film_id)
JOIN category CT USING (category_id)
WHERE CT.name = "Action";
# return 510 rows


# Select the name and email address of all the customers who have rented the "Action" movies.
-- Write the query using sub queries with multiple WHERE clause and IN condition
SELECT DISTINCT CONCAT(first_name, " ", last_name) AS full_name, email
FROM customer
WHERE customer_id IN (
  SELECT customer_id
  FROM rental
  WHERE inventory_id IN (
    SELECT inventory_id
    FROM inventory
    WHERE film_id IN (
      SELECT film_id
      FROM film_category
      WHERE category_id IN (
        SELECT category_id
        FROM category
        WHERE name = "Action"))));
# return 510 rows

-- Verify if the above two queries produce the same results or not
# yes, both return 510 rows

-- Use the case statement to create a new column classifying existing columns as either or high value transactions based on the amount of payment. If the amount is between 0 and 2, label should be low and if the amount is between 2 and 4, the label should be medium, and if it is more than 4, then it should be high
SELECT 
    customer_id,
    amount,
    CASE
        WHEN amount > 4 THEN 'high'
        WHEN amount >= 2 THEN 'medium'
        ELSE 'low'
    END AS class_transaction
FROM
    payment;

