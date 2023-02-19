# 2.01 Activity 4
# Refer to files_for_activities/mysql_dump.sql database. Load it to Sequel Pro, and there you will find a bank database which we will use for the following exercise. This is the same database used for the class example. Keep using the bank database for iterations that are related to it (3 and 4).
USE bank;

# The select statement is used as a print command in SQL. Use the select statement to print "Hello World".
SELECT "Hello World";

# Use the select statement to perform a simple mathematical calculation to add two numbers.
SELECT (3 + 4) AS "addition";

# Use an appropriate select statement to retrieve a list of unique card types from the bank database. 
# (Hint: You can use DISTINCT function here.)
SELECT DISTINCT type
FROM card;

# Get a list of all the district names in the bank database. Suggestion is to use the files_for_activities/case_study_extended here to work out which column is required here because we are looking for the names of places, not just the IDs. It would be great to see the results under the heading district_name. (Hint: Use an alias.). You should have 77 rows.
SELECT DISTINCT A2 AS district_name
FROM district;

# Bonus: Revise your query to also show the Region, and limit the results to just 30 rows. 
# Sort the results alphabetically by district name A>Z before selecting the 30.
SELECT A3 AS region
FROM district
ORDER BY Region ASC
LIMIT 30;

