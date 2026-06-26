# SQL Practice

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

### Author
Prajnya Bhol
