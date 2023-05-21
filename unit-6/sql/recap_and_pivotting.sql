######### RECAP ###########
##########################
USE bank;
# 1. JOINS:
-- get client information for defaulted clients
select a.account_id, a.district_id, a.frequency, d.district_name,
	   d.region, l.loan_id, l.amount, l.payments, l.status
from bank.account a join bank.district d
on a.district_id = d.district_id
join bank.loan l
on a.account_id = l.account_id
where l.status = "B"
order by a.account_id;

# 2. SUBQUERIES:
-- get the amount of the loan and the payment made, for the customers who defaulted,
-- and which value owed is bigger than the average

-- step 1: average of amount owed by defaulted clients
select round(avg(amount),2)
from bank.loan
where status = "B";

-- step 2: getting defaulted clients info
select a.account_id, a.district_id, a.frequency, d.district_name,
	   d.region, l.loan_id, l.amount, l.payments, l.status
from bank.account a join bank.district d
on a.district_id = d.district_id
join bank.loan l
on a.account_id = l.account_id
where l.status = "B"
order by a.account_id;

-- step 3: filter to get the clients with a default amount bigger than the average
select * from (
  select a.account_id, a.district_id, a.frequency, d.district_name,
         d.region, l.loan_id, l.amount, l.payments, l.status
  from bank.account a join bank.district d
  on a.district_id = d.district_id
  join bank.loan l
  on a.account_id = l.account_id
  where l.status = "B"
  order by a.account_id
) sub1
where sub1.amount > (
  select round(avg(amount),2)
  from bank.loan
  where status = "B")
order by amount; 

/*
Activity 1
*/

# 3. CTEs
-- from the query above, get the last transaction
with cte_1 as
(
    select * from (
      select a.account_id, a.district_id, a.frequency, d.district_name,
        d.region, l.loan_id, l.amount, l.payments, l.status
      from bank.account a
      join bank.district d
      on a.district_id = d.district_id
        join bank.loan l
        on a.account_id = l.account_id
        where l.status = "B"
        order by a.account_id ) sub1
      where sub1.amount > (
        select round(avg(amount),2)
        from bank.loan
        where status = "B")
      order by amount desc
)
select cte_1.account_id, max(date(t.date)) as Last_transaction
from cte_1
join bank.trans t on cte_1.account_id = t.account_id
group by cte_1.account_id
order by account_id;
-- order by max(date(t.date)) desc;

# 4. Correlated Subqueries
-- get customer from status 'A' with the same loan duration and payments above the average
select *
from bank.loan l1
where l1.payments > (
	select avg(payments)
    from bank.loan l2
    where l1.duration = l2.duration and l1.account_id != l2.account_id)
and l1.status = "A"
order by account_id;

/*
Activity 2
*/


### END OF RECAP ###

-- Pivoting 
-- get total transation amount from all customer in 1st quarter of 1993
select account_id, round(sum(amount),2) as Amount, date_format(date, "%M") as Month
from trans
where date_format(date, "%Y") = 1993 and date_format(date, "%m") <= 3
group by account_id, Month;

-- other SQL flavors have pivot() function, but mySQL no
-- so... getting creative:
select account_id,
	   sum(case when Month = 'January' Then Amount end) as January, -- try with min(), it's the same result
	   sum(case when Month = 'February' Then Amount end) as February,
	   sum(case when Month = 'March' Then Amount end) as March
from (
  select account_id, round(amount,2) as Amount, date_format(date, "%M") as Month
  from trans
  where date_format(date, "%Y") = 1993 and date_format(date, "%m") <= 3
  -- group by account_id, Month
) sub1
group by account_id
order by account_id;

/*
Activity 3
*/

