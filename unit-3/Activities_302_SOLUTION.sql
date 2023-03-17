USE bank;

##### EXAMPLE 1: JOINS MULTIPLE TABLES ##### 

# Gather account_id, district_id, frequency, district_name, region, loan_id, amount, payments.

#### 1. WHICH TABLES???

# account
# district
# loan


#### 2. WHICH KEYS???

# district_id
# account_id

#### 3. FIRST JOIN and CHECK

SELECT a.account_id, a.district_id, a.frequency, d.region 
FROM bank.account AS a
JOIN bank.district AS d
#USING (district_id);
ON a.district_id = d.district_id;

#### 4. SECOND JOIN AND CHECK

SELECT a.account_id, a.district_id, a.frequency, d.region, l.loan_id, l.amount, l.payments  
FROM bank.account AS a
JOIN bank.district AS d
ON a.district_id = d.district_id
JOIN bank.loan AS l
ON a.account_id = l.account_id;


##### Activity 1 solution:

SELECT da.district_name AS district_name, c.client_id, d.account_id
FROM bank.disp d
JOIN bank.client c
ON d.client_id = c.client_id
JOIN bank.district da
ON da.district_id = c.district_id
WHERE d.type = 'OWNER'
ORDER BY da.district_name;

##### Activity 2 solution

#List districts together with total amount borrowed and average loan amount.
 
SELECT	
  d.district_name,
  SUM(l.amount) AS total_amount,
  SUM(l.amount) / COUNT(*) AS avg_loan
FROM loan l
LEFT JOIN account a
ON l.account_id = a.account_id
LEFT JOIN district d
ON a.district_id = d.district_id
GROUP BY district_name;


##### EXAMPLE 1: TEMPORARY TABLES #####

#### 1. WHICH TABLES???

# loan
# account

#### 2. WHICH KEYS???

# account_id

CREATE TEMPORARY TABLE bank.loan_and_account
SELECT l.loan_id, l.account_id, a.district_id, l.amount, l.payments, a.frequency
FROM bank.loan l
JOIN bank.account a
ON l.account_id = a.account_id;

SELECT * FROM bank.loan_and_account;


##### EXAMPLE 2: TEMPORARY TABLES #####

#### 1. WHICH TABLES???

# disp
# account

#### 2. WHICH KEYS???

# account_id

CREATE TEMPORARY TABLE bank.disp_and_account
SELECT d.disp_id, d.client_id, d.account_id, a.district_id, d.type 
FROM bank.disp as d
JOIN bank.account as a
ON d.account_id = a.account_id;

SELECT * FROM bank.disp_and_account;

##### Activity 3 solution

CREATE TEMPORARY TABLE bank.district_overview
SELECT	
  d.district_name,
  SUM(l.amount) AS total_amount,
  SUM(l.amount) / COUNT(*) AS avg_loan
FROM loan l
LEFT JOIN account a
ON l.account_id = a.account_id
LEFT JOIN district d
ON a.district_id = d.district_id
GROUP BY district_name;


#### EXAMPLE 1: ORDER MATTERS #####

SELECT * 
FROM bank.disp AS di
JOIN bank.client as cl
ON di.client_id = cl.client_id
JOIN bank.card as ca
ON di.disp_id = ca.disp_id
WHERE ca.type = 'gold';

#### EXAMPLE 2: ORDER MATTERS #####

SELECT * 
FROM bank.disp AS dis
JOIN bank.client as cl
ON dis.client_id = cl.client_id
JOIN bank.district as di
ON cl.district_id = di.district_id;


##### Activity 4 solution

# list the clients with no credit card.

SELECT client_id, count(card_id) num_cards
FROM client 
INNER JOIN disp USING (client_id)
LEFT JOIN card USING (disp_id)
GROUP BY client_id
HAVING num_cards = 0;



###### AREK's CTE #####

WITH district_list AS(
SELECT	
	district_name,
	SUM(l.amount) AS total_amount,
	SUM(l.amount) / COUNT(*) AS avg_loan
FROM
	loan l
    LEFT JOIN account a
		ON l.account_id = a.account_id
	LEFT JOIN district d
		ON a.district_id = d.district_id
GROUP BY	
	district_name
ORDER BY	
	total_amount DESC
)

SELECT
	*,
    RANK() OVER (ORDER BY avg_loan DESC) AS rank_average_loan
FROM	
	district_list
ORDER BY	
	total_amount DESC;
