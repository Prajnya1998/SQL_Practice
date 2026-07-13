USE GlobalSuperstore;
GO

-- ==================================================
-- Project 26 : XML & JSON
-- ==================================================

-- Objective:
-- Learn how to work with XML and JSON
-- data in SQL Server using FOR XML,
-- FOR JSON, OPENJSON and JSON_VALUE().

GO

-- ==========================================
-- Step 1 : Introduction
-- ==========================================

-- XML (Extensible Markup Language)
-- and JSON (JavaScript Object Notation)
-- are widely used for exchanging data
-- between applications and APIs.

-- SQL Server supports:
-- ✔ FOR XML
-- ✔ FOR JSON
-- ✔ OPENJSON()
-- ✔ JSON_VALUE()
-- ✔ JSON_QUERY()

GO


-- ==========================================
-- Step 2 : FOR XML
-- ==========================================

-- Business Requirement:
-- Export customer sales data
-- in XML format.

SELECT

    Order_ID,
    Customer_Name,
    Sales

FROM [dbo].[Global_Superstore(CSV)]

FOR XML PATH('Order'), ROOT('Orders');

GO

-- ==========================================
-- Step 3 : FOR JSON
-- ==========================================

-- Business Requirement:
-- Export customer sales data
-- in JSON format.

SELECT

    Order_ID,
    Customer_Name,
    Sales

FROM [dbo].[Global_Superstore(CSV)]

FOR JSON PATH;

GO


-- ==========================================
-- Step 4 : JSON_VALUE()
-- ==========================================

-- Business Requirement:
-- Extract a single value
-- from JSON data.

DECLARE @CustomerJSON NVARCHAR(MAX);

SET @CustomerJSON = '
{
    "Order_ID":"CA-2012-124891",
    "Customer_Name":"John Smith",
    "Region":"East",
    "Sales":450
}';

SELECT

    JSON_VALUE(@CustomerJSON,'$.Order_ID') AS Order_ID,

    JSON_VALUE(@CustomerJSON,'$.Customer_Name') AS Customer_Name,

    JSON_VALUE(@CustomerJSON,'$.Region') AS Region,

    JSON_VALUE(@CustomerJSON,'$.Sales') AS Sales;

GO


-- ==========================================
-- Step 5 : JSON_QUERY()
-- ==========================================

-- Business Requirement:
-- Extract a complete JSON object
-- from JSON data.

DECLARE @CustomerJSON NVARCHAR(MAX);

SET @CustomerJSON = '
{
    "Order_ID":"CA-2012-124891",
    "Customer_Name":"John Smith",
    "Address":
    {
        "City":"New York",
        "State":"NY",
        "Country":"USA"
    }
}';

SELECT

    JSON_QUERY(@CustomerJSON,'$.Address') AS Customer_Address;

GO


-- ==========================================
-- Step 6 : OPENJSON()
-- ==========================================

-- Business Requirement:
-- Convert JSON data into
-- SQL rows and columns.

DECLARE @CustomerJSON NVARCHAR(MAX);

SET @CustomerJSON = '
[
    {
        "Order_ID":"CA-2012-124891",
        "Customer_Name":"John Smith",
        "Sales":450
    },
    {
        "Order_ID":"CA-2012-124892",
        "Customer_Name":"Alice Brown",
        "Sales":800
    },
    {
        "Order_ID":"CA-2012-124893",
        "Customer_Name":"David Wilson",
        "Sales":1200
    }
]';

SELECT *

FROM OPENJSON(@CustomerJSON)

WITH
(
    Order_ID NVARCHAR(50),

    Customer_Name NVARCHAR(100),

    Sales FLOAT
);

GO


-- ==========================================
-- Step 7 : Real-Time API Project
-- ==========================================

-- Business Requirement:
-- A Sales API sends order data in JSON format.
-- Convert the JSON into a SQL table
-- and generate a sales report.

DECLARE @SalesJSON NVARCHAR(MAX);

