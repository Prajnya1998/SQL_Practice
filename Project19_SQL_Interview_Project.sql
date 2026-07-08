-- ==================================================
-- Project 19 : SQL Interview Project
-- ==================================================
USE GlobalSuperstore;
GO

-- ==========================================
-- Step 1 : Project Introduction
-- ==========================================

-- Objective:
-- Solve real business problems using SQL Server.

-- Database:
-- GlobalSuperstore

-- Skills Used:
-- SELECT
-- GROUP BY
-- JOINS
-- CTE
-- Window Functions
-- Stored Procedures
-- Dynamic SQL
-- Transactions
-- TRY...CATCH
-- Performance Tuning

GO

-- ==========================================
-- Step 2 : Business Requirement
-- ==========================================

-- Business Goal:
-- Analyze Global Superstore Sales Data

-- Deliverables:
-- 1. Sales Analysis
-- 2. Customer Analysis
-- 3. Product Analysis
-- 4. Regional Analysis
-- 5. Order Analysis
-- 6. Business Recommendations

GO

SELECT *
FROM [dbo].[Global_Superstore(CSV)];
GO

SELECT COUNT(*) AS Total_Records
FROM [dbo].[Global_Superstore(CSV)];
GO


EXEC sp_help '[dbo].[Global_Superstore(CSV)]';
GO


SELECT
    SUM(CASE WHEN Sales IS NULL THEN 1 ELSE 0 END) AS Null_Sales,
    SUM(CASE WHEN Profit IS NULL THEN 1 ELSE 0 END) AS Null_Profit,
    SUM(CASE WHEN Customer_Name IS NULL THEN 1 ELSE 0 END) AS Null_Customers
FROM [dbo].[Global_Superstore(CSV)];
GO


SELECT DISTINCT Category
FROM [dbo].[Global_Superstore(CSV)];
GO


SELECT DISTINCT Region
FROM [dbo].[Global_Superstore(CSV)];
GO

-- ==========================================
-- Business Question 1
-- Total Sales
-- ==========================================
SELECT
    SUM(Sales) AS Total_Sales
FROM [dbo].[Global_Superstore(CSV)];
GO

-- ==========================================
-- Business Question 2
-- Total Profit
-- ==========================================
SELECT
    SUM(Profit) AS Total_Profit
FROM [dbo].[Global_Superstore(CSV)];
GO

-- ==========================================
-- Business Question 3
-- Total Orders
-- ==========================================
SELECT
    COUNT(DISTINCT Order_ID) AS Total_Orders
FROM [dbo].[Global_Superstore(CSV)];
GO

-- ==========================================
-- Business Question 4
-- Average Order Value
-- ==========================================
SELECT
    AVG(Sales) AS Average_Order_Value
FROM [dbo].[Global_Superstore(CSV)];
GO

-- ==========================================
-- Business Question 5
-- Top 10 Customers
-- ==========================================
SELECT TOP 10
    Customer_Name,
    SUM(Sales) AS Total_Sales
FROM [dbo].[Global_Superstore(CSV)]
GROUP BY Customer_Name
ORDER BY Total_Sales DESC;
GO

-- ==========================================
-- Business Question 6
-- Top 10 Products
-- ==========================================
SELECT TOP 10
    Product_Name,
    SUM(Sales) AS Total_Sales
FROM [dbo].[Global_Superstore(CSV)]
GROUP BY Product_Name
ORDER BY Total_Sales DESC;
GO

-- ==========================================
-- Business Question 7
-- Sales by Category
-- ==========================================
SELECT
    Category,
    SUM(Sales) AS Total_Sales
FROM [dbo].[Global_Superstore(CSV)]
GROUP BY Category
ORDER BY Total_Sales DESC;
GO

-- ==========================================
-- Business Question 8
-- Profit by Region
-- ==========================================
SELECT
    Region,
    SUM(Profit) AS Total_Profit
FROM [dbo].[Global_Superstore(CSV)]
GROUP BY Region
ORDER BY Total_Profit DESC;
GO

-- ==========================================
-- Business Question 9
-- Top Loss-Making Products
-- ==========================================
SELECT TOP 10
    Product_Name,
    SUM(Profit) AS Total_Profit
FROM [dbo].[Global_Superstore(CSV)]
GROUP BY Product_Name
ORDER BY Total_Profit ASC;
GO

-- ==========================================
-- Business Question 10
-- Sales by Year
-- ==========================================
SELECT
    YEAR(Order_Date) AS Sales_Year,
    SUM(Sales) AS Total_Sales
FROM [dbo].[Global_Superstore(CSV)]
GROUP BY YEAR(Order_Date)
ORDER BY Sales_Year;
GO

-- ==========================================
-- Complex Query 1
-- Rank Customers by Sales
-- ==========================================
SELECT
    Customer_Name,
    SUM(Sales) AS Total_Sales,
    RANK() OVER
    (
        ORDER BY SUM(Sales) DESC
    ) AS Customer_Rank
