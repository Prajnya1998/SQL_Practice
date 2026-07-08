-- ============================================
-- Project 17 : Dyanamic SQL
-- ============================================


USE GlobalSuperstore;
GO


SELECT *
FROM [dbo].[Global_Superstore(CSV)]
WHERE Category = 'Technology';


-- ==========================================
-- Step 2 : What is Dynamic SQL?
-- ==========================================

-- Static SQL
-- Query is fixed.

-- Dynamic SQL
-- Query is generated and executed at runtime.

-- Dynamic SQL is useful for:
-- 1. Dynamic Reports
-- 2. Search Screens
-- 3. Optional Filters
-- 4. Stored Procedures
-- 5. Administrative Scripts
GO


-- ==========================================
-- Step 3 : EXEC() Method
-- ==========================================

DECLARE @SQL NVARCHAR(MAX);

SET @SQL =
'
SELECT
    Product_Name,
    Category,
    Sales
FROM [dbo].[Global_Superstore(CSV)]
WHERE Category = ''Technology'';
';

EXEC(@SQL);
GO

-- ==========================================
-- Step 4 : sp_executesql
-- ==========================================

DECLARE @SQL NVARCHAR(MAX);

SET @SQL =
'
SELECT
    Product_Name,
    Category,
    Sales
FROM [dbo].[Global_Superstore(CSV)]
WHERE Category = ''Technology'';
';

EXEC sp_executesql @SQL;
GO


-- ==========================================
-- Step 5 : Parameters in Dynamic SQL
-- ==========================================

DECLARE @SQL NVARCHAR(MAX);
DECLARE @Category VARCHAR(50);

SET @Category = 'Technology';

SET @SQL =
'
SELECT
    Product_Name,
    Category,
    Sales
FROM [dbo].[Global_Superstore(CSV)]
WHERE Category = @Category;
';

EXEC sp_executesql
    @SQL,
    N'@Category VARCHAR(50)',
    @Category = @Category;
GO


-- ==========================================
-- Step 6 : Dynamic WHERE Clause
-- ==========================================

DECLARE @SQL NVARCHAR(MAX);
DECLARE @Category VARCHAR(50);

SET @Category = 'Technology';

SET @SQL = '
SELECT
    Product_Name,
    Category,
    Region,
    Sales
FROM [dbo].[Global_Superstore(CSV)]
WHERE 1 = 1';

IF @Category IS NOT NULL
BEGIN
    SET @SQL = @SQL + '
    AND Category = @Category';
END;

EXEC sp_executesql
    @SQL,
    N'@Category VARCHAR(50)',
    @Category = @Category;
GO

-- ==========================================
-- Step 7 : Real Business Scenario
-- ==========================================

DECLARE @SQL NVARCHAR(MAX);

DECLARE @Category VARCHAR(50) = 'Technology';
DECLARE @Region VARCHAR(50) = 'East';
DECLARE @MinSales DECIMAL(10,2) = 500;

SET @SQL = '
SELECT
    Product_Name,
    Category,
    Region,
    Sales
FROM [dbo].[Global_Superstore(CSV)]
WHERE 1=1';

IF @Category IS NOT NULL
BEGIN
    SET @SQL += '
    AND Category = @Category';
END;

IF @Region IS NOT NULL
BEGIN
    SET @SQL += '
    AND Region = @Region';
END;

IF @MinSales IS NOT NULL
BEGIN
    SET @SQL += '
    AND Sales >= @MinSales';
END;

EXEC sp_executesql
    @SQL,
    N'@Category VARCHAR(50),
      @Region VARCHAR(50),
      @MinSales DECIMAL(10,2)',
    @Category=@Category,
    @Region=@Region,
    @MinSales=@MinSales;
GO


-- ==========================================
-- Step 8 : SQL Injection & Prevention
-- ==========================================

-- SQL Injection occurs when user input
-- is treated as SQL code.

-- Prevention:
-- 1. Use sp_executesql
-- 2. Use Parameters
-- 3. Validate User Input
-- 4. Avoid String Concatenation

GO


-- ==========================================
-- Step 9 : Best Practices & Common Mistakes
-- ==========================================

-- =========================
-- Best Practices
-- =========================

-- 1. Use sp_executesql instead of EXEC() whenever possible.

-- 2. Always use parameters for user input.

-- 3. Build Dynamic SQL only when it is really needed.

-- 4. Keep the SQL statement readable and well formatted.

-- 5. Test Dynamic SQL with different parameter values.

-- 6. Use PRINT @SQL while debugging Dynamic SQL.

-- 7. Validate user input before executing Dynamic SQL.

-------------------------------------------------------

-- =========================
-- Common Mistakes
-- =========================

-- ❌ Using EXEC() with string concatenation.

-- ❌ Hardcoding values inside Dynamic SQL.

-- ❌ Ignoring SQL Injection risks.

-- ❌ Creating very large unreadable SQL strings.

-- ❌ Forgetting to use parameters.

-- ❌ Not testing different scenarios.

GO


-- ==========================================
-- Step 11 : Mini Project
-- Dynamic Sales Report
-- ==========================================

DECLARE @SQL NVARCHAR(MAX);

DECLARE @Category VARCHAR(50) = 'Technology';
DECLARE @Region VARCHAR(50) = 'East';
DECLARE @MinSales DECIMAL(10,2) = 1000;

SET @SQL = '
SELECT
    Product_Name,
    Category,
    Region,
    Customer_Name,
    Sales,
    Profit
FROM [dbo].[Global_Superstore(CSV)]
WHERE 1 = 1';

IF @Category IS NOT NULL
BEGIN
    SET @SQL += '
    AND Category = @Category';
END;

IF @Region IS NOT NULL
BEGIN
    SET @SQL += '
    AND Region = @Region';
END;

IF @MinSales IS NOT NULL
BEGIN
    SET @SQL += '
    AND Sales >= @MinSales';
END;

PRINT @SQL;

EXEC sp_executesql
    @SQL,
    N'@Category VARCHAR(50),
      @Region VARCHAR(50),
      @MinSales DECIMAL(10,2)',
    @Category=@Category,
    @Region=@Region,
    @MinSales=@MinSales;
GO


-- ==========================================================
-- Project 17 : Dynamic SQL
-- Status : COMPLETED
-- ==========================================================

-- Topics Covered

-- 1. Introduction to Dynamic SQL
-- 2. EXEC()
-- 3. sp_executesql
-- 4. Parameters
-- 5. Dynamic WHERE Clause
-- 6. Real Business Scenario
-- 7. SQL Injection
-- 8. Best Practices
-- 9. Interview Questions
-- 10. Mini Project

------------------------------------------------------------

-- Skills Learned

-- Dynamic SQL
-- EXEC()
-- sp_executesql
-- Parameters
-- Dynamic WHERE Clause
-- SQL Injection Prevention
-- PRINT @SQL
-- Debugging Dynamic SQL

------------------------------------------------------------

-- Real Project

-- Dynamic Sales Report
-- Filter by:
-- Category
-- Region
-- Minimum Sales

------------------------------------------------------------

-- Result

-- Successfully built a parameterized Dynamic SQL Report
-- using sp_executesql.

-- ==========================================================