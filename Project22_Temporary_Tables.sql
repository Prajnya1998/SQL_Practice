USE GlobalSuperstore;
GO

-- ==================================================
-- Project 22 : Temporary Tables & Table Variables
-- ==================================================

-- Objective:
-- Learn how to use Temporary Tables and Table Variables
-- for storing intermediate data during SQL execution.

GO

-- ==========================================
-- Step 1 : Introduction
-- ==========================================

-- Temporary Tables:
-- Stored in tempdb and exist temporarily.
-- Used to store intermediate query results.

-- Types:
-- 1. Local Temporary Table (#TempTable)
-- 2. Global Temporary Table (##TempTable)
-- 3. Table Variable (@TableVariable)

GO

-- ==========================================
-- Step 2 : Local Temporary Table
-- ==========================================

-- Business Requirement:
-- Store East Region Orders
-- in a temporary table.

SELECT

    Order_ID,
    Product_Name,
    Region,
    Sales

INTO #EastRegionOrders

FROM [dbo].[Global_Superstore(CSV)]

WHERE Region = 'East';

-- Display Data

SELECT *
FROM #EastRegionOrders;

GO

-- ==========================================
-- Step 3 : Global Temporary Table
-- ==========================================

-- Business Requirement:
-- Store Technology Products
-- in a Global Temporary Table.

SELECT

    Order_ID,
    Product_Name,
    Category,
    Sales

INTO ##TechnologyProducts

FROM [dbo].[Global_Superstore(CSV)]

WHERE Category = 'Technology';

-- Display Data

SELECT *
FROM ##TechnologyProducts;

GO

-- ==========================================
-- Step 4 : Table Variable
-- ==========================================

-- Business Requirement:
-- Store Office Supplies Orders
-- using a Table Variable.

DECLARE @OfficeSupplies TABLE
(
    Order_ID NVARCHAR(50),
    Product_Name NVARCHAR(255),
    Category NVARCHAR(100),
    Sales FLOAT
);

INSERT INTO @OfficeSupplies
(
    Order_ID,
    Product_Name,
    Category,
    Sales
)

SELECT

    Order_ID,
    Product_Name,
    Category,
    Sales

FROM [dbo].[Global_Superstore(CSV)]

WHERE Category = 'Office Supplies';

-- Display Data

SELECT *
FROM @OfficeSupplies;

GO

-- ==========================================
-- Step 5 : Temporary Table vs Table Variable
-- ==========================================

-- Business Requirement:
-- Understand the difference between
-- Temporary Tables and Table Variables.

-- ==========================================
-- Temporary Table Example
-- ==========================================

SELECT

    Order_ID,
    Product_Name,
    Sales

INTO #TopSales

FROM [dbo].[Global_Superstore(CSV)]

WHERE Sales > 1000;

SELECT *
FROM #TopSales;

GO

-- ==========================================
-- Table Variable Example
-- ==========================================

DECLARE @TopSales TABLE
(
    Order_ID NVARCHAR(50),
    Product_Name NVARCHAR(255),
    Sales FLOAT
);

INSERT INTO @TopSales

SELECT

    Order_ID,
    Product_Name,
    Sales

FROM [dbo].[Global_Superstore(CSV)]

WHERE Sales > 1000;

SELECT *
FROM @TopSales;

GO

-- ==========================================
-- Step 6 : Real-Time Business Project
-- Temporary Sales Report
-- ==========================================

-- Business Requirement:
-- The Sales Manager wants to analyze
-- high-value orders from the East Region.
-- Store the data in a Temporary Table
-- and generate a summary report.

-- Create Temporary Table

SELECT

    Order_ID,
    Order_Date,
    Customer_Name,
    Product_Name,
    Category,
    Region,
    Sales,
    Profit

INTO #EastSalesReport

FROM [dbo].[Global_Superstore(CSV)]

WHERE Region = 'East'
AND Sales > 1000;

-- Display Report

SELECT *

FROM #EastSalesReport

ORDER BY Sales DESC;

-- Summary Report

SELECT

    COUNT(*) AS Total_Orders,

    SUM(Sales) AS Total_Sales,

    AVG(Sales) AS Average_Sales,

    MAX(Sales) AS Highest_Sale,

    MIN(Sales) AS Lowest_Sale

FROM #EastSalesReport;

GO