FROM [dbo].[Global_Superstore(CSV)]
GROUP BY Customer_Name;
GO

-- ==========================================
-- Business Question 2 
-- Top Selling Product in Each Category
-- ==========================================
WITH ProductSales AS
(
    SELECT
        Category,
        Product_Name,
        SUM(Sales) AS Total_Sales,

        ROW_NUMBER() OVER
        (
            PARTITION BY Category
            ORDER BY SUM(Sales) DESC
        ) AS RN

    FROM [dbo].[Global_Superstore(CSV)]

    GROUP BY
        Category,
        Product_Name
)

SELECT
    Category,
    Product_Name,
    Total_Sales

FROM ProductSales

WHERE RN = 1;
GO


-- ==========================================
-- Business Question 3
-- Sales Performance Classification
-- ==========================================
SELECT
    Product_Name,
    Sales,

    CASE

        WHEN Sales >= 1000 THEN 'High Sales'

        WHEN Sales >= 500 THEN 'Medium Sales'

        ELSE 'Low Sales'

    END AS Sales_Category

FROM [dbo].[Global_Superstore(CSV)];
GO

-- =======================================
-- Business Question 4
-- Running Total of Sales
-- =======================================
SELECT

    Order_Date,

    Sales,

    SUM(Sales)
    OVER
    (
        ORDER BY Order_Date
    ) AS Running_Total

FROM [dbo].[Global_Superstore(CSV)];
GO


-- ======================================
-- Business Question 5
-- Find Customers Above Average Sales
-- ======================================
WITH CustomerSales AS
(
    SELECT

        Customer_Name,

        SUM(Sales) AS Total_Sales

    FROM [dbo].[Global_Superstore(CSV)]

    GROUP BY Customer_Name
)

SELECT *

FROM CustomerSales

WHERE Total_Sales >
(
    SELECT AVG(Total_Sales)

    FROM CustomerSales
);
GO


-- =======================================
-- Business Question 6 
-- Top 5 Customers in Each Region
-- =======================================
WITH CustomerRegionSales AS
(
    SELECT

        Region,

        Customer_Name,

        SUM(Sales) AS Total_Sales,

        ROW_NUMBER() OVER
        (
            PARTITION BY Region
            ORDER BY SUM(Sales) DESC
        ) AS RN

    FROM [dbo].[Global_Superstore(CSV)]

    GROUP BY

        Region,

        Customer_Name
)

SELECT *

FROM CustomerRegionSales

WHERE RN <= 5;
GO


-- ==========================================
-- Step 6 : Stored Procedure
-- Sales Report by Category
-- ==========================================
IF OBJECT_ID('dbo.usp_SalesReportByCategory', 'P') IS NOT NULL
    DROP PROCEDURE dbo.usp_SalesReportByCategory;
GO

CREATE PROCEDURE dbo.usp_SalesReportByCategory
    @Category VARCHAR(50)
AS
BEGIN

    SET NOCOUNT ON;

    SELECT
        Order_ID,
        Customer_Name,
        Product_Name,
        Category,
        Region,
        Sales,
        Profit
    FROM [dbo].[Global_Superstore(CSV)]
    WHERE Category = @Category
    ORDER BY Sales DESC;

END;
GO


-- ==========================================
-- Step 7 : Dynamic SQL Stored Procedure
-- ==========================================
IF OBJECT_ID('dbo.usp_DynamicSalesReport','P') IS NOT NULL
    DROP PROCEDURE dbo.usp_DynamicSalesReport;
GO

CREATE PROCEDURE dbo.usp_DynamicSalesReport

    @Category VARCHAR(50)=NULL,
    @Region VARCHAR(50)=NULL,
    @MinSales DECIMAL(10,2)=NULL

AS
BEGIN

    SET NOCOUNT ON;

    DECLARE @SQL NVARCHAR(MAX);

    SET @SQL='

    SELECT

        Order_ID,
        Customer_Name,
        Product_Name,
        Category,
        Region,
        Sales,
        Profit

    FROM [dbo].[Global_Superstore(CSV)]

    WHERE 1=1';

    IF @Category IS NOT NULL
        SET @SQL=@SQL+' AND Category=@Category';

    IF @Region IS NOT NULL
        SET @SQL=@SQL+' AND Region=@Region';

    IF @MinSales IS NOT NULL
        SET @SQL=@SQL+' AND Sales>=@MinSales';

    PRINT @SQL;

    EXEC sp_executesql

        @SQL,

        N'@Category VARCHAR(50),
          @Region VARCHAR(50),
          @MinSales DECIMAL(10,2)',

        @Category=@Category,
        @Region=@Region,
        @MinSales=@MinSales;

END;
GO


