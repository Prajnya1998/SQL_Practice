# SQL Server Practice Projects

## About

This repository contains hands-on SQL Server projects completed as part of my Data Analyst and SQL Developer learning journey.

The projects cover SQL fundamentals, intermediate concepts, advanced SQL Server development, query optimization, transactions, dynamic SQL, error handling, and business reporting using the Global Superstore dataset.

The goal of this repository is to demonstrate practical SQL skills through real-world business scenarios.

---

## Technologies Used

- Microsoft SQL Server
- SQL Server Management Studio (SSMS)
- Visual Studio Code (VS Code)
- GitHub
- Global Superstore Dataset

---

## Project Roadmap

| Project | Topic |
|---------|-------------------------------|
| Project 1 | Global Superstore Analysis |
| Project 2 | SQL JOINs |
| Project 3 | Aggregate Functions |
| Project 4 | Filtering & Sorting |
| Project 5 | String Functions |
| Project 6 | Date Functions |
| Project 7 | Window Functions |
| Project 8 | Subqueries |
| Project 9 | Common Table Expressions (CTEs) |
| Project 10 | SQL Views |
| Project 11 | Stored Procedures |
| Project 12 | User Defined Functions |
| Project 13 | Triggers |
| Project 14 | Transactions |
| Project 15 | Indexes |
| Project 16 | Performance Tuning |
| Project 17 | Dynamic SQL |
| Project 18 | Error Handling & Logging |
| Project 19 | SQL Interview Project |

---

## Project 1: Global Superstore Analysis

This project contains SQL queries written on the Global Superstore dataset.

### Skills Practiced

- SELECT
- WHERE
- ORDER BY
- GROUP BY
- Aggregate Functions
- TOP
- SUM
- COUNT
- Profit Analysis
- Sales Analysis

### Dataset

Global Superstore Sales Dataset

### Queries Included

1. Total Sales
2. Total Profit
3. Total Orders
4. Sales by Category
5. Profit by Category
6. Top 10 Products by Sales

### Tools Used

- SQL Server Management Studio (SSMS)
- VS Code
- GitHub


## Project 2: SQL JOINs Practice

### Concepts Covered

* INNER JOIN
* LEFT JOIN
* RIGHT JOIN
* FULL OUTER JOIN
* Primary Key
* Foreign Key

### Tables Used

#### Employees

Stores employee information including department assignment.

#### Departments

Stores department details and department heads.

### Learning Outcome

Learned how to combine data from multiple tables using JOINs and understand relationships using Primary Keys and Foreign Keys.

### File

* joins_practice.sql


## Project 3: Aggregate Functions Practice

### Project Overview

This project focuses on SQL Aggregate Functions using the Global Superstore dataset. Aggregate functions are used to summarize and analyze large volumes of data for business reporting and decision-making.

### Skills Practiced

* SUM()
* AVG()
* MIN()
* MAX()
* COUNT()
* GROUP BY
* HAVING

### Sample Analysis Performed

* Total Sales Calculation
* Average Sales Analysis
* Minimum and Maximum Sales Identification
* Record Counting
* Sales Aggregation by Category
* Category-wise Sales Filtering using HAVING

### Learning Outcome

Learned how to summarize data, generate business insights, perform category-level analysis, and filter aggregated results using SQL Aggregate Functions.

### File

* aggregate_functions_practice.sql



## Project 4: Filtering and Sorting Practice

### Project Overview

This project demonstrates SQL techniques for filtering, searching, and sorting data using the Global Superstore dataset. These operations are commonly used in reporting, dashboards, and business analysis.

### Skills Practice

- WHERE
- AND
- OR
- BETWEEN
- IN
- LIKE
- DISTINCT
- TOP
- ORDER BY (ASC & DESC)

### Sample Analysis Performed

- Filtered orders based on sales values
- Filtered records using multiple conditions
- Retrieved records within a specified range
- Selected records from multiple categories
- Searched customer names using pattern matching
- Retrieved unique values using DISTINCT
- Displayed top records using TOP
- Sorted sales in ascending and descending order

### Learning Outcome

Learned how to efficiently filter, search, and sort data using SQL to answer common business questions and prepare data for reporting.

### File

- filtering_sorting_practice.sql


## Project 5: String Functions Practice

### Project Overview

This project demonstrates commonly used SQL string functions for cleaning, formatting, and transforming text data using the Global Superstore dataset.

### Skills Practiced

* UPPER()
* LOWER()
* LEN()
* LEFT()
* RIGHT()
* SUBSTRING()
* CONCAT()
* TRIM()
* REPLACE()
* CHARINDEX()

### Sample Analysis Performed

* Converted customer names to uppercase and lowercase
* Counted the length of customer names
* Extracted characters from the left and right
* Retrieved portions of text using SUBSTRING
* Combined text values using CONCAT
* Removed unwanted spaces using TRIM
* Replaced characters using REPLACE
* Located characters using CHARINDEX

