##### ACTIVITIES 
USE bank;

##### 2.03 Activity 1

# Get card_id and year_issued for all gold cards.
SELECT card_id, issued AS year_issued
FROM card
WHERE type = "gold";


# When was the first gold card issued? (Year)
SELECT card_id, issued
FROM card
WHERE type = "gold"
ORDER BY issued DESC
LIMIT 1;


# Get transactions id's and dates in another format: '07/01/87'

SELECT trans_id, DATE_FORMAT(date, "%d/%m/%y") as trans_date FROM trans;


# Get issue date from card table as date_issued: 'November 7th, 1993' (try substring)
-- check table
SELECT * FROM card;

-- check data type of "issued" in card table
DESCRIBE card;

-- we see that "issued" is string, so we'll use substring() to get date_issued: 'November 7th, 1993'
SELECT card_id, DATE_FORMAT(SUBSTRING(issued, 1, 6), "%M %D, %Y") AS date_issued
FROM card;



##### 2.03 Activity 2

# Null or empty values are usually a problem. Think about why those null values can appear and think of ways of dealing with them.
SELECT *
FROM trans
WHERE amount = "";

-- Show n_rows of null & non-null in "amount" column in 1 query
SELECT SUM(CASE WHEN amount is null THEN 1 ELSE 0 END) AS number_of_nulls ,COUNT(amount) AS number_of_non_null 
FROM trans;

### look at birth_number to date in client table?
SELECT *
FROM client
LIMIT 10;



# Check for transactions with null or empty values for the column k_symbol.
SELECT *
FROM trans
WHERE k_symbol = "";

# Count how many transactions have empty and non-empty k_symbol (in one query).

SELECT SUM(CASE WHEN k_symbol = "" 
    THEN 1 ELSE 0 
    END) AS empty_k_symbol, 
    SUM(CASE WHEN k_symbol = "" 
    THEN 0 ELSE 1 
    END) AS non_empty_k_symbol
FROM trans;




