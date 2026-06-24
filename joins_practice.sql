-- Project 2: SQL JOINS Practice

-- INNER JOIN

SELECT
    E.Emp_ID,
    E.Emp_Name,
    E.Emp_Last,
    D.Dept_Name,
    D.Head_Of_Dept
FROM Employees E
INNER JOIN Departments D
ON E.Dept_ID = D.Dept_ID;


-- LEFT JOIN

SELECT
    E.Emp_ID,
    E.Emp_Name,
    E.Emp_Last,
    D.Dept_Name,
    D.Head_Of_Dept
FROM Employees E
LEFT JOIN Departments D
ON E.Dept_ID = D.Dept_ID;


-- RIGHT JOIN

SELECT
   E.Emp_ID,
   E.Emp_Name,
   D.Dept_ID,
   D.Dept_Name,
   D.Head_Of_Dept
FROM Employees E
RIGHT JOIN Departments D
ON E.Dept_ID = D.Dept_ID;


-- FULL OUTER JOIN

SELECT
    E.Emp_ID,
    E.Emp_Name,
    D.Dept_ID,
    D.Dept_Name,
    D.Head_Of_Dept
FROM Employees E
FULL OUTER JOIN Departments D
ON E.Dept_ID = D.Dept_ID;

