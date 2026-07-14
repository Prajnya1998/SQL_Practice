USE GlobalSuperstore;
GO

-- ==================================================
-- Project 27 : SQL Performance Tuning
-- ==================================================

-- Objective:
-- Learn SQL Server Performance Tuning
-- techniques to improve query execution,
-- optimize indexes, and analyze execution plans.

GO

-- ==========================================
-- Step 1 : Introduction
-- ==========================================

-- SQL Performance Tuning means
-- improving query speed and reducing
-- resource usage.

-- Common Performance Topics

-- ✔ Indexes
-- ✔ Execution Plan
-- ✔ Statistics
-- ✔ Query Optimization
-- ✔ SET STATISTICS IO
-- ✔ SET STATISTICS TIME
-- ✔ SARGable Queries
-- ✔ Covering Indexes

GO


-- ==========================================
-- Step 2 : SET STATISTICS TIME
-- ==========================================

-- Business Requirement:
-- Measure query execution time.

SET STATISTICS TIME ON;

SELECT

    Order_ID,

    Customer_Name,

    Sales

FROM [dbo].[Global_Superstore(CSV)]

WHERE Region='East';

SET STATISTICS TIME OFF;

GO

-- ==========================================
-- Step 3 : SET STATISTICS IO
-- ==========================================

-- Business Requirement:
-- Measure logical reads.

SET STATISTICS IO ON;

SELECT

    *

FROM [dbo].[Global_Superstore(CSV)]

WHERE Category='Technology';

SET STATISTICS IO OFF;

GO


-- ==========================================
-- Step 4 : Clustered Index
-- ==========================================

-- Business Requirement:
-- Create a table and apply
-- a Clustered Index.

CREATE TABLE #CustomerSales
(
    Customer_ID INT,
    Customer_Name NVARCHAR(100),
    Region NVARCHAR(50),
    Sales FLOAT
);

CREATE CLUSTERED INDEX IX_Customer_ID

ON #CustomerSales(Customer_ID);

INSERT INTO #CustomerSales
VALUES

(101,'John Smith','East',450),

(102,'Alice Brown','West',800),

(103,'David Wilson','South',1200);

SELECT *

FROM #CustomerSales;

GO


-- ==========================================
-- Step 5 : Non-Clustered Index
-- ==========================================

-- Business Requirement:
-- Create a Non-Clustered Index
-- on Customer_Name to improve
-- search performance.

CREATE NONCLUSTERED INDEX IX_Customer_Name

ON #CustomerSales(Customer_Name);

-- Search using the indexed column

SELECT *

FROM #CustomerSales

WHERE Customer_Name = 'John Smith';

GO


-- ==========================================
-- Step 6 : Execution Plan
-- ==========================================

-- Business Requirement:
-- Analyze how SQL Server executes
-- a query using the Execution Plan.

SELECT

    Customer_Name,

    Region,

    Sales

FROM [dbo].[Global_Superstore(CSV)]

WHERE Customer_Name = 'John Smith';

GO


-- ==========================================
-- Step 7 : SARGable vs Non-SARGable Queries
-- ==========================================

-- Business Requirement:
-- Compare optimized and
-- non-optimized WHERE clauses.

-------------------------------------------------
-- Example 1 : SARGable Query
-------------------------------------------------

-- SQL Server can efficiently
-- use an index on Customer_Name.

SELECT

    Customer_Name,
    Sales

FROM [dbo].[Global_Superstore(CSV)]

WHERE Customer_Name = 'John Smith';

GO

-------------------------------------------------
-- Example 2 : Non-SARGable Query
-------------------------------------------------

-- Applying a function on the column
-- prevents SQL Server from efficiently
-- using the index.

SELECT

    Customer_Name,
    Sales

FROM [dbo].[Global_Superstore(CSV)]

WHERE UPPER(Customer_Name) = 'JOHN SMITH';

GO


-- ==========================================
-- Step 8 : Covering Index
-- ==========================================

-- Business Requirement:
-- Create a Covering Index to improve
-- query performance.

-- Create Non-Clustered Covering Index

CREATE NONCLUSTERED INDEX IX_CustomerName_Covering

ON #CustomerSales(Customer_Name)

INCLUDE
(
    Region,
    Sales
);

GO

-- Execute Query

SELECT

    Customer_Name,

    Region,

    Sales

FROM #CustomerSales

WHERE Customer_Name = 'John Smith';

GO


-- ==========================================
-- Step 9 : Real-Time Performance Tuning Project
-- ==========================================

-- Business Requirement:
-- The Sales Manager reports that the
-- Sales Dashboard is loading slowly.
-- Analyze and optimize the query.

-------------------------------------------------
-- Step 1 : Measure Performance
-------------------------------------------------

SET STATISTICS TIME ON;
SET STATISTICS IO ON;

SELECT

    Customer_Name,
    Region,
    Category,
    Sales

FROM [dbo].[Global_Superstore(CSV)]

WHERE Region = 'East'
AND Category = 'Technology';

SET STATISTICS TIME OFF;
SET STATISTICS IO OFF;

GO

-------------------------------------------------
-- Step 2 : Create Performance Index
-------------------------------------------------

CREATE NONCLUSTERED INDEX IX_Region_Category

ON [dbo].[Global_Superstore(CSV)]
(
    Region,
    Category
)

INCLUDE
(
    Customer_Name,
    Sales
);

GO

-------------------------------------------------
-- Step 3 : Execute the Query Again
-------------------------------------------------

SET STATISTICS TIME ON;
SET STATISTICS IO ON;

SELECT

    Customer_Name,
    Region,
    Category,
    Sales

FROM [dbo].[Global_Superstore(CSV)]

WHERE Region = 'East'
AND Category = 'Technology';

SET STATISTICS TIME OFF;
SET STATISTICS IO OFF;

GO