USE bank;

#1. How many distinct (different) types of transactions are there? --> SOL = 3
SELECT COUNT(DISTINCT(type))
FROM trans;


#2. How many clients live in the district with district_id = 46;  --> SOL = 76
SELECT COUNT(*)
FROM client
WHERE district_id = 46;


#3. Get 10 the highest loans with finished contract (status A or B).
SELECT loan_id, amount
FROM loan
WHERE status = "A" OR status = "B"
ORDER BY amount DESC
LIMIT 10;


#4. Show loan info with additional columns month and day. Get 20. --> USE SUBSTRING
-- Check loan table
SELECT *
FROM loan;

SELECT loan_id, amount, payments, SUBSTRING(date, 3,2) AS month, SUBSTRING(date, 5,2) AS day
FROM loan
ORDER BY amount DESC
LIMIT 20;


#6. Add an additional column day_type with values 'weekend' and 'workday' depending on the transaction day of the week.
SELECT *,
CASE
	WHEN (DAYNAME(date) = "Saturday" OR DAYNAME(date) = "Sundy") 
    THEN "weekend"
    ELSE "workday"
    END AS day_type
FROM trans;


#7. How many transactions were in the last month of activity?

#a) Check the last day:
SELECT *
FROM trans
ORDER BY date DESC
LIMIT 10;

#b) Use DATEDIFF for calculating the days. Complete the following:
-- Calculating 30 days 
SELECT trans_id, DATE_FORMAT(date,"%Y-%m-%d") as correct_date, datediff((
	SELECT DATE_FORMAT(date,"%Y-%m-%d") as correct_date
	FROM trans
	ORDER BY date DESC
	LIMIT 1
),DATE_FORMAT(date,"%Y-%m-%d")) as days_of_dif
FROM trans
WHERE datediff((
	SELECT DATE_FORMAT(date,"%Y-%m-%d") as correct_date
	FROM trans
	ORDER BY date DESC
	LIMIT 1
), DATE_FORMAT(date,"%Y-%m-%d")) < 30  ;

-- Count(), for answering question "how many"
-- Try: calculate without transform "date" to date time format, because, anyway, we do not want to disply datetime. (We want to disply the number of activity)
SELECT COUNT(*)
FROM trans
WHERE DATEDIFF( 
(	SELECT date 
	FROM trans 
    ORDER BY date DESC
    LIMIT 1), 
(date)
) < 30;

-- Script transform "date" to date time format
 SELECT COUNT(*)
FROM trans
WHERE DATEDIFF( 
(	SELECT DATE_FORMAT(date, "%Y-%m-%d") AS correct_date
	FROM trans 
    ORDER BY correct_date DESC
    LIMIT 1), 
(DATE_FORMAT(date, "%Y-%m-%d"))
) < 30;