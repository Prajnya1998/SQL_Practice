-- ==================================================
-- Project 18 : Error Handling & Logging
-- ==================================================

USE GlobalSuperstore;
GO

IF OBJECT_ID('dbo.ErrorLog', 'U') IS NOT NULL
    DROP TABLE dbo.ErrorLog;
GO

CREATE TABLE dbo.ErrorLog
(
    LogID INT IDENTITY(1,1) PRIMARY KEY,
    ErrorNumber INT,
    ErrorMessage NVARCHAR(4000),
    ErrorLine INT,
    ErrorDate DATETIME DEFAULT GETDATE()
);
GO

-- ==========================================
-- Step 1 : Introduction
-- ==========================================

-- Error Handling is used to:
-- 1. Detect errors
-- 2. Handle errors gracefully
-- 3. Prevent application crashes
-- 4. Protect data integrity
-- 5. Log errors for troubleshooting

GO


-- ==========================================
-- Step 2 : TRY...CATCH
-- ==========================================

BEGIN TRY

    PRINT 'TRY Block Started';

    -- Intentional Error
    SELECT 10 / 0 AS Result;

    PRINT 'TRY Block Completed';

END TRY

BEGIN CATCH

    PRINT 'An Error Occurred';

END CATCH;
GO


-- ==========================================
-- Step 3 : ERROR_MESSAGE()
-- ==========================================

BEGIN TRY

    PRINT 'TRY Block Started';

    -- Intentional Error
    SELECT 10 / 0 AS Result;

END TRY

BEGIN CATCH

    PRINT 'Error Message:';

    SELECT ERROR_MESSAGE() AS Error_Message;

END CATCH;
GO


-- ==========================================
-- Step 3 : ERROR_MESSAGE()
-- ==========================================

BEGIN TRY

    PRINT 'TRY Block Started';

    -- Intentional Error
    SELECT 10 / 0 AS Result;

END TRY

BEGIN CATCH

    PRINT 'Error Message:';

    SELECT ERROR_MESSAGE() AS Error_Message;

END CATCH;
GO


-- ==========================================
-- Step 4 : ERROR_NUMBER()
-- ==========================================

BEGIN TRY

    PRINT 'TRY Block Started';

    -- Intentional Error
    SELECT 10 / 0 AS Result;

END TRY

BEGIN CATCH

    SELECT
        ERROR_NUMBER() AS Error_Number,
        ERROR_MESSAGE() AS Error_Message;

END CATCH;
GO


-- ==========================================
-- Step 5 : ERROR_LINE()
-- ==========================================

BEGIN TRY

    PRINT 'TRY Block Started';

    -- Intentional Error
    SELECT 10 / 0 AS Result;

END TRY

BEGIN CATCH

    SELECT
        ERROR_NUMBER() AS Error_Number,
        ERROR_MESSAGE() AS Error_Message,
        ERROR_LINE() AS Error_Line;

END CATCH;
GO


-- ==========================================
-- Step 6 : THROW
-- ==========================================

BEGIN TRY

    DECLARE @Balance DECIMAL(10,2)=5000;
    DECLARE @TransferAmount DECIMAL(10,2)=10000;

    IF @TransferAmount>@Balance
    BEGIN
        THROW 50001,
        'Insufficient Balance.',
        1;
    END;

    PRINT 'Transfer Successful';

END TRY

BEGIN CATCH

    SELECT
        ERROR_NUMBER() AS Error_Number,
        ERROR_MESSAGE() AS Error_Message,
        ERROR_LINE() AS Error_Line;

END CATCH;
GO



-- ==========================================
-- Step 7 : Transaction Error Handling
-- ==========================================

BEGIN TRY

    BEGIN TRANSACTION;

    PRINT 'Transaction Started';

    -- First Operation
    PRINT 'Amount Deducted from Account A';

    -- Intentional Error
    SELECT 10 / 0;

    -- Second Operation
    PRINT 'Amount Added to Account B';

    COMMIT TRANSACTION;

    PRINT 'Transaction Committed';

END TRY

BEGIN CATCH

    PRINT 'Error Occurred';

    ROLLBACK TRANSACTION;

    PRINT 'Transaction Rolled Back';

    SELECT
        ERROR_NUMBER() AS Error_Number,
        ERROR_MESSAGE() AS Error_Message;

END CATCH;
GO


-- ==========================================
-- Step 8 : Log Error into ErrorLog Table
-- ==========================================

BEGIN TRY

    PRINT 'Transaction Started';

    -- Intentional Error
    SELECT 10 / 0;

END TRY

