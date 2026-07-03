-- Project 15: SQL Indexes Practice

USE GlobalSuperstore;
GO

-- Search by Customer Name
SELECT *
FROM [dbo].[Global_Superstore(CSV)]
WHERE Customer_Name = 'Jill Matthias';
GO

-- Search by Product ID
SELECT *
FROM [dbo].[Global_Superstore(CSV)]
WHERE Product_ID = 'TEC-PH-5355';
GO

EXEC sp_helpindex '[dbo].[Global_Superstore(CSV)]';
GO

CREATE NONCLUSTERED INDEX IX_GlobalSuperstore_CustomerName
ON [dbo].[Global_Superstore(CSV)] 
(
    Customer_Name
);
GO

SET STATISTICS IO ON;
SET STATISTICS TIME ON;
GO

SELECT *
FROM [dbo].[Global_Superstore(CSV)]
WHERE Customer_Name = 'Jill Matthias';
GO


ALTER INDEX IX_GlobalSuperstore_CustomerName
ON [dbo].[Global_Superstore(CSV)]
REORGANIZE;
GO


ALTER INDEX ALL
ON [dbo].[Global_Superstore(CSV)]
REBUILD;
GO


ALTER INDEX IX_GlobalSuperstore_CustomerName
ON [dbo].[Global_Superstore(CSV)]
REBUILD;
GO

DROP INDEX IX_GlobalSuperstore_CustomerName
ON [dbo].[Global_Superstore(CSV)];
GO