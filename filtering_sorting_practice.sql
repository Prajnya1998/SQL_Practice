-- Project 4: Filtering and Sorting Practice

USE GlobalSuperstore;

-- Sales Greater Than 1000
SELECT *
FROM [dbo].[Global_Superstore(CSV)]
WHERE Sales > 1000;


-- Technology Orders with Sales Greater Than 1000
SELECT *
FROM [dbo].[Global_Superstore(CSV)]
WHERE Category = 'Technology'
AND Sales > 1000;


-- Furniture OR Technology Orders
SELECT *
FROM [dbo].[Global_Superstore(CSV)]
WHERE Category = 'Furniture'
OR Category = 'Technology';


-- Sales Between 500 and 1000
SELECT *
FROM [dbo].[Global_Superstore(CSV)]
WHERE Sales BETWEEN 500 AND 1000;


-- Orders from Selected Categories
SELECT *
FROM [dbo].[Global_Superstore(CSV)]
WHERE Category IN ('Furniture', 'Technology');


-- Customers Starting with A
SELECT *
FROM [dbo].[Global_Superstore(CSV)]
WHERE Customer_Name LIKE 'A%';


-- Customers Ending with 
SELECT *
FROM [dbo].[Global_Superstore(CSV)]
WHERE Customer_Name LIKE '%n';


-- Customers Names Containing 'an'
SELECT *
FROM [dbo].[Global_Superstore(CSV)]
WHERE Customer_Name LIKE '%an%';


-- Distinct Categories
SELECT DISTINCT Category
FROM [dbo].[Global_Superstore(CSV)];


-- Top 10 Records
SELECT TOP 10 *
FROM [dbo].[Global_Superstore(CSV)];


-- Sales in Ascending Order
SELECT
    Order_ID,
    Sales
FROM [dbo].[Global_Superstore(CSV)]
ORDER BY Sales ASC;


-- Top Selling Orders
SELECT
    Order_ID,
    Sales
FROM [dbo].[Global_Superstore(CSV)]
ORDER BY Sales DESC;





