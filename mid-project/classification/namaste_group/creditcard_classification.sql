USE credit_card_classification;

# 4. Check if all the data is correctly imported
SELECT count(*)
FROM credit_card_data;

# 5. Use the alter table command to drop the column q4_balance from the database, as we would not use it in the analysis with SQL. 
ALTER TABLE credit_card_data
DROP COLUMN q4_balance;

-- Select all the data from the table to verify if the command worked. Limit your returned results to 10.
SELECT *
FROM credit_card_data
LIMIT 10;

# 6. Check that we have 17976 rows of data
SELECT count(*) AS "rows"
FROM credit_card_data;

# 7. Now we will try to find the unique values in some of the categorical columns:
-- What are the unique values in the column Offer_accepted?
SELECT DISTINCT offer_accepted 
FROM credit_card_data;

-- What are the unique values in the column Reward?
SELECT DISTINCT reward 
FROM credit_card_data;

-- What are the unique values in the column mailer_type?
SELECT DISTINCT mailer_type
FROM credit_card_data;


-- What are the unique values in the column credit_cards_held?
SELECT DISTINCT credit_cards_held
FROM credit_card_data;


-- What are the unique values in the column household_size?
SELECT DISTINCT household_size 
FROM credit_card_data;


# 8.Arrange the data in a decreasing order by the average_balance of the customer. 
-- Return only the customer_number of the top 10 customers with the highest average_balances in your data.
SELECT customer_number AS customer_with_highest_average_balance
FROM credit_card_data
ORDER BY average_balance DESC
LIMIT 10;


# 9.What is the average balance of all the customers in your data?
SELECT ROUND(AVG(average_balance), 2) AS avg_balance
FROM credit_card_data;
# 940.64



# 10.In this exercise we will use simple group_by to check the properties of some of the categorical variables in our data. Note wherever average_balance is asked, please take the average of the column average_balance:
-- What is the average balance of the customers grouped by Income Level? The returned result should have only two columns, income level and Average balance of the customers. Use an alias to change the name of the second column.
SELECT income_level, ROUND(AVG(average_balance), 2) AS avg_balance
FROM credit_card_data
GROUP BY income_level;

-- What is the average balance of the customers grouped by number_of_bank_accounts_open? The returned result should have only two columns, number_of_bank_accounts_open and Average balance of the customers. Use an alias to change the name of the second column.
SELECT bank_accounts_open, ROUND(AVG(average_balance), 2) AS avg_balance
FROM credit_card_data
GROUP BY bank_accounts_open;

-- What is the average number of credit cards held by customers for each of the credit card ratings? The returned result should have only two columns, rating and average number of credit cards held. Use an alias to change the name of the second column.
SELECT credit_cards_held, ROUND(AVG(average_balance), 2) AS avg_balance
FROM credit_card_data
GROUP BY credit_cards_held;

############## Continue on Saturday ##################
-- Is there any correlation between the columns credit_cards_held and number_of_bank_accounts_open? 
# You can analyse this by grouping the data by one of the variables and then aggregating the results of the other column. 
# Visually check if there is a positive correlation or negative correlation or no correlation between the variables.


SELECT credit_cards_held, ROUND(AVG(bank_accounts_open), 2) AS avg_bank_accounts_open
FROM credit_card_data
GROUP BY credit_cards_held;



# 11. Your managers are only interested in the customers with the following properties:
-- Credit rating medium or high
SELECT customer_number, credit_rating
FROM credit_card_data
WHERE credit_rating = 'medium' OR credit_rating = 'high';

-- Credit cards held 2 or less
SELECT customer_number, credit_cards_held
FROM credit_card_data
WHERE credit_cards_held <= 2;

-- Owns their own home
SELECT customer_number, own_your_home
FROM credit_card_data
WHERE own_your_home = 'Yes';

-- Household size 3 or more
SELECT customer_number, household_size
FROM credit_card_data
WHERE household_size >= 3;

# For the rest of the things, they are not too concerned. Write a simple query to find what are the options available for them? Can you filter the customers who accepted the offers here?
SELECT *
FROM credit_card_data
WHERE offer_accepted = 'Yes';



# 12. Your managers want to find out the list of customers whose average balance is less than the average balance of all the customers in the database. 
# Write a query to show them the list of such customers. You might need to use a subquery for this problem.
SELECT customer_number, average_balance
FROM credit_card_data
WHERE (SELECT AVG(average_balance) FROM credit_card_data) > average_balance;


# 13. Since this is something that the senior management is regularly interested in, create a view of the same query.
CREATE VIEW customer_balance_below_avg AS
SELECT customer_number, average_balance FROM credit_card_data
WHERE (SELECT AVG(average_balance) FROM credit_card_data) > average_balance;



# 14. What is the number of people who accepted the offer vs number of people who did not?
SELECT offer_accepted, COUNT(*) AS number_of_customer
FROM credit_card_data
GROUP BY offer_accepted;

# 15. Your managers are more interested in customers with a credit rating of high or medium. 
-- What is the difference in average balances of the customers with high credit card rating and low credit card rating?
SELECT credit_rating, ROUND(AVG(average_balance), 2) AS avg_balance
FROM credit_card_data
WHERE credit_rating = 'medium' OR credit_rating = 'high' 
GROUP BY credit_rating;


# 16. In the database, which all types of communication (mailer_type) were used and with how many customers?
SELECT mailer_type, COUNT(*) AS number_of_customer
FROM credit_card_data
GROUP BY mailer_type;


# 17. Provide the details of the customer that is the 11th least Q1_balance in your database.
SELECT *
FROM credit_card_data
ORDER BY q1_balance
LIMIT 11;