### Learning Outcome

Learned how to clean, standardize, and manipulate text data using SQL string functions, which are widely used in reporting, ETL processes, and data preparation.

### File

* string_functions_practice.sql


## Project 6: Date Functions Practice

### Project Overview

This project demonstrates SQL date and time functions using the Global Superstore dataset. These functions are widely used in reporting, business intelligence, financial analysis, and ETL processes.

### Skills Practiced

- GETDATE()
- YEAR()
- MONTH()
- DAY()
- DATEADD()
- DATEDIFF()
- EOMONTH()
- CAST()
- CONVERT()
- FORMAT()

### Sample Analysis Performed

- Retrieved the current system date and time
- Extracted year, month, and day from order dates
- Added and subtracted days, months, and years
- Calculated the difference between order and ship dates
- Retrieved the last day of the month
- Converted date data types
- Formatted dates for reporting

### Learning Outcome

Learned how to manipulate, calculate, and format dates using SQL Server date functions for reporting, analytics, and business applications.

### File

- date_functions_practice.sql


## Project 7: Window Functions Practice

### Project Overview

This project demonstrates SQL Window Functions using the Global Superstore dataset. Window functions are used to perform calculations across rows without grouping the data, making them essential for ranking, comparisons, trend analysis, and reporting.

### Skills Practiced

- ROW_NUMBER()
- RANK()
- DENSE_RANK()
- NTILE()
- LAG()
- LEAD()

### Sample Analysis Performed

- Assigned unique row numbers to customers based on sales
- Ranked customers by sales
- Compared RANK() and DENSE_RANK()
- Divided customers into sales quartiles using NTILE()
- Compared current sales with previous sales using LAG()
- Compared current sales with next sales using LEAD()

### Learning Outcome

Learned how to use SQL Window Functions for ranking, segmentation, trend analysis, and comparing values across rows without using self-joins.

### File

- window_functions_practice.sql


## Project 8: Subqueries Practice

### Project Overview

This project demonstrates SQL Subqueries using the Global Superstore dataset. It covers single-row and multi-row subqueries, filtering techniques, and correlated subqueries used in real-world business scenarios.

### Skills Practiced

- Single Row Subquery
- AVG()
- MAX()
- IN
- EXISTS
- ANY
- ALL
- Correlated Subquery

### Sample Analysis Performed

- Retrieved products with sales above the average
- Found products with the highest sales
- Used IN to filter records returned by another query
- Used EXISTS to check matching records
- Compared values using ANY and ALL
- Compared product sales with their category average using a correlated subquery

### Learning Outcome

Learned how to write and use SQL subqueries for filtering, comparison, and advanced business analysis using both independent and correlated queries.

### File

- subqueries_practice.sql


## Project 9: Common Table Expressions (CTEs)

### Project Overview

This project demonstrates SQL Common Table Expressions (CTEs) using the Global Superstore dataset. CTEs improve query readability, simplify complex logic, and are widely used in enterprise reporting and analytics.

### Skills Practiced

- Basic CTE
- Multiple CTEs
- CTE with JOIN
- CTE with Window Functions
- Recursive CTE

### Sample Analysis Performed

- Calculated average sales using a CTE
- Used multiple CTEs in a single query
- Joined CTE results with the original table
- Combined CTEs with ROW_NUMBER()
- Generated recursive results using a Recursive CTE

### Learning Outcome

Learned how to simplify complex SQL queries using CTEs, improve query readability, and solve hierarchical data problems with Recursive CTEs.

### File

- cte_practice.sql


## Project 10: SQL Views Practice

### Project Overview

This project demonstrates SQL Views using the Global Superstore dataset. Views simplify complex queries, improve security, and provide reusable virtual tables for reporting and business intelligence.

### Skills Practiced

- CREATE VIEW
- SELECT FROM VIEW
- ALTER VIEW
- DROP VIEW
- CREATE OR ALTER VIEW

### Sample Analysis Performed

- Created a reusable sales summary view
- Retrieved data using the view
- Modified the view to include additional columns
- Deleted an existing view
- Used CREATE OR ALTER VIEW for efficient view management

### Learning Outcome

Learned how SQL Views simplify reporting, improve code reusability, enhance security, and make enterprise SQL development more maintainable.

### File

- views_practice.sql


## Project 11: SQL Stored Procedures Practice

### Project Overview

This project demonstrates SQL Stored Procedures using the Global Superstore dataset. It covers creating, executing, modifying, and managing stored procedures with parameters and error handling, following real-world business scenarios.

### Skills Practiced

