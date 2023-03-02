USE bank;


### Activity 1:
# Check the cards from the client with id = 87

SELECT D.client_id, C.card_id
FROM disp AS D
JOIN card AS C
ON D.disp_id = C.disp_id
WHERE D.client_id = 87;

### Activity 2:
# Check the clients that have more cards

SELECT D.client_id, COUNT(C.card_id) AS num_of_cards
FROM disp AS D
INNER JOIN card AS C
ON D.disp_id = C.disp_id
GROUP BY D.client_id
ORDER BY num_of_cards DESC;

### Activity 3:
# Get a list of districts ordered by the number of customers.

SELECT district_name, count(*) AS num_customers
FROM client
INNER JOIN district
ON client.district_id = district.district_id
GROUP BY district_name
ORDER BY num_customers DESC;


### Activity 4:
# Get a list of regions ordered by the number of customers.

SELECT region, count(*) AS num_customers
FROM client
INNER JOIN district 
ON client.district_id = district.district_id
GROUP BY district.region
ORDER BY num_customers DESC;


### Activity 5:
# Get the number of accounts opened by district and year.Check if it is correct.

SELECT d.district_name, DATE_FORMAT(CONVERT(date, date),'%Y') AS year, COUNT(*) num_accounts
FROM account a 
INNER JOIN district d 
ON a.district_id = d.district_id
GROUP BY district_name, year
ORDER BY district_name, year;



#### LAB QUERIES 8 
USE sakila;
SELECT title, length, DENSE_RANK() OVER (ORDER BY length desc) AS "rank"
FROM film
WHERE length > 0;
