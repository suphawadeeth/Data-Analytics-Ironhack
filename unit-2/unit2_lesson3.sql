USE bank;

###### ACTIVITY 1

#1. Get different card types.
SELECT DISTINCT(type)
FROM card;

#2. Get transactions in the first 15 days of 1993.
SELECT *
FROM trans
WHERE -15 < DATEDIFF(
(
	SELECT date from trans
    WHERE SUBSTRING(date, 1, 2) = 93
    ORDER BY date ASC
    LIMIT 1), 
	(date));

#3. Get all running loans. STATUS C and D
SELECT *
FROM loan
WHERE status = "C" OR status = "D";

#4. Get all loans between 2 and 3 years both included (24 and 36 months). #duration
SELECT *
FROM loan
WHERE duration = 24 AND duration = 36;

#5. Find the different values from the field A2 in District that contains the pattern "IC".
SELECT *
FROM district
WHERE district_name LIKE "%IC%";

SELECT *
FROM district
WHERE district_name REGEXP "IC";

#6. Find the different values from the field A2 in District that start with the letter 'K'.
SELECT *
FROM district
WHERE A2 LIKE "K%";

SELECT *
FROM district
WHERE A2 REGEXP "^K";

#7. Find the different values from the field A2 that end with the letter 'K'.
SELECT *
FROM district
WHERE A2 LIKE "K%";

SELECT *
FROM district
WHERE A2 REGEXP "K$";

#8. Discuss the possible use cases of using regular expressions in your query.

SELECT * FROM district WHERE A2 regexp '^B'; ### STARTS WITH B
SELECT * FROM district WHERE A2 regexp 'ov$'; ### ENDS WITH OV
SELECT distinct (k_symbol) FROM bank.order  ### CONTAING IP or IS
WHERE k_symbol regexp 'ip|is';


###### ACTIVITY 2

#1. Can you use the following query:
select * from district
where a3 like 'north%M%';
#instead of:
select * from district
where a3 like 'north_M%';
#Try both the queries and check the results.


#2. Look at the following query:
select * from district
where a2 regexp 'ch[e-r]';

#Can you modify the query to print the rows only for those values in the A2 column that starts with 'CH'?
select * from district
where a2 regexp '^CH';


#3. Pick any table and any column to test: "You can use any column from the table to sort the values even if that column is not used in the select statement." 
# Check the difference by writing the query with and without that column (column used to sort the results) in the select statement.

select type, operation from trans
order by balance;

select type, operation, balance from trans
order by balance;





