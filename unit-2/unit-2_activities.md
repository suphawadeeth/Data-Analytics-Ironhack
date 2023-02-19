# 2.01 Activity 1
Conduct some research on the differences between structured and unstructured data. You can use the following link for reference: https://www.datamation.com/big-data/structured-vs-unstructured-data.html. Feel free to use any other resource as well.

Every student would explain one difference to the other students in class.

# Structured vs Unstructured Data
## Data Format
- Structured data is highly specific and is stored in a predefined format
- Unstructured data is a collection of various types of data that are stored in their native formats. 

- Structured data takes advantage of schema-on-write 
- Unstructured data employs schema-on-read

## Where does it store?
- Structured data is commonly stored in data warehouses 
- Unstructured data is stored in data lakes 

Both have cloud-use potential, but structured data allows for less storage space and unstructured data requires more.

## Users
- Structured data can be used by the average business user
- Unstructured data requires data science expertise in order to gain accurate business intelligence.

# Semi-Structured Data
- Semi-structured data refers to **unstructured data that has metadata** that identifies certain characteristics


##### Reference:
- [Structured vs. Unstructured Data: A Complete Guide](https://www.talend.com/resources/structured-vs-unstructured-data/)


# 2.01 Activity 2
List at least three advantages of relational databases over data stored in for eg. excel sheets, google spreadsheets, and other files such as .txt, .csv, etc.

Hint: For eg., different tools have been developed to work with relational databases to query data. You can also talk about ACID principles (Google is your friend. 😉).

## What is Relational Database?
- Relational databases are also called **relational database management systems (RDBMS)** or **SQL databases** 
- In relational databases, tables are linked to one another [(with key-base relationhips)](https://www.integrate.io/glossary/what-is-unstructured-data/). Therefore, queries on the database can produce relations between these tables.
- Relational databases work with **structured data**
- SQL database examples: MySql, Oracle, Sqlite, Postgres and MS-SQL. NoSQL database examples: MongoDB, BigTable, Redis, RavenDb, Cassandra, Hbase, Neo4j and CouchDb. [Ref](https://www.pluralsight.com/blog/software-development/relational-vs-non-relational-databases)

## Advantages of Relational Databases
1. Data integrity
2. Data accuracy,
3. Basic structure is easy to understand
4. Easy access of data due to its simplicity
5. More secure
6. Collaboration: multi-user

Cons: sloe data processing, costly: need expensive hardware for its scalability, no support for complex data types

## Flat File, Unstructured, Non-Relational Database
- Flat file has a uniform format, no structures for indexing or recognizing relationships between records. [Ref.](https://en.wikipedia.org/wiki/Flat-file_database)
- The file is simple e.g. csv, txt, tsv, or a binary file.
- Flat files hence can be considered [unstructured data](https://www.integrate.io/glossary/what-is-unstructured-data/) including Word files, PDFs, images, etc.
- There are two main strategies for handling unstructured data at scale: a **NoSQL database** and a **data lake**. [Ref.](https://www.integrate.io/glossary/what-is-unstructured-data/)
- Popular Non-Relational/NoSQL Databases: mongoDB, IBM Cloundant, Amazon DynamoDB, Apache Cassandra 

## Advantages of Unstructured, Non-Relational Database
1. Data and analysis can be more dynamic, flexibity
2. High performance
3. Open-source
4. Handle large amount of data size

Cons: poor data consistency, no clear standard, querying difficulties due to non-organized data

Reference:
- [Relational Database Benefits and Limitations (Advantages & Disadvantages)](https://databasetown.com/relational-database-benefits-and-limitations/)
- [Key difference between relational and non-relational database](https://databasetown.com/relational-vs-non-relational-database/)


# 2.01 Activity 3
Refer to the bank database case study using files_for_activities/case_study_bank.md file.

[Unit2_01.sql](https://github.com/suphawadeeth/Data-Analytics-Ironhack/blob/main/unit-2/unit2_01.sql)

# 2.01 Activity 4
Refer to files_for_activities/mysql_dump.sql database. Load it to Sequel Pro, and there you will find a bank database which we will use for the following exercise. This is the same database used for the class example. Keep using the bank database for iterations that are related to it (3 and 4).

[2.01 Activity 4](https://github.com/suphawadeeth/Data-Analytics-Ironhack/blob/main/unit-2/2.01-activity-4.sql)

==============2.02==============
# 2.02 Activity 1-4

[2.02 Activity 1-4](https://github.com/suphawadeeth/Data-Analytics-Ironhack/blob/main/unit-2/2.02-activities.sql)