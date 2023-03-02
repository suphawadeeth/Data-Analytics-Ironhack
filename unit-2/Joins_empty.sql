USE bank;


### Activity 1:
# Check the cards from the client with id = 87

SELECT D.client_id, C.card_id
FROM disp AS D
INNER JOIN card AS C
ON D.disp_id = C.disp_id
WHERE D.client_id = 87;

### Activity 2:
# Check the clients that have more cards




### Activity 3:
# Get a list of districts names ordered by the number of customers.




### Activity 4:
# Get a list of regions ordered by the number of customers.





### Activity 5:
# Get the number of accounts opened by district name and year. Check if it is correct.


SELECT d.district_name, DATE_FORMAT(CONVERT(date, date),'%Y') AS year, COUNT(a.account_id) num_accounts
FROM account a 
INNER JOIN district d 
ON a.district_id = d.district_id
GROUP BY district_name, year
ORDER BY district_name asc, year desc;