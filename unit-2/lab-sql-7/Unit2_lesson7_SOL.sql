USE bank;

##### 2.07 ACTIVITY 1 

# 1. Find out how many cards of each type have been issued. 

SELECT type, count(card_id) as num_of_cards
FROM card
GROUP BY type;

# 2. Find out how many customers there are by the district. (client table)
#    Sort them by number of customers in descending order.

SELECT district_id, COUNT(client_id) as num_of_clients
FROM client
GROUP BY district_id
ORDER BY num_of_clients desc;
# 3. Find out average transaction value by type. (use amount)

SELECT type, ROUND(AVG(amount)) as avg_amount
FROM trans
GROUP BY type;

##### 2.07 ACTIVITY 3

# 1. Find the districts with more than 100 clients.

SELECT district_id, COUNT(client_id) as num_of_clients
FROM client
GROUP BY district_id
HAVING num_of_clients > 100
ORDER BY num_of_clients desc;

# 2. Find the transactions (type, operation) with a mean amount greater than 10000.

SELECT type, operation, ROUND(AVG(amount)) AS mean_amount
FROM trans
GROUP BY type, operation
HAVING mean_amount >10000;



