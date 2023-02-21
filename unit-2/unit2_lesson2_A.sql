##### ACTIVITIES 
USE bank;

##### 2.03 Activity 1

# Get card_id and year_issued for all gold cards.



# When was the first gold card issued? (Year)



# Get transactions id's and dates in another format: '07/01/87'

SELECT trans_id, DATE_FORMAT(date, "%d/%m/%y") as trans_date FROM trans;


# Get issue date from card table as date_issued: 'November 7th, 1993' (try substring)



##### 2.03 Activity 2

# Null or empty values are usually a problem. Think about why those null values can appear and think of ways of dealing with them.

### look at birth_number to date in client table?

# Check for transactions with null or empty values for the column k_symbol.
# Count how many transactions have empty and non-empty k_symbol (in one query).




SELECT SUM(CASE WHEN amount is null THEN 1 ELSE 0 END) AS number_of_nulls ,COUNT(amount) AS number_of_non_null 
FROM trans;

