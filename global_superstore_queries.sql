USE GlobalSuperstore;

SELECT TOP 10 *
FROM [dbo].[Global_Superstore(CSV)];
-- Total Sales
SELECT
   SUM(Sales) AS Total_Sales
FROM [dbo].[Global_Superstore(CSV)];
-- Total Profit
SELECT
    SUM(Profit) AS Total_Profit
FROM [dbo].[Global_Superstore(CSV)];
-- Total Orders
SELECT
    COUNT(*) AS Total_Orders
FROM [dbo].[Global_Superstore(CSV)];

SELECT
    Category,
    SUM(Sales) AS Total_Sales
FROM [dbo].[Global_Superstore(CSV)]
GROUP BY Category;

SELECT
    Category,
	SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit
FROM [dbo].[Global_Superstore(CSV)]
GROUP BY Category;

SELECT TOP 10
     [Product_Name],
	 SUM(Sales) AS Total_Sales
FROM [dbo].[Global_Superstore(CSV)]
GROUP BY [Product_Name]
ORDER BY Total_Sales DESC;