- CREATE PROCEDURE
- EXECUTE PROCEDURE
- ALTER PROCEDURE
- Stored Procedure with One Parameter
- Stored Procedure with Multiple Parameters
- DROP PROCEDURE
- CREATE OR ALTER PROCEDURE
- TRY...CATCH Error Handling

### Sample Analysis Performed

- Created reusable stored procedures
- Executed stored procedures for reporting
- Modified stored procedures using ALTER PROCEDURE
- Filtered results using input parameters
- Applied multiple parameters for dynamic reporting
- Implemented error handling using TRY...CATCH

### Learning Outcome

Learned how Stored Procedures improve code reusability, performance, security, and maintainability while supporting dynamic reporting and enterprise-level SQL development.

### File

- stored_procedures_practice.sql


## Project 12: SQL User Defined Functions (UDFs)

### Project Overview

This project demonstrates SQL User Defined Functions (UDFs) using the Global Superstore dataset. It includes Scalar Functions and Table-Valued Functions with real-world business scenarios to show how reusable logic simplifies SQL development.

### Skills Practiced

- Scalar Functions
- Table-Valued Functions (TVF)
- Execute Functions
- ALTER FUNCTION
- DROP FUNCTION
- Function Reusability
- Business Logic Implementation

### Sample Analysis Performed

- Calculated product discounts using a Scalar Function
- Returned Technology products using a Table-Valued Function
- Modified business logic using ALTER FUNCTION
- Removed functions using DROP FUNCTION
- Used functions inside SELECT statements

### Learning Outcome

Learned how SQL User Defined Functions improve code reusability, maintainability, and consistency by centralizing business logic and calculations.

### File

- user_defined_functions_practice.sql


## Project 13: SQL Triggers Practice

### Project Overview

This project demonstrates SQL Triggers in SQL Server using a real-world employee audit scenario. It covers automatic auditing, preventing unauthorized deletions, trigger modification, and trigger removal.

### Skills Practiced

- AFTER INSERT Trigger
- INSTEAD OF DELETE Trigger
- ALTER TRIGGER
- DROP TRIGGER
- inserted Logical Table
- deleted Logical Table
- Audit Logging
- Business Rule Enforcement

### Sample Business Scenario

- Automatically record newly inserted employees into an audit table.
- Prevent employee records from being deleted.
- Log delete attempts into an audit table.
- Modify trigger behavior using ALTER TRIGGER.
- Remove triggers safely using DROP TRIGGER.

### Learning Outcome

Learned how SQL Triggers automatically execute on database events, enforce business rules, maintain audit logs, and improve data integrity in enterprise applications.

### File

- triggers_practice.sql


## Project 14: SQL Transactions Practice

### Project Overview

This project demonstrates SQL Transactions using a real-world banking money transfer scenario. It explains how SQL Server maintains data consistency using transactions and proper error handling.

### Skills Practiced

- BEGIN TRANSACTION
- COMMIT TRANSACTION
- ROLLBACK TRANSACTION
- TRY...CATCH
- SAVE TRANSACTION (Savepoint)
- Banking Transaction Simulation
- Error Handling

### Sample Business Scenario

- Transfer money between bank accounts.
- Commit successful transactions.
- Roll back failed transactions.
- Handle errors using TRY...CATCH.
- Use Savepoints for partial rollback.

### Learning Outcome

Learned how SQL Transactions ensure data consistency, prevent partial updates, and safely handle errors in enterprise applications such as banking, finance, and e-commerce.

### File

- transactions_practice.sql


## Project 15: SQL Indexes Practice

### Project Overview

This project demonstrates SQL Server Indexes using the Global Superstore dataset. It covers Clustered and Non-Clustered Indexes, query optimization, execution plans, and index maintenance.

### Skills Practiced

- Clustered Index
- Non-Clustered Index
- Execution Plan Analysis
- SET STATISTICS IO
- SET STATISTICS TIME
- ALTER INDEX
- REBUILD
- REORGANIZE
- DROP INDEX

### Sample Business Scenario

- Analyze slow customer search queries.
- Create a Non-Clustered Index on Customer_Name.
- Compare execution plans before and after indexing.
- Maintain indexes using REBUILD and REORGANIZE.
- Remove unused indexes safely.

### Learning Outcome

Learned how SQL Server indexes improve query performance, how to analyze execution plans, and how to maintain indexes for enterprise-scale databases.

### File

- indexes_practice.sql


## SQL Skills Covered

- SELECT
- WHERE
- ORDER BY
- GROUP BY
- HAVING
- JOINs
- Aggregate Functions
- String Functions
- Date Functions
- Window Functions
- Subqueries
- Common Table Expressions (CTEs)
- Views
- Stored Procedures
- User Defined Functions (UDFs)
- Triggers
- Transactions
- Indexing
- Performance Tuning
- Dynamic SQL
- TRY...CATCH Error Handling
- Query Optimization


### Author
Prajnya Bhol
