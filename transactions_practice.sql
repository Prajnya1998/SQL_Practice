-- Project 14:SQL Transactions Practice

USE GlobalSuperstore;
GO


-- Create Bank Accounts Table
CREATE TABLE Bank_Accounts
(
    Account_ID INT PRIMARY KEY,
    Customer_Name VARCHAR(100),
    Balance DECIMAL(12,2)
);
GO



-- Insert Sample Accounts
INSERT INTO Bank_Accounts
VALUES
(101, 'Rahul Sharma', 50000.00),
(102, 'Anjali Verma', 30000.00),
(103, 'Amit Kumar', 75000.00);
GO


-- Begin Transaction
BEGIN TRANSACTION;

UPDATE Bank_Accounts
SET Balance = Balance - 10000
WHERE Account_ID = 101;

UPDATE Bank_Accounts
SET Balance = Balance + 10000
WHERE Account_ID = 102;


COMMIT;
GO


-- Reset Account Balances
UPDATE Bank_Accounts
SET Balance = 50000
WHERE Account_ID = 101;

UPDATE Bank_Accounts
SET Balance = 30000
WHERE Account_ID = 102;
GO


ROLLBACK;
GO


-- Reset Account Balances
UPDATE Bank_Accounts
SET Balance = 50000
WHERE Account_ID = 101;

UPDATE Bank_Accounts
SET Balance = 75000
WHERE Account_ID = 103;
GO


-- TRY....CATCH with Transaction
BEGIN TRY
    BEGIN TRANSACTION;

    UPDATE Bank_Accounts
    SET Balance = Balance - 10000
    WHERE Account_ID = 101;

    UPDATE Bank_Accounts
    SET Balance = Balance + 10000
    WHERE Account_ID = 102;

    COMMIT TRANSACTION;

    PRINT 'Money transferred successfully';

END TRY

BEGIN CATCH

    ROLLBACK TRANSACTION;

    SELECT
        ERROR_NUMBER() AS Error_Number,
        ERROR_MESSAGE() AS Error_Message,
        ERROR_LINE() AS Error_Line;

END CATCH;
GO   


UPDATE Bank_Accounts
SET Balance = Balance + 10000
WHERE Account_ID = 999;



BEGIN TRY

    BEGIN TRANSACTION;

    UPDATE Bank_Accounts
    SET Balance = Balance - 10000
    WHERE Account_ID = 101;

    UPDATE Bank_Accounts
    SET Balance = Balance + 10000
    WHERE Account_ID = 999;

    SELECT 10 / 0;

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


-- Reset balances
UPDATE Bank_Accounts
SET Balance = 50000
WHERE Account_ID = 101;

UPDATE Bank_Accounts
SET Balance = 30000
WHERE Account_ID = 102;
GO

BEGIN TRANSACTION;

UPDATE Bank_Accounts
SET Balance = Balance - 10000
WHERE Account_ID = 101;

SAVE TRANSACTION TransferPoint;

UPDATE Bank_Accounts
SET Balance = Balance + 10000
WHERE Account_ID = 102;

ROLLBACK TRANSACTION TransferPoint;

COMMIT;
GO


-- Reset Bank Account Balances
UPDATE Bank_Accounts
SET Balance = 50000
WHERE Account_ID = 101;

UPDATE Bank_Accounts
SET Balance = 30000
WHERE Account_ID = 102;

UPDATE Bank_Accounts
SET Balance = 75000
WHERE Account_ID = 103;
GO


SELECT * FROM Bank_Accounts;
GO


-- Transfer ₹10,000 from Rahul to Priya
BEGIN TRANSACTION;


