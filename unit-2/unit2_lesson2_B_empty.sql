USE bank;

#1. How many distinct (different) types of transactions are there? --> SOL = 3



#2. How many clients live in the district with district_id = 46;  --> SOL = 76



#3. Get 10 the highest loans with finished contract (status A or B).



#4. Show loan info with additional columns month and day. Get 20. --> USE SUBSTRING



#6. Add an additional column day_type with values 'weekend' and 'workday' depending on the transaction day of the week.

# Complete the following:
SELECT  
CASE
	WHEN (DAYNAME(date) = "Saturday") THEN 
	ELSE 
    END as day_date
from trans;

#7. How many transactions were in the last month of activity?

#a) Check the last day:

#b) Use DATEDIFF for calculating the days. Complete the following:

select trans_id, DATE_FORMAT(date,"%Y-%m-%d") as correct_date, datediff(      ,DATE_FORMAT(date,"%Y-%m-%d")) as days_of_dif
from 
where datediff(    , DATE_FORMAT(date,"%Y-%m-%d")) <   ;
