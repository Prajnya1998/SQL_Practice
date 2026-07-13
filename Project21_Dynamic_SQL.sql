USE GlobalSuperstore;
GO

-- ==================================================
-- Project 21 : Dynamic SQL
-- ==================================================
-- Objective:
-- Learn how to create and execute Dynamic SQL
-- using EXEC() and sp_executesql() for
-- flexible and reusable SQL queries.

GO

-- ==========================================
-- Step 1 : Introduction
-- Static SQL vs Dynamic SQL
-- ==========================================
-- Static SQL
SELECT
    Order_ID,
    Product_Name,
    Sales
FROM [dbo].[Global_Superstore(CSV)];
GO


-- ==========================================
-- Step 2 : EXEC()
-- Execute Dynamic SQL
-- ==========================================
DECLARE @SQL NVARCHAR(MAX);

SET @SQL = '
SELECT
    Order_ID,
    Product_Name,
    Sales
FROM [dbo].[Global_Superstore(CSV)];
';

EXEC(@SQL);
GO


-- ==========================================
-- Step 3 : sp_executesql()
-- Parameterized Dynamic SQL
-- ==========================================
DECLARE @SQL NVARCHAR(MAX);

SET @SQL = '
SELECT
    Order_ID,
    Product_Name,
    Region,
    Sales
FROM [dbo].[Global_Superstore(CSV)]
WHERE Region = @Region;
';

EXEC sp_executesql
    @SQL,
    N'@Region NVARCHAR(50)',
    @Region = 'East';
GO


-- ==========================================
-- Step 4 : Dynamic WHERE Clause
-- Optional Search Filter
-- ==========================================
DECLARE @Region NVARCHAR(50);

SET @Region = 'West';

DECLARE @SQL NVARCHAR(MAX);

SET @SQL = '
SELECT
    Order_ID,
    Product_Name,
    Region,
    Category,
    Sales
FROM [dbo].[Global_Superstore(CSV)]
WHERE Region = @Region;
';

EXEC sp_executesql
    @SQL,
    N'@Region NVARCHAR(50)',
    @Region = @Region;
GO

-- ==========================================
-- Step 5 : Dynamic ORDER BY
-- ==========================================
-- Business Requirement:
-- Allow users to sort reports dynamically.

DECLARE @SortColumn NVARCHAR(50);
DECLARE @SQL NVARCHAR(MAX);

SET @SortColumn = 'Sales';

SET @SQL = '
SELECT
    Product_Name,
    Sales,
    Profit
FROM [dbo].[Global_Superstore(CSV)]
ORDER BY ' + QUOTENAME(@SortColumn) + ' DESC;
';

EXEC(@SQL);
GO

-- ==========================================
-- Step 6 : Dynamic Table Name
-- Select Data from Different Tables
-- ==========================================
-- Business Requirement:
-- Allow users to retrieve data dynamically
-- from different tables.

DECLARE @TableName NVARCHAR(128);
DECLARE @SQL NVARCHAR(MAX);

SET @TableName = 'Global_Superstore(CSV)';

SET @SQL = '
SELECT TOP (10)
    *
FROM ' + QUOTENAME('dbo') + '.' + QUOTENAME(@TableName) + ';
';

EXEC(@SQL);
GO

-- ==========================================
-- Step 7 : Dynamic PIVOT
-- Generate Dynamic Sales Report
-- ==========================================

-- Business Requirement:
-- Display Total Sales by Category.
-- Instead of hardcoding column names,
-- generate them dynamically.

DECLARE @Columns NVARCHAR(MAX);
DECLARE @SQL NVARCHAR(MAX);

-- Generate Dynamic Column List
SELECT @Columns =
STRING_AGG(QUOTENAME(Category), ',')
FROM
(
    SELECT DISTINCT Category
    FROM [dbo].[Global_Superstore(CSV)]
) AS CategoryList;

-- Build Dynamic Pivot Query
SET @SQL = '
SELECT *
FROM
(
    SELECT
        Region,
        Category,
        Sales
    FROM [dbo].[Global_Superstore(CSV)]
) AS SourceTable

