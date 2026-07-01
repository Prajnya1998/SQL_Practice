-- SQL Triggers Practice

USE GlobalSuperstore;
GO


-- Create Employee Table
CREATE TABLE Employee
(
    Employee_ID INT PRIMARY KEY,
    Employee_Name VARCHAR(100),
    Department VARCHAR(50),
    Salary DECIMAL(10,2)
);
GO


-- Create Employee Audit Table
CREATE TABLE Employee_Audit
(
    Audit_ID INT IDENTITY(1,1) PRIMARY KEY,
    Employee_ID INT,
    Employee_Name VARCHAR(100),
    Action_Performed VARCHAR(50),
    Action_Date DATETIME    
);
GO


SELECT * FROM Employee;
GO

SELECT * FROM Employee_Audit;
GO


-- AFTER INSERT Trigger
CREATE TRIGGER trg_AfterInsertEmployee
ON Employee
AFTER INSERT
AS
BEGIN
    INSERT INTO Employee_Audit
    (
        Employee_ID,
        Employee_Name,
        Action_Performed,
        Action_Date
    )
    SELECT
        Employee_ID,
        Employee_Name,
        'INSERT',
        GETDATE()
    FROM inserted;
END;
GO


-- Insert Employee
INSERT INTO Employee
VALUES
(
    101,
    'Rahul SHarma',
    'IT',
    60000
);
GO


-- INSTEAD OF DELETE Trigger
CREATE TRIGGER trg_PreventEmployeeDelete
ON Employee
INSTEAD OF DELETE
AS
BEGIN
    PRINT 'EMployee records cannot be deleted. Contact the HR Administrator.';
END;
GO


-- Practical Trigger Example
ALTER TRIGGER trg_PreventEmployeeDelete
ON Employee
INSTEAD OF DELETE
AS
BEGIN
    INSERT INTO Employee_Audit
    (
        Employee_ID,
        Employee_Name,
        Action_Performed,
        Action_Date
    )
    SELECT
        Employee_ID,
        Employee_Name,
        'DELETE ATTEMPT',
        GETDATE()
    FROM deleted;
    PRINT 'Delete operation blocked. Attempt has been recorded.';
END;
GO



ALTER TRIGGER trg_PreventEmployeeDelete
ON Employee
INSTEAD OF DELETE
AS
BEGIN
    INSERT INTO Employee_Audit
    (
        Employee_ID,
        Employee_Name,
        Action_Performed,
        Action_Date
    )
    SELECT
        Employee_ID,
        Employee_Name,
        'DELETE ATTEMPT',
        GETDATE()
    FROM deleted;
    PRINT 'Delete operation blocked. Attempt has been recorded.';
END;
GO



DELETE FROM Employee
WHERE Employee_ID = 101;
GO



ALTER TRIGGER trg_PreventEmployeeDelete
ON Employee
INSTEAD OF DELETE
AS
BEGIN
    INSERT INTO Employee_Audit
    (
        Employee_ID,
        Employee_Name,
        Action_Performed,
        Action_Date
    )
    SELECT
        Employee_ID,
        Employee_Name,
        'DELETE BLOCKED',
        GETDATE()
    FROM Deleted;
    PRINT 'Delete blocked. Security Team has been notified.';
END;
GO


-- Drop AFTER INSERT Trigger
DROP TRIGGER trg_AfterInsertEmployee;
GO


INSERT INTO Employee
VALUES
(
    102,
    'Priya Verma',
    'Finance',
    70000
);
GO