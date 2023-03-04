# Lab | SQL Queries 9
# Instructions
# In this lab we will find the customers who were active in consecutive months of May and June. Follow the steps to complete the analysis.
USE sakila;

# Create a table rentals_may to store the data from rental table with information for the month of May.

-- Create new table + specify data to put in this new table
CREATE TABLE rental_may 
SELECT * FROM rental
WHERE rental_date LIKE "%-05-%";

-- Check rental_may table
SELECT *
FROM rental_may;




# Insert values in the table rentals_may using the table rental, filtering values only for the month of May.

-- Done in the previous query, but if not then we can use INSERT INTO ...
INSERT INTO rental_may SELECT * FROM rental
WHERE rental_date LIKE "%-05-%";




# Create a table rentals_june to store the data from rental table with information for the month of June.

-- Create new table + specify data to put in this new table
CREATE TABLE rental_june
SELECT * FROM rental
WHERE rental_date LIKE "%-06-%";


# Insert values in the table rentals_june using the table rental, filtering values only for the month of June.

-- Done in the previous query, but if not then we can use INSERT INTO ...
INSERT INTO rental_may SELECT * FROM rental
WHERE rental_date LIKE "%-05-%";



# Check the number of rentals for each customer for May.


SELECT customer_id, COUNT(*) AS num_of_rents_may
FROM rental_may
GROUP BY customer_id
ORDER BY num_of_rents_may DESC;




# Check the number of rentals for each customer for June.

SELECT customer_id, COUNT(*) AS num_of_rents_june
FROM rental_june
GROUP BY customer_id
ORDER BY num_of_rents_june DESC;




# Create a Python connection with SQL database and retrieve the results of the last two queries (also mentioned below) as dataframes:
# Check the number of rentals for each customer for May



# Check the number of rentals for each customer for June
# Hint: You can store the results from the two queries in two separate dataframes.







# Write a function that checks if customer borrowed more or less films in the month of June as compared to May.
# Hint: For this part, you can create a join between the two dataframes created before, using the merge function available for pandas dataframes. Here is a link to the documentation for the merge function.