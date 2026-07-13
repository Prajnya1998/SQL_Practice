USE GlobalSuperstore;
GO

-- ==================================================
-- Project 25 : MERGE Statement
-- ==================================================

-- Objective:
-- Learn how to use the MERGE statement
-- to INSERT, UPDATE and DELETE records
-- in a single SQL statement.

GO


-- ==========================================
-- Step 1 : Introduction
-- ==========================================

-- MERGE combines
-- INSERT
-- UPDATE
-- DELETE
-- into a single statement.

-- It is commonly used in:
-- ✔ ETL
-- ✔ Data Warehouse
-- ✔ Incremental Data Load
-- ✔ Data Synchronization

GO


-- ==========================================
-- Step 2 : Create Source Table
-- ==========================================

-- Business Requirement:
-- Create a source table
-- containing latest sales data.

CREATE TABLE #SourceSales
(
    Order_ID NVARCHAR(50),
    Customer_Name NVARCHAR(255),
    Sales FLOAT
);

INSERT INTO #SourceSales
VALUES

('CA-2012-124891','John Smith',450),

('CA-2012-124892','Alice Brown',800),

('CA-2012-124893','David Wilson',1200);

GO


-- ==========================================
-- Step 3 : Create Target Table
-- ==========================================

-- Business Requirement:
-- Create an existing target table.

CREATE TABLE #TargetSales
(
    Order_ID NVARCHAR(50),
    Customer_Name NVARCHAR(255),
    Sales FLOAT
);

INSERT INTO #TargetSales
VALUES

('CA-2012-124891','John Smith',400),

('CA-2012-124894','Emma Davis',900);

GO


-- ==========================================
-- Step 4 : Display Data
-- ==========================================

PRINT 'Source Table';

SELECT *
FROM #SourceSales;

PRINT 'Target Table';

SELECT *
FROM #TargetSales;

GO


-- ==========================================
-- Step 5 : MERGE Statement
-- ==========================================

-- Business Requirement:
-- Synchronize Source Table
-- with Target Table.

MERGE #TargetSales AS Target

USING #SourceSales AS Source

ON Target.Order_ID = Source.Order_ID

WHEN MATCHED THEN

UPDATE SET

    Target.Customer_Name = Source.Customer_Name,

    Target.Sales = Source.Sales

WHEN NOT MATCHED BY TARGET THEN

INSERT
(
    Order_ID,
    Customer_Name,
    Sales
)

VALUES
(
    Source.Order_ID,
    Source.Customer_Name,
    Source.Sales
);

GO


-- ==========================================
-- Step 6 : WHEN MATCHED
-- ==========================================

-- Business Requirement:
-- Update existing records
-- when matching Order_ID is found.

MERGE #TargetSales AS Target

USING #SourceSales AS Source

ON Target.Order_ID = Source.Order_ID

WHEN MATCHED THEN

UPDATE SET

    Target.Customer_Name = Source.Customer_Name,

    Target.Sales = Source.Sales;

GO


-- ==========================================
-- Step 7 : WHEN NOT MATCHED BY TARGET
-- ==========================================

-- Business Requirement:
-- Insert new records into
-- Target Table.

MERGE #TargetSales AS Target

USING #SourceSales AS Source

ON Target.Order_ID = Source.Order_ID

WHEN NOT MATCHED BY TARGET THEN

INSERT
(
    Order_ID,
    Customer_Name,
    Sales
)

VALUES
(
    Source.Order_ID,
    Source.Customer_Name,
    Source.Sales
);

GO


-- ==========================================
-- Step 8 : WHEN NOT MATCHED BY SOURCE
-- ==========================================

-- Business Requirement:
-- Delete records that no longer
-- exist in Source Table.

MERGE #TargetSales AS Target

USING #SourceSales AS Source

ON Target.Order_ID = Source.Order_ID

WHEN NOT MATCHED BY SOURCE THEN

DELETE;

GO

-- ==========================================
-- Step 9 : Real-Time ETL Project
-- ==========================================

-- Business Requirement:
-- Synchronize Daily Sales Data
-- with Master Sales Table.

MERGE #TargetSales AS Target

USING #SourceSales AS Source

ON Target.Order_ID = Source.Order_ID

WHEN MATCHED THEN

UPDATE SET

    Target.Customer_Name = Source.Customer_Name,

    Target.Sales = Source.Sales

WHEN NOT MATCHED BY TARGET THEN

INSERT
(
    Order_ID,
    Customer_Name,
    Sales
)

VALUES
(
    Source.Order_ID,
    Source.Customer_Name,
    Source.Sales
)

WHEN NOT MATCHED BY SOURCE THEN

DELETE;

GO

SELECT *

FROM #TargetSales;

GO