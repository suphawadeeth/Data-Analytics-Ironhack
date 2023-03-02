USE bank;

### Activity 1:

#In this activity, we will be using the table district and according to the following columns:
# a) Population
# b) Number of cities
# c) Urban ratio
# d) Average salary 

# Rank districts by the different variables. (Look that we don't use partition by here)

SELECT *, ROW_NUMBER() OVER (ORDER BY population DESC) AS 'Ranking'
FROM district;

# And if you need to group by Region without using GROUP BY clause? (Maybe with partition by?)




### Activity 2:

# Use the transactions table in the bank database to find the Top 20 account_ids based on total amount.





# Illustrate the difference between rank() and dense_rank().


