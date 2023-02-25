# Now use the bank database to make the following changes:
USE bank;

# a. Use the insert command to create a new entry in the loan table with the following values (8000,8000000,930705,96396,12,8033.0,'C'). Here each element corresponds to the values in columns in the table (in the order the columns appear in the table). This might raise an error. Why is that?
SELECT *
FROM loan;

INSERT INTO loan values(8000,8000000,930705,96396,12,8033.0,'C');

SELECT *
FROM loan
WHERE loan_id = 8000;

# b. Use the delete command to delete an entry from the table account where the account_id is 11382. Does this result in an error? If it does, then why?
-- Change Safe Update preference (turn off in order to use DELETE AND UPDATE table)
SET SQL_SAFE_UPDATES = 0;

-- Delete row from the table
DELETE FROM loan 
WHERE loan_id = 8000;

-- Change Safe Update preference back on again to protect the table (= unable the DELETE AND UPDATE table funtion)
SET SQL_SAFE_UPDATES = 1;



