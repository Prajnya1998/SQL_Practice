-- Project 10: SQL Views Practice

USE GlobalSuperstore;


-- Create Sales Summary View
CREATE VIEW SalesSummary AS
SELECT
    Product_Name,
    Category,
    Sales,
    Profit
FROM [dbo].[Global_Superstore(CSV)];


-- Modify SalesSummary View
ALTER VIEW SalesSummary AS
SELECT
   Product_Name,
   Category,
   Sales,
   Profit,
   Quantity
FROM [dbo].[Global_Superstore(CSV)];


-- Delete SalesSummary View
DROP VIEW SalesSummary;


