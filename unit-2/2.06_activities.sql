# 2.06 Activity 1
# Keep working on the bank database and its card table.
USE bank;

# Queries
-- Get different card types.
SELECT DISTINCT(type)
FROM card;


# Get transactions in the first 15 days of 1993.
-- find the first day of transaction in 1993
SELECT *
FROM trans
WHERE date LIKE "93%"
ORDER BY date ASC
LIMIT 10;

# Get transactions in the first 15 days of 1993.
-- check the 1st date of 1993
SELECT date
FROM trans
WHERE SUBSTRING(date, 1, 2) = 93
ORDER BY date ASC 
LIMIT 1;

-- check the 15th day
SELECT DATE_SUB((SELECT date
FROM trans
WHERE SUBSTRING(date, 1, 2) = 93
ORDER BY date ASC 
LIMIT 1), INTERVAL -14 day)
FROM trans
LIMIT 1;

-- Get transactions in the first 15 days of 1993.

-- If you know the date, the easiest way is to give exact date >> this returns 66 rows
SELECT *
FROM trans
WHERE date BETWEEN 930101 AND 930115;

-- Using datediff() >> this returns 66 rows
SELECT *
FROM trans
WHERE -15 < DATEDIFF(
(
	SELECT date from trans
    WHERE SUBSTRING(date, 1, 2) = 93
    ORDER BY date ASC
    LIMIT 1), 
	(date));

-- Get all running loans.
SELECT *
FROM loan
WHERE status = "C" OR status = "D";


-- Find the different values from the field A2 that start with the letter 'K'.
SELECT DISTINCT(A2)
FROM district
WHERE A2 LIKE "K%";

-- Find the different values from the field A2 that end with the letter 'K'.
SELECT DISTINCT(A2)
FROM district
WHERE A2 LIKE "%K";

-- Discuss the possible use cases of using regular expressions in your query.

