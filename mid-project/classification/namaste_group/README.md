# Mid-Project (Namaste): Credit Card Prediction (Binary Classification)

Analysis of bank data, with the goal of understanding which customers accept credit card offers - including SQL queries, data viz with Tableau, and ML modelling. 

### Namaste Group members:
- Hamideh Aghaei
- Jesús Badenes
- Suphawadee Mangold

## Case
- Our bank company launched the credit card campaign (H1'2023) and failed the target compared to last year.
- The company wants to invest in marketing strategy using data-driven decisions

## Project Objectives:
- Company goal is to enhance sales growth with an ROI of > 400% and increase sales of 20,000 credit cards.
That leads to the data team goal:
    - Build a model (Machine Learning: Classification) to target the right population for the next campaign


### Schedule

Tuesday, 25 April 2023 - Planning 

Thursday, 27 April 2023 - EDA, SQL, build a baseline model 

Saturday, 29 April 2023 - Improving the model (imputation)

Tuesday, 2 May 2023 - Visualization with Tableau

Thrusday, 4 May 2023 - Finish slide

Saturday, 6 May 2023 - Presentation!



#### Note: 
- Our group uses trello to plan project --> [Link to Trello](https://trello.com/b/JAYXo8eF/midtermproject) 
- We communicate mainly via Discord group chat

### Project Detail
- Project detail can be found [here](https://github.com/ironhack-edu/data_mid_bootcamp_project_classification/blob/master/project_details_classification.md)


### Presentation
Rules:
- 10 minutes
- Leave 2-3 minutes for Q&A

Our presentation can be found [here](https://github.com/jebadca/Mid_Project_Namaste/blob/main/MakeMeMoney%20Bank%20-%20Credit%20Card%20Offer%20Acceptance.pdf)

### Tableau
- Some of our charts can be found [here](https://public.tableau.com/views/creditcad_marketing_project/Story2?:language=de-DE&publish=yes&:display_count=n&:origin=viz_share_link)
  
### Approaches
1) Understand the problem --> define target
2) Data Exploration: Python, SQL, Tableau
3) Build the best model
    - We have built and tested 10 different models along the process.
    - We have got the best model that will then be further used in the next marketing campaign.



# Extra
## How to import csv to SQLWorkbench

#### 1. Create schema 
Or use any schema that you've already created.

``` 
CREATE SCHEMA `name_your_schema` ;
``` 

#### 2. Create table (option: skip this step if you use Table Data Import Wizard) 
There are 2 ways you can do:

2.1) Under your schema >> Right click on Tables >> Create Table >> Name columns, datatype, etc. >> apply >> run it
    
2.2) Or just run the script below (adjust script according to your data.):

```
USE name_your_schema;
```

```
CREATE TABLE `name_your_schema`.`name_your_table` (
  `customer_number` INT NOT NULL,
  `offer_accepted` VARCHAR(45) NOT NULL,
  `reward` VARCHAR(45) NOT NULL,
  `mailer_type` VARCHAR(45) NOT NULL,
  `q1_balance` INT NOT NULL,
PRIMARY KEY (`customer_number`));
``` 

Note: the script is not complete. Write your script accordingly.

#### 3. After you have the table, import your data. Also here 2 methods:

3.1) Using wizard (no need the CREATE TABLE step for Wizard)

Right click on the schema or the new table that you've just created
>> select "Table Data Import Wizard"
>> Select csv file (watch out the headers)
>> select 'using existing table' if you've created table or create new table and give it a name
>> go ahead and let it run 

It could take a while to import data. Go eat something, come back and it should be finished.
Now you have the table with the data ready.

3.2) Evagelos's script

```
LOAD DATA INFILE 'xxxxxx.csv'
INTO TABLE name_your_table
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;
```



In case using wizard and the file cannot be imported.
It could be that ```local_infile``` setting in your MySQLWorkbench is disabled by default. That causes the server to refuse to load data to local. (For security reason, disabled local_infile is default in new version of MySQL).

To enable it use: ``` SET GLOBAL local_infile = 1; ```


**Note**: In this project, we have cleaned and removed NaN from the dataset before import in MySQLWorkbench and Tableau

### References:

#### Import Data to MySQLWorkbench
- [Security Considerations for LOAD DATA LOCAL](https://dev.mysql.com/doc/refman/8.0/en/load-data-local-security.html)
- [--local-infile=1 using MySQL Workbench, Stackexchange.com](https://dba.stackexchange.com/questions/17885/local-infile-1-using-mysql-workbench)
- [How to Import a CSV File to a MySQL Database](https://learnsql.com/blog/import-csv-mysql-database/)


#### Tableau
- [Show or Hide Missing Values or Empty Rows and Columns](https://help.tableau.com/current/pro/desktop/en-us/missing_values.htm)
- [TABLEAU CREATE BINS FROM A CALCULATED FIELD](https://tarsolutions.co.uk/blog/tableau-create-bins-from-measure-calculation/)
- [Forum: getting Null after creating bin in Tableau](https://community.tableau.com/s/question/0D54T00000tl1KNSAY/created-bins-but-getting-only-null-and-error-value-as-output)
- [Forum: display Null bins in histograms](https://community.tableau.com/s/question/0D54T00000C5ZWKSA3/display-of-null-bins-in-histograms)



#### Exploring Data Analysis
- [When Do You Need to Standardize the Variables in a Regression Model?](https://statisticsbyjim.com/regression/standardize-variables-regression/)


#### Evaluation Metrics for Classification Model

- [Metrics to Evaluate your Classification Model to take the right decisions](https://www.analyticsvidhya.com/blog/2021/07/metrics-to-evaluate-your-classification-model-to-take-the-right-decisions/)
- [8 Metrics to Measure Classification Performance](https://towardsdatascience.com/8-metrics-to-measure-classification-performance-984d9d7fd7aa)
- [20 Popular Machine Learning Metrics. Part 1: Classification & Regression Evaluation Metrics](https://towardsdatascience.com/20-popular-machine-learning-metrics-part-1-classification-regression-evaluation-metrics-1ca3e282a2ce)
- [The Ultimate Guide of Classification Metrics for Model Evaluation](https://towardsdatascience.com/the-ultimate-guide-of-classification-metrics-for-model-evaluation-83e4cdf294d9)
- [The 5 Classification Evaluation metrics every Data Scientist must know](https://towardsdatascience.com/the-5-classification-evaluation-metrics-you-must-know-aa97784ff226)
- [Evaluation Metrics for Classification Models](https://medium.com/analytics-vidhya/evaluation-metrics-for-classification-models-e2f0d8009d69)
- [Phi Coefficient A.K.A Matthews Correlation Coefficient (Binary Classification)](https://medium.com/@cdefaux/phi-coefficient-a-k-a-matthews-correlation-coefficient-binary-classification-11e2c29db91e)
- [Compute the Matthews correlation coefficient (MCC)](https://scikit-learn.org/stable/modules/generated/sklearn.metrics.matthews_corrcoef.html)
- [Is F1 the appropriate criterion to use? What about F2, F3,…, F beta?](https://towardsdatascience.com/is-f1-the-appropriate-criterion-to-use-what-about-f2-f3-f-beta-4bd8ef17e285)
- [24 Evaluation Metrics for Binary Classification (And When to Use Them)](https://neptune.ai/blog/evaluation-metrics-binary-classification)

