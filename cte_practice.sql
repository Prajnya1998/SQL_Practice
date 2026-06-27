-- Project 9: Common Table Expressions (CTEs)

USE GlobalSuperstore;


-- CTE to Calculate Average Sales
WITH AverageSales AS
(
    SELECT AVG(Sales) AS Avg_Sales
    FROM [dbo].[Global_Superstore(CSV)]
)

SELECT
    Product_Name,
    Sales
FROM [dbo].[Global_Superstore(CSV)]
WHERE Sales > 
(
    SELECT Avg_Sales
    FROM AverageSales
);


-- Multiple CTEs Example
WITH AverageSales AS
(
    SELECT AVG(Sales) AS Avg_Sales
    FROM [dbo].[Global_Superstore(CSV)]
),
MaximumSales AS
(
    SELECT MAX(Sales) AS Max_Sales
    FROM [dbo].[Global_Superstore(CSV)]
)

SELECT
    G.Product_Name,
    G.Sales,
    A.Avg_Sales,
    M.Max_Sales
FROM [dbo].[Global_Superstore(CSV)] AS G
CROSS JOIN AverageSales AS A
CROSS JOIN MaximumSales AS M;


-- CTE with JOIN
WITH CategorySales AS
(
    SELECT
        Category,
        AVG(Sales) AS Average_Category_Sales
    FROM [dbo].[Global_Superstore(CSV)]
    GROUP BY Category
)

SELECT 
    G.Product_Name,
    G.Category,
    G.Sales,
    C.Average_Category_Sales
FROM [dbo].[Global_Superstore(CSV)] AS G
INNER JOIN CategorySales AS C
    ON G.Category = C.Category;


-- CTE with ROW_NUMBER()
WITH RankedProducts AS
(
    SELECT
        Product_Name,
        Category,
        Sales,
        ROW_NUMBER() OVER (ORDER BY Sales DESC) AS Row_Num
    FROM [dbo].[Global_Superstore(CSV)]
)

SELECT
    Product_Name,
    Category,
    Sales,
    Row_Num
FROM RankedProducts
WHERE Row_Num <= 5;


-- Recursive CTE Example
WITH Numbers AS
(
    -- Anchor Member
    SELECT 1 AS Number

    UNION ALL

    -- Recursive Member
    SELECT Number + 1
    FROM Numbers
    WHERE Number < 10
)

SELECT *
FROM Numbers;