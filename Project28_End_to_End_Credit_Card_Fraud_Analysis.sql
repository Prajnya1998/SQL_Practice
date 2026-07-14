-- ==========================================
-- Step 1 : Create Database
-- ==========================================

CREATE DATABASE CreditCardFraudDB;
GO


USE CreditCardFraudDB;
GO



SELECT TOP (10) *
FROM [dbo].[CreditCardTransactions]
GO

EXEC sp_help 'CreditCardTransactions';
GO


-- ============================================================
-- Step 4 : Exploratory Data Analysis (EDA)
-- ============================================================

-- Business Requirement:
-- Determine the total number of
-- credit card transactions processed
-- by the bank.
-- ==========================================

SELECT 
    COUNT(*) AS Total_Transactions
FROM [dbo].[CreditCardTransactions]

GO


-- ============================================================
-- Total Fraud Transactions
-- ============================================================

-- Business Requirement:
-- Find the total number of
-- fraudulent transactions.

SELECT
    COUNT(*) AS Fraud_Transactions
FROM CreditCardTransactions
WHERE is_fraud = 1;
GO


-- ============================================================
-- Genuine Transactions
-- ============================================================

-- Business Requirement:
-- Find the total number of
-- genuine transactions.

SELECT 
    COUNT(*) AS Genuine_Transactions
FROM CreditCardTransactions
WHERE is_fraud = 0;
GO


-- ============================================================
-- Fraud Rate
-- ============================================================

-- Business Requirement:
-- Calculate the percentage
-- of fraudulent transactions.

SELECT
    COUNT(CASE WHEN is_fraud = 1 THEN 1 END) * 100.0
	    / COUNT(*) AS Fraud_Rate_Percentage
FROM CreditCardTransactions;
GO


-- ============================================================
-- Total Transaction Amount
-- ============================================================

-- Business Requirement:
-- Calculate the total amount
-- processed by the bank.

SELECT 
    SUM(amt) AS Total_Transaction_Amount
FROM CreditCardTransactions;
GO

-- ============================================================
-- Average Transaction Amount
-- ============================================================

-- Business Requirement:
-- Calculate the average
-- transaction amount.

SELECT
    AVG(amt) AS Average_Transaction_Amount
FROM CreditCardTransactions;
GO

-- ============================================================
-- Step 5 : Customer Analysis
-- ============================================================

-- Business Requirement:
-- Identify the Top 10 customers
-- by total transaction amount.

SELECT TOP (10)
    cc_num,
	first + ' ' + last AS Customer_Name,
	SUM(amt) AS Total_Spent,
	COUNT(*) AS Total_Transactions
FROM CreditCardTransactions
GROUP BY 
    cc_num,
	first,
	last
ORDER BY Total_Spent DESC;
GO


-- ============================================================
-- Step 6 : Merchant Analysis
-- ============================================================
SELECT
    merchant,
	COUNT(*) AS Total_Transactions,
	SUM(amt) AS Total_Sales,
	AVG(amt) AS Average_Transaction
FROM CreditCardTransactions
GROUP BY merchant
ORDER BY Total_Sales DESC;
GO

-- ============================================================
-- Step 6 : Merchant Analysis
-- ============================================================
 SELECT
     merchant,
	 COUNT(*) AS Fraud_Count,
	 SUM(amt) AS Fraud_Amount
FROM CreditCardTransactions
WHERE is_fraud = 1
GROUP BY merchant
ORDER BY Fraud_Count DESC;
GO


-- ============================================================
-- Step 8 : Geographic Analysis
-- ============================================================
SELECT 
    state,
	COUNT(*) AS Total_Transactions,
	SUM(CASE WHEN is_fraud=1 THEN 1 ELSE 0 END) AS Fraud_Transactions,
	SUM(amt) AS Total_Amount
FROM CreditCardTransactions
GROUP BY state
ORDER BY Fraud_Transactions DESC;
GO


-- ============================================================
-- Step 9 : Category Analysis
-- ============================================================
SELECT
    category,
	COUNT(*) AS Transactions,
	SUM(CASE WHEN is_fraud=1 THEN 1 ELSE 0 END) AS Fraud_Count,
	SUM(amt) AS Sales
FROM CreditCardTransactions
GROUP BY category
ORDER BY Fraud_Count DESC;
GO

-- ============================================================
-- Step 10 : Monthly Fraud Trend
-- ============================================================
SELECT
    YEAR(trans_date_trans_time) AS Year,
	MONTH(trans_date_trans_time) AS Month,
	COUNT(*) AS Fraud_Transactions,
	SUM(amt) AS Fraud_Amount
FROM CreditCardTransactions
WHERE is_fraud = 1
GROUP BY
    YEAR(trans_date_trans_time),
	MONTH(trans_date_trans_time)
ORDER BY
    Year,
	Month;
GO


-- ============================================================
-- Step 10 : Monthly Fraud Trend
-- ============================================================
SELECT
    merchant,
	category,
	amt,
	RANK() OVER
	(
	    ORDER BY amt DESC
	) AS Transaction_Rank
FROM CreditCardTransactions;
GO

-- ============================================================
-- Step 12 : CTE
-- ============================================================
WITH FraudSummary AS
(
SELECT
    state,
	COUNT(*) AS Fraud_Count
FROM CreditCardTransactions
WHERE is_fraud=1
GROUP BY state
)
SELECT * 
FROM FraudSummary
ORDER BY Fraud_Count DESC;
GO


-- ============================================================
-- Step 13 : Temporary Table
-- ============================================================
SELECT *
INTO #FraudTransactions
FROM CreditCardTransactions
WHERE is_fraud=1;
SELECT COUNT(*) AS Fraud_Count
FROM #FraudTransactions;
DROP TABLE #FraudTransactions;
GO


-- ============================================================
-- Step 14 : Stored Procedure
-- ============================================================
CREATE PROCEDURE usp_StateFraudReport
AS
BEGIN
SELECT
    state,
	COUNT(*) AS Fraud_Count,
	SUM(amt) AS Fraud_Amount
FROM CreditCardTransactions
WHERE is_fraud=1
GROUP BY state
ORDER BY Fraud_Count DESC;
END;
GO
EXEC usp_StateFraudReport;
GO

-- ============================================================
-- Step 15 : Dynamic SQL
-- ============================================================
DECLARE @State NVARCHAR(50);
SET @State='TX';
DECLARE @SQL NVARCHAR(MAX);
SET @SQL='
SELECT *
FROM CreditCardTransactions
WHERE state=''' + @State + '''';
EXEC sp_executesql @SQL;
GO


-- ============================================================
-- Step 16 : Performance Tuning
-- ============================================================
CREATE NONCLUSTERED INDEX IX_State_Fraud
ON CreditCardTransactions
(
state,
is_fraud
)
INCLUDE
(
amt,
merchant,
category
);
GO