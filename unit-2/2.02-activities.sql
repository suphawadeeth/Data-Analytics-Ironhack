# 2.02 Activity 1
# Keep working on the bank database. (In case you need to load data again, refer to files_for_lab to get the database.)
USE bank;

# Simple queries
# 1. Select districts and salaries (from the district table) where salary is greater than 10000. Suggestion is to use the case study extended here (you have it already after getting the 2.01 activity) to work out which columns are required here. Return columns as district_name and average_salary.
SELECT A2 AS district_name, A11 AS average_salary
FROM district
LIMIT 10;

# 2. Select those loans whose contract finished and were not paid.
# Hint: You should be looking at the loan column and you will need the extended case study information to tell you which value of status is required.

-- Select the B group (loan not paid + contract finished)
SELECT *
FROM loan
WHERE status = 'B';


# 3. Select cards of type junior. Return just first 10 in your query.
SELECT type = 'junior'
FROM card
LIMIT 10;


# 2.02 Activity 2
# Simple queries
# Select those loans whose contract finished and not paid back. 
# Return the debt value from the status you identified in the last activity, together with loan_id and account_id.
-- Select the B group (loan not paid + contract finished)
SELECT loan_id, account_id, (amount - payments) AS debt
FROM loan
WHERE status = 'B';

# Calculate the urban population for all districts.
# Hint: You are looking for the number of inhabitants and the % of urban inhabitants in each district. 
# Return columns as district_name and urban_population.

-- Check urban_ratio
SELECT
	A2 AS district_name, 
    A4 AS population,
    A10 AS urban_ratio
FROM district;

-- calculate urban_population. Return columns: district_name and urban_population
SELECT 
	A2 AS district_name, 
    ROUND((A10 * A4 / 100), 0) AS urban_population
FROM district;


# On the previous query result 
# re-run it but filtering out districts where the rural population is greater than 50%.

-- rural_population != urban in A10 as urban_ratio
-- we want data of districts where rural_ratio < 50
SELECT 
	A2 AS district_name, 
    ROUND(100 - A10, 0) AS rural_ratio # find rural_ratio
FROM district
WHERE (A10 > 50) # filter out rural_ratio < 50 using urban_ratio column
ORDER BY rural_ratio DESC;


# 2.02 Activity 3
# Simple queries
# Get all junior cards issued last year.
# Hint: Use the numeric value (980000).
SELECT *
FROM card
WHERE type = 'junior'
	AND issued LIKE '98%';


# Get the first 10 transactions for withdrawals that are not in cash. 
# You will need the extended case study information to tell you which values are required here, and you will need to refer to conditions on two columns.
SELECT *
FROM trans
WHERE operation = 'VYBER KARTOU' AND type = 'VYDAJ'
LIMIT 10;

# Refine your query from last activity on loans whose contract finished and not paid back 
# - filtered to loans where they were left with a debt bigger than 1000. 
# Return the debt value together with loan_id and account_id. Sort by the highest debt value to the lowest.

-- Check table 
SELECT *
FROM loan;

-- Add computed 'debt' column
ALTER TABLE loan
ADD debt int AS (amount-payments);

SELECT loan_id, account_id, debt
FROM loan
WHERE debt > 1000
	AND status = "B"
ORDER BY debt DESC;

# 2.02 Activity 4
# Simple queries
# Get the biggest and the smallest transaction with non-zero values in the database (use the trans table in the bank database).
-- Check table
SELECT *
FROM trans;

-- Get the biggest & smallest transaction (exclude 0)
SELECT MAX(amount) AS biggest_trans, MIN(amount) AS smallest_trans
FROM trans
WHERE amount > 0;


# Get account information with an extra column year showing the opening year as 'YY'. Eg., 1995 will show as 95.
# Hint: Look at the first two characters of the string date in the account table.

-- Check "account" table
SELECT * 
FROM account;

-- Check data types in this table
DESCRIBE account;
# read more about data types & what should we use: https://www.w3schools.com/sql/sql_datatypes.asp

-- date is 'int', select first 2 digits and return as a "year", and show all the information *
SELECT *, LEFT(date, 2) AS year
FROM account
ORDER BY year DESC;

# ref: https://stackoverflow.com/questions/30887327/select-the-first-n-digits-of-an-integer
