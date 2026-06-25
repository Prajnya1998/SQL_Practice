-- Project 6: Date Functions Practice

USE GlobalSuperstore;

-- Current Date and Time
SELECT 
    GETDATE() AS Current_Date_Time;


-- Extract Year from Order Date
SELECT
    Order_Date,
    YEAR(Order_Date) AS Order_Year
FROM [dbo].[Global_Superstore(CSV)];


-- Extract Month from Order Date
SELECT
      Order_Date,
      MONTH(Order_Date) AS Order_Month
FROM [dbo].[Global_Superstore(CSV)];


-- Extract Day from Order Date
SELECT
     Order_Date,
     DAY(Order_Date) AS Order_Day
FROM [dbo].[Global_Superstore(CSV)];


-- Add 30 Days to Order Date
SELECT
     Order_Date,
     DATEADD(DAY, 30, Order_Date) AS New_Order_Date
FROM [dbo].[Global_Superstore(CSV)];


-- Days Between Oder Date and Ship Date
SELECT
     Order_Date,
     Ship_Date,
     DATEDIFF(DAY, Order_Date, Ship_Date) AS Shipping_Days
FROM [dbo].[Global_Superstore(CSV)];


-- Difference in Months
SELECT
     Order_Date,
     Ship_Date,
     DATEDIFF(MONTH, Order_Date, Ship_Date) AS Month_Difference
FROM [dbo].[Global_Superstore(CSV)];


-- Difference in Years
SELECT
     Order_Date,
     Ship_Date,
     DATEDIFF(YEAR, Order_Date, Ship_Date) AS Year_Difference
FROM [dbo].[Global_Superstore(CSV)];


-- End of Month for Order Date
SELECT
     Order_Date,
     EOMONTH(Order_Date) AS End_Of_Month
FROM [dbo].[Global_Superstore(CSV)];


-- Convert Order Date to Date
SELECT
     Order_Date,
     CAST((Order_Date) AS DATE) AS Date_Only
FROM [dbo].[Global_Superstore(CSV)];


-- Convert Order Date
SELECT
     Order_date,
     CONVERT(VARCHAR(20), Order_Date, 103) AS Convert_Date
FROM [dbo].[Global_Superstore(CSV)];


-- Format Order Date
SELECT
     Order_Date,
     FORMAT(Order_Date, 'dd-MMM-yyyy') AS Formatted_Date
FROM [dbo].[Global_Superstore(CSV)];







