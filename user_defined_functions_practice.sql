-- Project 12: User Defined Functions (UDFs) Practice

USE GlobalSuperstore;
GO


-- Create Scalar Function
CREATE FUNCTION CalculateDiscount
(
    @Sales DECIMAL(10,2)
)

RETURNS DECIMAL(10,2)

AS
BEGIN

    RETURN @Sales * 0.10;

END;
GO


-- Execute Scalar Function
SELECT dbo.CalculateDiscount(1000) AS Discount;
GO


SELECT dbo.CalculateDiscount(2500) AS Discount;
GO


SELECT
    Product_Name,
    Sales,
    dbo.CalculateDiscount(Sales) AS Discount
FROM [dbo].[Global_Superstore(CSV)];
GO



-- Create Table-Valued Function
CREATE FUNCTION GetTechnologyProducts()

RETURNS TABLE

AS

RETURN
(
    SELECT
        Product_Name,
        Category,
        Sales,
        Profit

    FROM [dbo].[Global_Superstore(CSV)]

    WHERE Category = 'Technology'
);
GO


SELECT *
FROM dbo.GetTechnologyProducts();
GO


-- Alter Function
ALTER FUNCTION CalculateDiscount
(
    @Sales DECIMAL(10,2)
)

RETURNS DECIMAL(10,2)

AS
BEGIN

    RETURN @Sales * 0.15;

END;
GO


-- drop Scalar Function
DROP FUNCTION CalculateDiscount;
GO