PIVOT
(
    SUM(Sales)
    FOR Category IN (' + @Columns + ')
) AS PivotTable

ORDER BY Region;
';

EXEC(@SQL);
GO


-- ==========================================
-- Step 8 : SQL Injection & Prevention
-- ==========================================

-- Business Requirement:
-- Learn how SQL Injection occurs and
-- how to prevent it using parameterized queries.

-------------------------------------------------
-- Example 1 : Unsafe Dynamic SQL
-------------------------------------------------
DECLARE @Region NVARCHAR(100);
DECLARE @SQL NVARCHAR(MAX);

SET @Region = 'East';

SET @SQL = '
SELECT
    Order_ID,
    Product_Name,
    Region,
    Sales
FROM [dbo].[Global_Superstore(CSV)]
WHERE Region = ''' + @Region + ''';';

PRINT @SQL;
EXEC(@SQL);
GO

-------------------------------------------------
-- Example 2 : Safe Dynamic SQL
-------------------------------------------------
DECLARE @Region NVARCHAR(50);
DECLARE @SQL NVARCHAR(MAX);

SET @Region = 'East';

SET @SQL = '
SELECT
    Order_ID,
    Product_Name,
    Region,
    Sales
FROM [dbo].[Global_Superstore(CSV)]
WHERE Region = @Region;
';

EXEC sp_executesql

    @SQL,

    N'@Region NVARCHAR(50)',

    @Region = @Region;
GO


-- ==========================================
-- Step 9 : Real-Time Business Project
-- Dynamic Sales Report
-- ==========================================

-- Business Requirement:
-- The Sales Manager wants a report where users can:
-- 1. Filter data by Region
-- 2. Sort results by a selected column
-- 3. View only required columns

DECLARE @Region NVARCHAR(50);
DECLARE @SortColumn NVARCHAR(50);
DECLARE @SQL NVARCHAR(MAX);

SET @Region = 'East';
SET @SortColumn = 'Sales';

SET @SQL = '
SELECT
    Order_ID,
    Order_Date,
    Product_Name,
    Category,
    Region,
    Sales,
    Profit
FROM [dbo].[Global_Superstore(CSV)]
WHERE Region = @Region
ORDER BY ' + QUOTENAME(@SortColumn) + ' DESC;
';

EXEC sp_executesql

    @SQL,

    N'@Region NVARCHAR(50)',

    @Region = @Region;
GO

-- ==========================================
-- Step 11 : Final Assignment
-- ==========================================

-- Business Requirement:
-- Complete the following tasks using
-- Dynamic SQL concepts learned in this project.

-------------------------------------------------
-- Task 1
-------------------------------------------------

-- Display all orders from the East Region
-- using sp_executesql().

-------------------------------------------------
-- Task 2
-------------------------------------------------

-- Display all Furniture products
-- using a parameterized query.

-------------------------------------------------
-- Task 3
-------------------------------------------------

-- Display all products where
-- Sales > 1000.

-------------------------------------------------
-- Task 4
-------------------------------------------------

-- Display all orders from
-- West Region
-- sorted by Profit.

-------------------------------------------------
-- Task 5
-------------------------------------------------

-- Create a Dynamic ORDER BY query
-- where users can sort by:
-- Sales
-- Profit
-- Order_Date

-------------------------------------------------
-- Task 6
-------------------------------------------------

-- Create a Dynamic Table Name query
-- to display TOP 10 records.

-------------------------------------------------
-- Task 7
-------------------------------------------------

-- Create a Dynamic Pivot Report
-- showing Sales by Category.

-------------------------------------------------
-- Task 8
-------------------------------------------------

-- Create a Dynamic Report where users can:
-- Select Region
-- Select Sort Column
-- View Sales Report

-------------------------------------------------
-- Task 9 (Interview Level)
-------------------------------------------------

-- Explain why sp_executesql()
-- is preferred over EXEC().

-------------------------------------------------
-- Task 10 (Interview Level)
-------------------------------------------------

-- Explain how SQL Injection
-- can be prevented.

GO