SET @SalesJSON = '
[
    {
        "Order_ID":"CA-2012-124891",
        "Customer_Name":"John Smith",
        "Region":"East",
        "Category":"Technology",
        "Sales":450
    },
    {
        "Order_ID":"CA-2012-124892",
        "Customer_Name":"Alice Brown",
        "Region":"West",
        "Category":"Furniture",
        "Sales":800
    },
    {
        "Order_ID":"CA-2012-124893",
        "Customer_Name":"David Wilson",
        "Region":"East",
        "Category":"Office Supplies",
        "Sales":1200
    }
];

-- Convert JSON into SQL Table

SELECT *

INTO #SalesAPIData

FROM OPENJSON(@SalesJSON)

WITH
(
    Order_ID NVARCHAR(50),

    Customer_Name NVARCHAR(100),

    Region NVARCHAR(50),

    Category NVARCHAR(100),

    Sales FLOAT
);

-- Display Imported Data

SELECT *

FROM #SalesAPIData;

-- Sales Summary

SELECT

    Region,

    COUNT(*) AS Total_Orders,

    SUM(Sales) AS Total_Sales,

    AVG(Sales) AS Average_Sales

FROM #SalesAPIData

GROUP BY Region;

GO


-- ==========================================
-- Interview Questions
-- ==========================================

-- Q1. Why is JSON used?

-- Answer:
-- JSON is lightweight and is widely
-- used for exchanging data between
-- applications and APIs.

-------------------------------------------------

-- Q2. What is OPENJSON()?

-- Answer:
-- It converts JSON into rows and
-- columns.

-------------------------------------------------

-- Q3. Difference between
-- JSON_VALUE() and OPENJSON()?

-- Answer:

-- JSON_VALUE()
-- Returns one value.

-- OPENJSON()
-- Returns a table.

-------------------------------------------------

-- Q4. Where is JSON used?

-- Answer:

-- ✔ REST APIs
-- ✔ Power BI
-- ✔ Azure
-- ✔ AWS
-- ✔ Python
-- ✔ Web Applications

-------------------------------------------------

-- Q5. Which is more common today?

-- Answer:

-- JSON

-- ==========================================
-- Step 8 : Interview Questions
-- ==========================================

-- Q1. What is XML?

-- Answer:
-- XML (Extensible Markup Language)
-- is a markup language used to
-- exchange structured data.

-------------------------------------------------

-- Q2. What is JSON?

-- Answer:
-- JSON (JavaScript Object Notation)
-- is a lightweight data format
-- used to exchange data between
-- applications.

-------------------------------------------------

-- Q3. Difference between XML and JSON?

-- Answer:

-- XML
-- Uses Tags
-- Larger File Size
-- Older Technology

-- JSON
-- Uses Key-Value Pairs
-- Smaller File Size
-- Faster
-- Modern Technology

-------------------------------------------------

-- Q4. What is FOR XML?

-- Answer:
-- Converts SQL query results
-- into XML format.

-------------------------------------------------

-- Q5. What is FOR JSON?

-- Answer:
-- Converts SQL query results
-- into JSON format.

-------------------------------------------------

-- Q6. What is JSON_VALUE()?

-- Answer:
-- Extracts a single scalar value
-- from JSON.

-------------------------------------------------

-- Q7. What is JSON_QUERY()?

-- Answer:
-- Extracts an entire JSON object
-- or array.

-------------------------------------------------

-- Q8. What is OPENJSON()?

-- Answer:
-- Converts JSON data into
-- rows and columns.

-------------------------------------------------

-- Q9. Where is JSON used?

-- Answer:

-- ✔ REST APIs
-- ✔ Azure
-- ✔ Power BI
-- ✔ Python
-- ✔ Web Applications
-- ✔ Mobile Apps

-------------------------------------------------

-- Q10. Which format is used more
-- in modern applications?

-- Answer:

-- JSON

GO