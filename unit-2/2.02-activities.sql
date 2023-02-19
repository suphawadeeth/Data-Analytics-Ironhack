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
SELECT *
FROM loan
WHERE status = 'B'
	AND amount > 1000;