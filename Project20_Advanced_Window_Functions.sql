-- ==================================================
-- Project 20 : Advanced Window Functions
-- ==================================================

USE GlobalSuperstore;
GO

-- ==========================================
-- Step 1 : Introduction
-- ==========================================

-- Objective:
-- Learn Advanced Window Functions for
-- business reporting and analytics.

-- Functions Covered:
-- LAG()
-- LEAD()
-- FIRST_VALUE()
-- LAST_VALUE()
-- NTILE()
-- Running Total
-- Moving Average

GO

-- ==========================================
-- Step 2 : LAG()
-- Previous Sales
-- ==========================================
SELECT

    Order_Date,

    Sales,

    LAG(Sales)
    OVER
    (
        ORDER BY Order_Date
    ) AS Previous_Sales

FROM [dbo].[Global_Superstore(CSV)]

ORDER BY Order_Date;
GO

-- ==========================================
-- Step 3 : LEAD()
-- Next Sales
-- ==========================================
SELECT

    Order_Date,

    Sales,

    LEAD(Sales)
    OVER
    (
        ORDER BY Order_Date
    ) AS Next_Sales

FROM [dbo].[Global_Superstore(CSV)]

ORDER BY Order_Date;
GO

-- ==========================================
-- Step 4 : FIRST_VALUE()
-- Highest Sale in Each Category
-- ==========================================
SELECT

    Category,

    Product_Name,

    Sales,

    FIRST_VALUE(Sales)
    OVER
    (
        PARTITION BY Category
        ORDER BY Sales DESC
    ) AS Highest_Sale

FROM [dbo].[Global_Superstore(CSV)]

ORDER BY Category, Sales DESC;
GO


-- ==========================================
-- Step 5 : LAST_VALUE()
-- Incorrect Example
-- ==========================================
SELECT

    Category,

    Product_Name,

    Sales,

    LAST_VALUE(Sales)
    OVER
    (
        PARTITION BY Category
        ORDER BY Sales DESC
    ) AS Last_Sale

FROM [dbo].[Global_Superstore(CSV)]

ORDER BY Category, Sales DESC;
GO

-- ==========================================
-- Step 6 : NTILE()
-- Customer Segmentation
-- ==========================================

SELECT

    Customer_Name,

    Sales,

    NTILE(4)
    OVER
    (
        ORDER BY Sales DESC
    ) AS Sales_Quartile

FROM [dbo].[Global_Superstore(CSV)]

ORDER BY Sales DESC;
GO


-- ==========================================
-- Step 7 : Running Total
-- Cumulative Sales
-- ==========================================
SELECT

    Order_Date,

    Sales,

    SUM(Sales)
    OVER
    (
        ORDER BY Order_Date
    ) AS Running_Total

FROM [dbo].[Global_Superstore(CSV)]

ORDER BY Order_Date;
GO

-- ==========================================
-- Step 8 : Moving Average
-- 3 Order Rolling Average
-- ==========================================
SELECT

    Order_Date,

    Sales,

    AVG(Sales)
    OVER
    (
        ORDER BY Order_Date
        ROWS BETWEEN 2 PRECEDING
        AND CURRENT ROW
    ) AS Moving_Average

FROM [dbo].[Global_Superstore(CSV)]

ORDER BY Order_Date;
GO

-- ==========================================
-- Step 9 : Cumulative Percentage
-- Contribution to Total Sales
-- ==========================================
SELECT

    Product_Name,

    Sales,

    SUM(Sales)
    OVER
    (
        ORDER BY Sales DESC
    ) AS Running_Total,

    SUM(Sales)
    OVER
    () AS Grand_Total,

    ROUND
    (
        (
            SUM(Sales)
            OVER
            (
                ORDER BY Sales DESC
            )

            *100.0

            /

            SUM(Sales)
            OVER()
        ),
        2
    ) AS Cumulative_Percentage

FROM [dbo].[Global_Superstore(CSV)]

ORDER BY Sales DESC;
GO

-- ==========================================
-- Step 10 : Sales Performance Dashboard
-- ==========================================
WITH ProductSales AS
(
    SELECT

        Product_Name,

        SUM(Sales) AS Total_Sales

    FROM [dbo].[Global_Superstore(CSV)]

    GROUP BY Product_Name
)

SELECT

    Product_Name,

    Total_Sales,

    LAG(Total_Sales)
    OVER
    (
        ORDER BY Total_Sales DESC
    ) AS Previous_Sales,

    LEAD(Total_Sales)
    OVER
    (
        ORDER BY Total_Sales DESC
    ) AS Next_Sales,

    SUM(Total_Sales)
    OVER
    (
        ORDER BY Total_Sales DESC
    ) AS Running_Total,

    AVG(Total_Sales)
    OVER
    (
        ORDER BY Total_Sales DESC
        ROWS BETWEEN 2 PRECEDING
        AND CURRENT ROW
    ) AS Moving_Average,

    NTILE(4)
    OVER
    (
        ORDER BY Total_Sales DESC
    ) AS Sales_Quartile,

    ROUND
    (
        SUM(Total_Sales)
        OVER
        (
            ORDER BY Total_Sales DESC
        ) * 100.0

        /

        SUM(Total_Sales)
        OVER(),

        2

    ) AS Cumulative_Percentage

FROM ProductSales

ORDER BY Total_Sales DESC;
GO