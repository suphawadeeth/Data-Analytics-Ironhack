# 3.02 Activity 1
# Keep working on the bank database.

USE bank;

# Use the below query and list district_name, client_id and account_id for those clients who are owner of the account. 
# Order the results by district_name:

SELECT da.district_name AS district_name, c.client_id, d.account_id
FROM bank.disp d
JOIN bank.client c
ON d.client_id = c.client_id
JOIN bank.district da
ON da.district_id = c.district_id
WHERE d.type = 'OWNER'
ORDER BY da.district_name;





# 3.02 Activity 2
# List districts together with total amount borrowed and average loan amount.

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




# 3.02 Activity 3
# Create a temporary table district_overview in the bank database which lists districts together with total amount borrowed and average loan amount.

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







# 3.02 Activity 4
# Still working in the bank database, list the clients with no credit card.

SELECT client_id, count(card_id) AS num_card
FROM client 
INNER JOIN disp USING (client_id)
LEFT JOIN card USING (disp_id)
GROUP BY client_id
HAVING num_card = 0;
