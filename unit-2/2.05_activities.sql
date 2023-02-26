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


# 2.05 Activity 4
# Create the rest of the tables in the bank database (at least the client and the card tables).




# Design and create a new database structure. Justify your changes.
CREATE TABLE new_table (
	card_id int(11) default NULL,
    disp_id int(11) default NULL,
    type text,
    issued text
);


# Some ideas include renaming columns to ones that make more sense and, for eg., in the table district, adding foreign keys wherever necessary.

ALTER TABLE district RENAME COLUMN A1 TO district_id;
ALTER TABLE district RENAME COLUMN A2 TO district_name;
ALTER TABLE district RENAME COLUMN A3 TO region;
ALTER TABLE district RENAME COLUMN A4 TO population;
ALTER TABLE district RENAME COLUMN A5 TO num_muni_very_small;
ALTER TABLE district RENAME COLUMN A6 TO num_muni_small;
ALTER TABLE district RENAME COLUMN A7 TO num_muni_medium;
ALTER TABLE district RENAME COLUMN A8 TO num_muni_large;
ALTER TABLE district RENAME COLUMN A9 TO num_cities;
ALTER TABLE district RENAME COLUMN A10 TO urban_ratio;
ALTER TABLE district RENAME COLUMN A11 TO avg_salary;
ALTER TABLE district RENAME COLUMN A12 TO unmployment_rate_95;
ALTER TABLE district RENAME COLUMN A13 TO unmployment_rate_96;
ALTER TABLE district RENAME COLUMN A14 TO entrepreneurs;
ALTER TABLE district RENAME COLUMN A15 TO crimes_95;
ALTER TABLE district RENAME COLUMN A16 TO crimes_96;



ALTER TABLE loan
ADD status_desc varchar(30);

SELECT * FROM loan LIMIT 5;

UPDATE loan SET status_desc =
case
  when status = 'A' then 'Good - Contract Finished'
  when status = 'B' then 'Defaulter - Contract Finished'
  when status = 'C' then 'Good - Contract Running'
  when status = "D" then 'In Debt - Contract Running'
  else "Invalid status"
  end;
    
    
    



