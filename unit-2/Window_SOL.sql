USE bank;

### Activity 1:

#In this activity, we will be using the table district and according to the following columns:
# a) Population
# b) Number of cities
# c) Urban ratio
# d) Average salary 

# Rank districts by the different variables.

SELECT district_id, district_name, population, avg_salary, ROW_NUMBER() OVER (ORDER BY population DESC) AS 'Ranking'
FROM district;

SELECT *, DENSE_RANK() OVER (ORDER BY num_cities DESC) AS "position"
FROM district;

SELECT *, DENSE_RANK() OVER (ORDER BY urban_ratio DESC) AS "position"
FROM district;

SELECT *, ROW_NUMBER() OVER (ORDER BY avg_salary DESC) AS "position"
FROM district;

# And if you need to group by Region without using GROUP BY clause?

SELECT * , ROW_NUMBER() OVER (PARTITION BY region ORDER BY population DESC) AS "Ranking"
FROM district;

SELECT * , DENSE_RANK() OVER (PARTITION BY region ORDER BY num_cities DESC) AS "Ranking"
FROM district;

SELECT * , DENSE_RANK() OVER (PARTITION BY region ORDER BY urban_ratio DESC) AS "Ranking"
FROM district;

SELECT * , ROW_NUMBER() OVER (PARTITION BY region ORDER BY avg_salary DESC) AS "Ranking"
FROM district;


### Activity 2:

# Use the transactions table in the bank database to find the Top 20 account_ids based on the total amount .

SELECT * FROM trans LIMIT 5;

SELECT account_id, ROUND(SUM(amount)) as total_amount
FROM trans
GROUP BY account_id
ORDER BY total_amount DESC
LIMIT 20;

SELECT distinct account_id, ROUND(SUM(amount) OVER (PARTITION BY account_id),2) as total_amount
FROM trans
ORDER BY total_amount DESC
LIMIT 20;


# Illustrate the difference between rank() and dense_rank().

SELECT *, RANK() OVER (ORDER BY amount DESC) AS "rank"
FROM trans
LIMIT 20;

SELECT *, DENSE_RANK() OVER (ORDER BY amount DESC) AS "rank"
FROM trans
LIMIT 20;

SELECT *, ROW_NUMBER() OVER (ORDER BY amount DESC) AS "rank"
FROM trans
LIMIT 20;






