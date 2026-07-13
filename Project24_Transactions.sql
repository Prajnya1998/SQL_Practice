USE GlobalSuperstore;
GO

-- ==================================================
-- Project 24 : Transactions
-- ==================================================

-- Objective:
-- Learn SQL Server Transactions using
-- BEGIN TRANSACTION, COMMIT, ROLLBACK,
-- SAVEPOINT and Transaction Best Practices.

GO

-- ==========================================
-- Step 1 : Introduction
-- ==========================================

-- A Transaction is a sequence of SQL
-- statements that are executed as
-- one logical unit of work.

-- A Transaction follows ACID Properties.

-- ACID
-- A - Atomicity
-- C - Consistency
-- I - Isolation
-- D - Durability

GO

-- ==========================================
-- Step 2 : BEGIN TRANSACTION
-- ==========================================

-- Business Requirement:
-- Update Sales safely using
-- a Transaction.

BEGIN TRANSACTION;

UPDATE [dbo].[Global_Superstore(CSV)]

SET Sales = Sales

WHERE Order_ID = 'CA-2012-124891';

COMMIT TRANSACTION;

GO


-- ==========================================
-- Step 3 : COMMIT TRANSACTION
-- ==========================================

-- Business Requirement:
-- Save the transaction permanently
-- after successful execution.

BEGIN TRANSACTION;

UPDATE [dbo].[Global_Superstore(CSV)]

SET Profit = Profit

WHERE Order_ID = 'CA-2012-124891';

COMMIT TRANSACTION;

PRINT 'Transaction Committed Successfully.';

GO


-- ==========================================
-- Step 4 : ROLLBACK TRANSACTION
-- ==========================================

-- Business Requirement:
-- Undo all changes if an error occurs.

BEGIN TRANSACTION;

UPDATE [dbo].[Global_Superstore(CSV)]
SET Profit = Profit;

ROLLBACK TRANSACTION;

PRINT 'Transaction Rolled Back Successfully.';

GO

-- ==========================================
-- Step 5 : SAVE TRANSACTION
-- ==========================================

-- Business Requirement:
-- Create a Save Point inside
-- a Transaction.

BEGIN TRANSACTION;

SAVE TRANSACTION SavePoint1;

UPDATE [dbo].[Global_Superstore(CSV)]
SET Sales = Sales;

ROLLBACK TRANSACTION SavePoint1;

COMMIT TRANSACTION;

GO


-- ==========================================
-- Step 6 : TRY...CATCH with Transactions
-- ==========================================

-- Business Requirement:
-- Rollback Transaction when
-- an error occurs.

BEGIN TRY

    BEGIN TRANSACTION;

    SELECT
        100 / 0 AS Result;

    COMMIT TRANSACTION;

END TRY

BEGIN CATCH

    ROLLBACK TRANSACTION;

    SELECT

        ERROR_NUMBER() AS Error_Number,

        ERROR_MESSAGE() AS Error_Message,

        ERROR_LINE() AS Error_Line;

END CATCH;

GO


-- ==========================================
-- Step 7 : Real-Time Banking Project
-- ==========================================

-- Business Requirement:
-- Transfer money safely between
-- two bank accounts.

BEGIN TRY

    BEGIN TRANSACTION;

    PRINT 'Amount Debited from Account A';

    PRINT 'Amount Credited to Account B';

    COMMIT TRANSACTION;

    PRINT 'Transaction Successful';

END TRY

BEGIN CATCH

    ROLLBACK TRANSACTION;

    PRINT 'Transaction Failed';

END CATCH;

GO