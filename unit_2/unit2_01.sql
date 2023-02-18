######################
## UNIT 2 - CLASS 1 ##
######################


# Indicate which database you will use
USE bank;

# Check what is in different tables
SELECT *
FROM account, card, client
LIMIT 10;

# Check types of cards
SELECT type
FROM card;


# Show the different types of cards (that would be unique in python)
SELECT DISTINCT(type)
FROM card;

# Show how many different types of cards there are (that would be nunique in python)
SELECT COUNT(DISTINCT type)
FROM card;

# Look at the clients in district id's lower than 50
SELECT client_id, district_id  
FROM client
WHERE district_id  < 50;     

# Take loans with a debt higher than 100000

SELECT loan_id, (amount - payments) AS debt
FROM loan
WHERE (amount - payments) > 100000;