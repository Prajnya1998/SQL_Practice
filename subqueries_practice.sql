-- Project 8 Subqueries Practice

USE GlobalSuperstore;


-- Products  with Sales Above Average
SELECT
    Product_Name,
    Sales
FROM [dbo].[Global_Superstore(CSV)]
WHERE Sales >
(
    SELECT AVG(Sales)
    FROM [dbo].[Global_Superstore(CSV)]
);



-- Product(s) with Highest Sales
SELECT
    Product_Name,
    Sales
FROM [dbo].[Global_Superstore(CSV)]
WHERE Sales =
(
    SELECT MAX(Sales)
    FROM [dbo].[Global_Superstore(CSV)]
);


-- Customers Who Purchased technology Products
SELECT DISTINCT
    Customer_Name
FROM [dbo].[Global_Superstore(CSV)]
WHERE Customer_Name IN
(
    SELECT Customer_Name
    FROM [dbo].[Global_Superstore(CSV)]
    WHERE Category = 'Technology'
);


-- Customers with Technology Orders Using EXISTS
SELECT DISTINCT
   G1.Customer_Name
FROM [dbo].[Global_Superstore(CSV)] AS G1
WHERE EXISTS
(
    SELECT 1
    FROM [dbo].[Global_Superstore(CSV)] AS G2
    WHERE G2.Customer_Name = G1.Customer_Name
      AND G2.Category = 'Technology'
);


-- Products with Sales Greater Than ANy Furniture Product
SELECT
    Product_Name,
    Sales
FROM [dbo].[Global_Superstore(CSV)]
WHERE Sales > ANY
(
    SELECT Sales
    FROM [dbo].[Global_Superstore(CSV)]
    WHERE Category = 'Furniture'
);


-- Products with Sales Greater Than All Furniture Products
SELECT
    Product_Name,
    Sales
FROM [dbo].[Global_Superstore(CSV)]
WHERE Sales > ALL
(
    SELECT Sales
    FROM [dbo].[Global_Superstore(CSV)]
    WHERE Category = 'Furniture'
);


-- Products with Sales Above Their Category Average
SELECT
    G1.Product_Name,
    G1.Category,
    G1.Sales
FROM [dbo].[Global_Superstore(CSV)] AS G1
WHERE G1.Sales >
(
    SELECT AVG(G2.Sales)
    FROM [dbo].[Global_Superstore(CSV)] AS G2
    WHERE G2.Category = G1.Category
);