BEGIN CATCH

    INSERT INTO ErrorLog
    (
        ErrorNumber,
        ErrorMessage,
        ErrorLine
    )
    VALUES
    (
        ERROR_NUMBER(),
        ERROR_MESSAGE(),
        ERROR_LINE()
    );

    PRINT 'Error Logged Successfully';

END CATCH;
GO


-- ==========================================
-- View Logged Errors
-- ==========================================

SELECT *
FROM ErrorLog;
GO

-- ==========================================
-- Step 9 : Banking Transaction Scenario
-- ==========================================

BEGIN TRY

    BEGIN TRANSACTION;

    DECLARE @Balance DECIMAL(10,2) = 5000;
    DECLARE @TransferAmount DECIMAL(10,2) = 8000;

    PRINT 'Checking Account Balance...';

    IF @TransferAmount > @Balance
    BEGIN
        THROW 50001,
        'Insufficient Balance. Transfer Cancelled.',
        1;
    END;

    PRINT 'Amount Deducted from Account A';

    PRINT 'Amount Added to Account B';

    COMMIT TRANSACTION;

    PRINT 'Transaction Successful';

END TRY

BEGIN CATCH

    ROLLBACK TRANSACTION;

    INSERT INTO ErrorLog
    (
        ErrorNumber,
        ErrorMessage,
        ErrorLine
    )
    VALUES
    (
        ERROR_NUMBER(),
        ERROR_MESSAGE(),
        ERROR_LINE()
    );

    PRINT 'Transaction Failed';

    SELECT
        ERROR_NUMBER() AS Error_Number,
        ERROR_MESSAGE() AS Error_Message,
        ERROR_LINE() AS Error_Line;

END CATCH;
GO


USE GlobalSuperstore;
GO

IF OBJECT_ID('dbo.ErrorLog', 'U') IS NOT NULL
    DROP TABLE dbo.ErrorLog;
GO

CREATE TABLE dbo.ErrorLog
(
    LogID INT IDENTITY(1,1) PRIMARY KEY,
    ErrorNumber INT,
    ErrorMessage NVARCHAR(4000),
    ErrorLine INT,
    ErrorDate DATETIME DEFAULT GETDATE()
);
GO


-- ==========================================
-- Step 12 : Mini Project
-- Banking Transfer
-- ==========================================

BEGIN TRY

    BEGIN TRANSACTION;

    DECLARE @Balance DECIMAL(10,2)=10000;
    DECLARE @TransferAmount DECIMAL(10,2)=15000;

    PRINT 'Checking Balance...';

    IF @TransferAmount>@Balance
    BEGIN
        THROW 50001,
        'Transfer failed due to insufficient balance.',
        1;
    END;

    PRINT 'Debiting Account A...';

    PRINT 'Crediting Account B...';

    COMMIT TRANSACTION;

    PRINT 'Transfer Completed Successfully';

END TRY

BEGIN CATCH

    IF @@TRANCOUNT > 0
        ROLLBACK TRANSACTION;

    INSERT INTO dbo.ErrorLog
    (
        ErrorNumber,
        ErrorMessage,
        ErrorLine
    )
    VALUES
    (
        ERROR_NUMBER(),
        ERROR_MESSAGE(),
        ERROR_LINE()
    );

    PRINT 'Transaction Rolled Back';

    SELECT
        ERROR_NUMBER() AS Error_Number,
        ERROR_MESSAGE() AS Error_Message,
        ERROR_LINE() AS Error_Line;

END CATCH;
GO


-- ==========================================================
-- Project 18 : Error Handling & Logging
-- Status : COMPLETED
-- ==========================================================

-- Topics Covered

-- 1. TRY...CATCH
-- 2. ERROR_MESSAGE()
-- 3. ERROR_NUMBER()
-- 4. ERROR_LINE()
-- 5. THROW
-- 6. RAISERROR
-- 7. Transactions
-- 8. COMMIT
-- 9. ROLLBACK
-- 10. Error Logging
-- 11. Banking Scenario
-- 12. Mini Project

------------------------------------------------------------

-- Skills Learned

-- TRY...CATCH
-- Transaction Handling
-- COMMIT
-- ROLLBACK
-- THROW
-- RAISERROR
-- ERROR_MESSAGE()
-- ERROR_NUMBER()
-- ERROR_LINE()
-- Error Logging

------------------------------------------------------------

-- Real Project

-- Banking Transaction
-- Validate Balance
-- Raise Custom Error
-- Rollback Transaction
-- Log Error

------------------------------------------------------------

-- Result

-- Successfully implemented production-style
-- SQL Server Error Handling and Logging.

-- ==========================================================