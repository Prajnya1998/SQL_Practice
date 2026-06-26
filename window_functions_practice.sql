-- Project 7: Window Fuctions Practice

USE GlobalSuperstore;

-- Assign Row Numbers Based on Highest Sales
SELECT
     Customer_Name,
     Sales,
     ROW_NUMBER() OVER (ORDER BY Sales DESC) AS Row_Number
FROM [dbo].[Global_Superstore(CSV)];


-- Show the Top 5 customers by Sales
SELECT *
FROM (
    SELECT
        Customer_Name,
        Sales,
        ROW_NUMBER() OVER (ORDER BY Sales DESC) AS Row_Mumber
    FROM [dbo].[Global_Superstore(CSV)]
) AS Ranked_Customers
WHERE Row_Mumber <= 5;


-- Rank Customers by Sales
SELECT
     Customer_Name,
     Sales,
     RANK() OVER (ORDER BY Sales DESC) AS Sales_Rank
FROM [dbo].[Global_Superstore(CSV)];


-- Dense Rank Customers by Sales
SELECT
    Customer_Name,
    Sales,
    DENSE_RANK() OVER (ORDER BY Sales DESC) AS Dense_Sales_Rank
FROM [dbo].[Global_Superstore(CSV)];


-- Divide Customers into 4 Sales Group (Quartiles)
SELECT
    Customer_Name,
    Sales,
    NTILE(4) OVER (ORDER BY Sales DESC) AS Sales_Quartile
FROM [dbo].[Global_Superstore(CSV)];


-- Provious Sales Value
SELECT
    Customer_Name,
    Sales,
    LAG(Sales) OVER (ORDER BY Sales DESC) AS Previous_Sales
FROM [dbo].[Global_Superstore(CSV)];


-- Next Sales Value
SELECT
    Customer_Name,
    Sales,
    LEAD(Sales) OVER (ORDER BY Sales DESC) AS Next_Sales
FROM [dbo].[Global_Superstore(CSV)];