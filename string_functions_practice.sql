-- Project 5: String Functions Practice

USE GlobalSuperstore;

-- Customer Names in Uppercase
SELECT
    Customer_Name,
    UPPER(Customer_Name) AS Customer_Name_Upper
FROM [dbo].[Global_Superstore(CSV)];


-- Customer Names in Lowercase
SELECT
     Customer_Name,
     LOWER(Customer_Name) AS Customer_Name_Lower
FROM [dbo].[Global_Superstore(CSV)];


-- Length of Customer Names
SELECT
    Customer_Name,
    LEN(Customer_Name) AS Name_Length
FROM [dbo].[Global_Superstore(CSV)];


-- First 3 Characters of Customer Name
SELECT
    Customer_Name,
    LEFT(Customer_Name,3) AS First_3_Characters
FROM [dbo].[Global_Superstore(CSV)];

-- Last 5 Characters of Customer Name
SELECT
    Customer_Name,
    RIGHT(Customer_Name,5) AS Last_5_Characters
FROM [dbo].[Global_Superstore(CSV)];


-- Expert First Name from Customer Name
SELECT
    Customer_Name,
    SUBSTRING(Customer_Name, 1, 5) AS First_5_Characters
FROM [dbo].[Global_Superstore(CSV)];


-- Combine Customer Name and Country
SELECT
     CONCAT(Customer_Name, ' - ', Country) AS Customer_Details
FROM [dbo].[Global_Superstore(CSV)];


-- Remove Extra Spaces
SELECT
     Customer_Name,
     TRIM(Customer_Name) AS Clean_Customer_Name
FROM [dbo].[Global_Superstore(CSV)];


-- Replace Spaces with Underscore
SELECT
     Customer_Name,
     REPLACE(Customer_Name, ' ', '_') AS Customer_Name_New
FROM [dbo].[Global_Superstore(CSV)];


-- Position of Space in Customer Name
SELECT
    Customer_Name,
    CHARINDEX(' ', Customer_Name) AS Space_Position
FROM [dbo].[Global_Superstore(CSV)];



