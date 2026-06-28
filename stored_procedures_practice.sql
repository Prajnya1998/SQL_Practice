-- Project 11: Stored Procedures Practice

USE GlobalSuperstore;
GO

-- Drop Stored Procedure
DROP PROCEDURE GetTechnologyProducts;
GO


-- Create Stored Procedure
CREATE PROCEDURE GetTechnologyProducts
AS
BEGIN
    SELECT
        Product_Name,
        Sales,
        Profit
    FROM [dbo].[Global_Superstore(CSV)]
    WHERE Category = 'Technology';
END;
GO


-- Execute Stored Procedure 
EXEC GetTechnologyProducts;
GO


-- Alter Stored Procedure
ALTER PROCEDURE GetTechnologyProducts
AS
BEGIN
    SELECT
        Product_Name,
        Category,
        Sales,
        Profit
    FROM [dbo].[Global_Superstore(CSV)]
    WHERE Category = 'Technology';
END;
GO


-- Stored Procedure with One Parameter
CREATE OR ALTER PROCEDURE GetProductsByCategory

    @Category VARCHAR(50)

AS
BEGIN

    SELECT
        Product_Name,
        Category,
        Sales,
        Profit

    FROM [dbo].[Global_Superstore(CSV)]

    WHERE Category = @Category;

END;
GO


-- Stored Procedure with Multiple Parameters
CREATE OR ALTER PROCEDURE GetProductsByCategoryAndSales
   
    @Category VARCHAR(50),
    @MinimumSales DECIMAL(10,2)

AS
BEGIN

    SELECT
        Product_Name,
        Category,
        Sales,
        Profit

    FROM [dbo].[Global_Superstore(CSV)]

    WHERE Category = @Category
       AND Sales >= @MinimumSales;

END;
GO


-- Create or ALter Stored Procedure
CREATE OR ALTER PROCEDURE GetProductsByCategory

    @Category VARCHAR(50),
    @MinimumSales DECIMAL(10,2)

AS
BEGIN

    SELECT
        Product_Name,
        Category,
        Sales,
        Profit

    FROM [dbo].[Global_Superstore(CSV)]

    WHERE Category = @Category
       AND Sales >= @MinimumSales

END;
Go


-- Stored Procedure with TRY...CATCH
CREATE OR ALTER PROCEDURE GetProductsByCategory
    
    @Category VARCHAR(50),
    @MinimumSales DECIMAL(10,2)

AS
BEGIN

    BEGIN TRY

        SELECT
            Product_Name,
            Category,
            Sales,
            Profit
        FROM [dbo].[Global_Superstore(CSV)]

        WHERE Category = @Category
           AND Sales >= @MinimumSales;

    END TRY

    BEGIN CATCH
     
       SELECT
           ERROR_NUMBER() AS Error_Number,
           ERROR_NUMBER() AS Error_Message,
           ERROR_LINE() Error_Line;

    END CATCH

END;
GO


-- real Business Scenario
SELECT
    Product_Name,
    Category,
    Sales,
    Profit
FROM [dbo].[Global_Superstore(CSV)]
WHERE Category = 'Technology'
AND Sales >= 1000;