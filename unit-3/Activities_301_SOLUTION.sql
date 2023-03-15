USE bank;

######## ACTIVITY 1 ##########

#### 1. Get the number of clients by district, returning district name.

SELECT count(client_id) num_of_clients, district.district_name 
FROM bank.district
INNER JOIN bank.client
ON client.district_id = district.district_id
GROUP BY district_name;

##### 2. Are there districts with no clients? 

SELECT count(client_id) num_of_clients, district.district_name 
FROM bank.district
INNER JOIN bank.client
ON client.district_id = district.district_id
GROUP BY district_name
HAVING num_of_clients = 0;


#### How many clients have Strakonice?

SELECT count(client_id) num_of_clients, district.district_name 
FROM bank.district
INNER JOIN bank.client
ON client.district_id = district.district_id
WHERE district_name = "Strakonice"
GROUP BY district_name;

##### Move all clients from Strakonice to a new district with district_id = 100. 

SELECT district_id, district_name 
FROM bank.district
WHERE district_name = 'Strakonice';
UPDATE bank.client
SET district_id = 100
WHERE district_id = 20;

###### 3.How would you spot clients with wrong or missing district_id?

SELECT count(client_id) num_of_clients, district.district_name 
FROM bank.district
LEFT JOIN bank.client ### SAME BUT LEFT
ON client.district_id = district.district_id
GROUP BY district_name
ORDER BY num_of_clients;

###### 4. Return clients to Strakonice.

UPDATE bank.client
SET district_id = 20
WHERE district_id = 100;

######## ACTIVITY 4 ##########

##### 1. Make a list of all the clients together with region and district, ordered by region and district.

SELECT client_id, district.region, district.district_name
FROM bank.district
INNER JOIN bank.client
ON client.district_id = district.district_id
ORDER BY district.region, district.district_name;
 
##### 2. Count how many clients do we have per region and district.

SELECT district.region, district.district_name, count(client_id)
FROM bank.district
INNER JOIN bank.client
ON client.district_id = district.district_id
GROUP BY district.region, district.district_name
ORDER BY district.region, district.district_name;

##### 2.1 How many clients do we have per 10000 inhabitants?

select district.region, district.district_name, district.population, count(client_id), round(10000*count(client_id)/district.population) clients_per_10000
from bank.district
inner join bank.client
on client.district_id = district.district_id
group by district.region, district.district_name, district.population
order by district.region, district.district_name;


