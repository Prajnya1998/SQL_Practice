-- Project 3: Aggregate Functions Practice

USE GlobalSuperstore;

-- Total Sales

SELECT
    SUM(Sales) AS Total_Sales
FROM [dbo].[Global_Superstore(CSV)];


-- Average Sales

SELECT
    AVG(Sales) AS Average_Sales
FROM [dbo].[Global_Superstore(CSV)];


-- Minimum Sales

SELECT
    MIN(Sales) AS Min_Sales
FROM [dbo].[Global_Superstore(CSV)];


-- Maximum Sales

SELECT
    MAX(Sales) AS Max_Sales
FROM [dbo].[Global_Superstore(CSV)];


-- Count Total Sales

SELECT
    COUNT(Sales) AS Count_Total_Sales
FROM [dbo].[Global_Superstore(CSV)];


-- Total Sales by Category

SELECT 
    Category,
    SUM(Sales) AS Total_Sales
FROM [dbo].[Global_Superstore(CSV)]
GROUP BY Category;


-- Categories with Sales Greater Than 500000

SELECT
    Category,
    SUM(Sales) AS Total_Sales
FROM [dbo].[Global_Superstore(CSV)]
GROUP BY Category
HAVING SUM(Sales) > 500000;