USE bank;

######## ACTIVITY 1 ##########

## 1. Get the number of clients by district, returning district name.

SELECT district.district_name, COUNT(*) AS num_client
FROM client
INNER JOIN district
ON client.district_id = district.district_id
GROUP BY district.district_name
ORDER BY num_client DESC; 


## 2. Are there districts with no clients? 

SELECT district.district_name, COUNT(*) AS num_client
FROM client
INNER JOIN district
ON client.district_id = district.district_id
GROUP BY district.district_name
# ORDER BY num_client ASC
HAVING num_client = 0; 
# Every district has client


## How many clients are from Strakonice?

SELECT district.district_name, COUNT(*) AS num_client
FROM client
INNER JOIN district
ON client.district_id = district.district_id
WHERE district.district_name = "Strakonice"; 
# 43 clients are from Strakonice



## Move all clients from Strakonice to a new district with district_id = 100. HINT: Use UPDATE SET

-- Check the district_id of Strakonice
SELECT *
FROM district
WHERE district_name = "Strakonice";
# district_id = 20

-- Change district_id (SET) to 100 
UPDATE client
SET district_id = 100
WHERE district_id = 20;


## 3.How would you spot clients with wrong or missing district_id?

# I don't understand the question, 
# do we find the district that has no client? Or find the client that's assigned into a wrong district? And how do we know the client is in the right district?

-- I copied this script from Xisca, I understand what the code does but, still, I don't understand the question and don't understand how does this output answer the question ?????
SELECT district.district_name, count(client_id) AS num_of_clients
FROM bank.district
LEFT JOIN bank.client ### SAME BUT LEFT
ON client.district_id = district.district_id
GROUP BY district_name
ORDER BY num_of_clients;
# It shows the district (Strakonice) that has no client (missing) but it doesn't answer which client/how many client has the wrong district_id




## 4. Return clients to Strakonice. HINT: Use UPDATE SET
UPDATE client
SET district_id = 20
WHERE district_id = 100;



######## ACTIVITY 2 ##########

# Identify relationship degrees in our database.

# I use district table as an example
-- Count cardinality (rows)
SELECT COUNT(*)
FROM district;
# For district table --> cardinality = 77

-- Count degrees (columns)
SELECT COUNT(*)
FROM INFORMATION_SCHEMA.COLUMNS
WHERE table_name = 'district';
# For district table --> degree = 16


# Relationship
# example
-- district - account: one to many
-- district - client: one to many
-- account - loan: one to many


######## ACTIVITY 4 ##########

## 1. Make a list of all the clients together with region and district, ordered by region and district.


SELECT client.client_id, district.region, district.district_name
FROM client
INNER JOIN district
ON client.district_id = district.district_id
ORDER BY district.region, district.district_name;



 
## 2. Count how many clients do we have per region and district.

SELECT district.region, COUNT(district.region) AS num_client_per_region, district.district_name,  COUNT(district.district_name) AS num_client_per_district
FROM client
INNER JOIN district
ON client.district_id = district.district_id
GROUP BY district.region, district.district_name
ORDER BY num_client_per_region DESC, num_client_per_district DESC;






## 2.1 How many clients do we have per 10000 inhabitants?

SELECT 
	district.region, 
    district.district_name, 
    COUNT(client_id) AS client_per_district, 
    district.population AS population_per_district, 
    ROUND(COUNT(client_id)*10000/district.population, 1) AS client_per_10K
FROM client
INNER JOIN district
ON client.district_id = district.district_id
GROUP BY district.region, district.district_name
;

