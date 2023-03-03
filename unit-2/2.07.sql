# 2.07 Activity 1
# In this activity, we will be using the bank database.

USE bank;

-- Find out how many cards of each type have been issued.

SELECT type, COUNT(type) AS n_card
FROM card
GROUP BY type
;

-- Find out how many customers there are by the district.
SELECT district_id, COUNT(*)
FROM client
GROUP BY district_id
ORDER BY COUNT(*) DESC;


-- Find out average transaction value by type.

SELECT type, ROUND(AVG(amount), 2)
FROM trans
GROUP BY type
ORDER BY ROUND(AVG(amount), 2) DESC;

# 2.07 Activity 3
# Keep using the bank database.

-- Find the districts with more than 100 clients.

SELECT district_id, COUNT(client_id) AS n_client
FROM client
GROUP BY district_id
HAVING n_client > 100
ORDER BY n_client DESC;

-- Find the transactions (type, operation) with a mean amount greater than 10000.
SELECT type, ROUND(AVG(amount)) AS avg_amount
FROM trans
GROUP BY type
HAVING avg_amount > 10000;