-- ==========================================
-- Step 8 : Transaction & Error Handling
-- ==========================================
IF OBJECT_ID('dbo.usp_SecureSalesReport','P') IS NOT NULL
    DROP PROCEDURE dbo.usp_SecureSalesReport;
GO

CREATE PROCEDURE dbo.usp_SecureSalesReport

    @Category VARCHAR(50)=NULL,
    @Region VARCHAR(50)=NULL,
    @MinSales DECIMAL(10,2)=NULL

AS
BEGIN

    SET NOCOUNT ON;

    BEGIN TRY

        BEGIN TRANSACTION;

        DECLARE @SQL NVARCHAR(MAX);

        SET @SQL='
        SELECT
            Order_ID,
            Customer_Name,
            Product_Name,
            Category,
            Region,
            Sales,
            Profit
        FROM [dbo].[Global_Superstore(CSV)]
        WHERE 1=1';

        IF @Category IS NOT NULL
            SET @SQL=@SQL+' AND Category=@Category';

        IF @Region IS NOT NULL
            SET @SQL=@SQL+' AND Region=@Region';

        IF @MinSales IS NOT NULL
            SET @SQL=@SQL+' AND Sales>=@MinSales';

        EXEC sp_executesql

            @SQL,

            N'@Category VARCHAR(50),
              @Region VARCHAR(50),
              @MinSales DECIMAL(10,2)',

            @Category=@Category,
            @Region=@Region,
            @MinSales=@MinSales;

        COMMIT TRANSACTION;

    END TRY

    BEGIN CATCH

        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;

        SELECT

            ERROR_NUMBER() AS Error_Number,
            ERROR_MESSAGE() AS Error_Message,
            ERROR_LINE() AS Error_Line;

    END CATCH

END;
GO


-- ==========================================
-- Step 11 : Final Mini Project
-- ==========================================

IF OBJECT_ID('dbo.usp_FinalSalesDashboard','P') IS NOT NULL
    DROP PROCEDURE dbo.usp_FinalSalesDashboard;
GO

CREATE PROCEDURE dbo.usp_FinalSalesDashboard

    @Category VARCHAR(50)=NULL,
    @Region VARCHAR(50)=NULL,
    @MinSales DECIMAL(10,2)=NULL

AS
BEGIN

    SET NOCOUNT ON;

    BEGIN TRY

        DECLARE @SQL NVARCHAR(MAX);

        SET @SQL='
        SELECT

            Order_ID,
            Customer_Name,
            Product_Name,
            Category,
            Region,
            Sales,
            Profit

        FROM [dbo].[Global_Superstore(CSV)]

        WHERE 1=1';

        IF @Category IS NOT NULL
            SET @SQL=@SQL+' AND Category=@Category';

        IF @Region IS NOT NULL
            SET @SQL=@SQL+' AND Region=@Region';

        IF @MinSales IS NOT NULL
            SET @SQL=@SQL+' AND Sales>=@MinSales';

        SET @SQL=@SQL+' ORDER BY Sales DESC';

        EXEC sp_executesql

            @SQL,

            N'@Category VARCHAR(50),
              @Region VARCHAR(50),
              @MinSales DECIMAL(10,2)',

            @Category=@Category,
            @Region=@Region,
            @MinSales=@MinSales;

    END TRY

    BEGIN CATCH

        SELECT

            ERROR_NUMBER() AS Error_Number,

            ERROR_MESSAGE() AS Error_Message,

            ERROR_LINE() AS Error_Line;

    END CATCH

END;
GO

-- ==========================================================
-- Project 19 : SQL Interview Project
-- Status : COMPLETED
-- ==========================================================

-- Database
-- GlobalSuperstore

------------------------------------------------------------

-- Business Objective

-- Analyze Sales Performance
-- Analyze Customer Performance
-- Analyze Product Performance
-- Analyze Regional Performance

------------------------------------------------------------

-- SQL Concepts Used

-- SELECT
-- WHERE
-- GROUP BY
-- HAVING
-- ORDER BY
-- Aggregate Functions
-- CASE
-- CTE
-- Window Functions
-- Stored Procedures
-- Dynamic SQL
-- sp_executesql
-- Transactions
-- TRY...CATCH
-- Performance Tuning
-- Indexing

------------------------------------------------------------

-- Business Reports Created

-- Total Sales
-- Total Profit
-- Total Orders
-- Top Customers
-- Top Products
-- Sales by Category
-- Profit by Region
-- Loss Making Products
-- Sales by Year

------------------------------------------------------------

-- Advanced Components

-- Parameterized Stored Procedure
-- Dynamic Sales Report
-- Secure Sales Report
-- Final Sales Dashboard

------------------------------------------------------------

-- Performance Activities

-- Execution Plan
-- SET STATISTICS IO
-- SET STATISTICS TIME
-- Index Creation
-- SARGable Queries

------------------------------------------------------------

-- Project Outcome

-- Successfully built an interview-ready
-- SQL Server business reporting solution.

-- ==========================================================