# Instructions
USE sakila;

# Drop column picture from staff.
-- Check table staff
SELECT *
FROM staff;

-- Drop column picture
ALTER TABLE staff
DROP COLUMN picture;

# A new person is hired to help Jon. 
# Her name is TAMMY SANDERS, and she is a customer. Update the database accordingly.
-- Check table staff
SELECT *
FROM staff;

INSERT INTO staff values(3, "Tammy", "Sanders", 79, "TAMMY.SANDERS@sakilacustomer.org", 2, 1, "Tammy", password=NULL, now());

SELECT *
FROM customer
WHERE first_name ="TAMMY" AND last_name="SANDERS";




# Add rental for movie "Academy Dinosaur" by Charlotte Hunter from Mike Hillyer at Store 1. 
# You can use current date for the rental_date column in the rental table. 
# Hint: Check the columns in the table rental and see what information you would need to add there. You can query those pieces of information. 
# For eg., you would notice that you need customer_id information as well. To get that you can use the following query:

-- Check customer_id --> 130
select * from sakila.customer
where first_name = 'CHARLOTTE' and last_name = 'HUNTER';

# Use similar method to get inventory_id, film_id, and staff_id.

-- Check film_id of "Academy Dinosaur" --> 1
SELECT * FROM film
WHERE title = "Academy Dinosaur";

-- Check inventory_id 
SELECT *
FROM inventory
WHERE film_id = 1 AND store_id = 1;
# inventory_id = (1, 4)

-- Check staff_id --> 1, store_id --> 1
SELECT *
FROM staff
WHERE first_name = "Mike";

-- Check rental table before adding anything
SELECT * 
FROM rental
ORDER BY rental_id DESC
LIMIT 1;
# rental_id = 16050

-- Add data in rental table ## (rental_id, rental_date, inventory_id, customer_id, return_date, staff_id, last_update)
INSERT INTO rental VALUES (16050, now(), 1, 130, return_date = null, 1, now());
# using now() will return >> date with actual time <<
# using current_date return >> date with time as 00:00:00



# Delete non-active users, 
# but first, create a backup table deleted_users to store customer_id, email, and the date for the users that would be deleted. 
# Follow these steps:
# Check if there are any non-active users
# Create a table backup table as suggested
# Insert the non active users in the table backup table
# Delete the non active users from the table customer

-- Check non-active user 
SELECT *
FROM customer
WHERE active = 0;
# return 15 rows


-- Create a backup table & insert non-active users in the table
CREATE TABLE deleted_users
	AS (SELECT *
		FROM customer
		WHERE active = 0);
      
-- Check deleted_users table
SELECT *
FROM deleted_users;
# got all records = 15 rows

-- Delete non-active users from customer table        
-- Update foreign key first
SET FOREIGN_KEY_CHECKS=0; 

-- Delete non-active
DELETE FROM customer
WHERE active IN ('0');
# 15 rows affected

SET FOREIGN_KEY_CHECKS=1; 


-- Check non-active user in customer table again
SELECT *
FROM customer
WHERE active = 0;
# return 0 rows

####======END LAB=====####



-- Insert deleted non-active users back to the customer table
INSERT INTO customer
SELECT * FROM deleted_users;
