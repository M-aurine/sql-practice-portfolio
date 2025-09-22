-- =====================================
-- SQL PRACTICE PROJECT: EMPLOYEES TABLE
-- =====================================

-- This project demonstrates SQL fundamentals
-- using an Employees table with sample data.
-- Covered topics: SELECT, WHERE, ORDER BY, LIMIT,
-- Aggregate Functions, DISTINCT, IN, BETWEEN, LIKE,
-- GROUP BY, HAVING, and CASE.

-- =====================================
-- CREATE EMPLOYEES TABLE
-- =====================================

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Gender VARCHAR(10),
    Age INT,
    Department VARCHAR(50),
    JobRole VARCHAR(50),
    EducationLevel INT,   -- 1 = High School, 2 = Diploma, 3 = Bachelor, 4 = Master, 5 = PhD
    YearsAtCompany INT,
    Salary DECIMAL(10,2),
    Attrition VARCHAR(3)  -- 'Yes' or 'No'
);

-- =====================================
-- INSERT SAMPLE DATA
-- =====================================

INSERT INTO Employees (EmployeeID, FirstName, LastName, Gender, Age, Department, JobRole, EducationLevel, YearsAtCompany, Salary, Attrition)
VALUES
(101, 'Alice', 'Kim', 'Female', 29, 'HR', 'HR Specialist', 3, 4, 55000.00, 'No'),
(102, 'John', 'Doe', 'Male', 35, 'IT', 'Data Analyst', 4, 6, 72000.00, 'Yes'),
(103, 'Mary', 'Otieno', 'Female', 41, 'Finance', 'Accountant', 2, 10, 68000.00, 'No'),
(104, 'Peter', 'Mwangi', 'Male', 27, 'Marketing', 'Marketing Coordinator', 3, 2, 48000.00, 'Yes'),
(105, 'Linda', 'Achieng', 'Female', 32, 'IT', 'Software Engineer', 4, 5, 95000.00, 'No'),
(106, 'James', 'Njoroge', 'Male', 45, 'Finance', 'Finance Manager', 5, 15, 120000.00, 'No'),
(107, 'Grace', 'Mutiso', 'Female', 38, 'HR', 'Recruiter', 3, 8, 60000.00, 'Yes'),
(108, 'Brian', 'Odhiambo', 'Male', 30, 'Sales', 'Sales Executive', 2, 4, 52000.00, 'No'),
(109, 'Cynthia', 'Wanjiru', 'Female', 26, 'IT', 'Systems Analyst', 3, 3, 68000.00, 'No'),
(110, 'Samuel', 'Kariuki', 'Male', 34, 'Marketing', 'Brand Manager', 4, 7, 85000.00, 'Yes');

-- =====================================
-- WEEK 1: SELECT, WHERE, ORDER, AGGREGATES
-- =====================================

-- 1. Show all details for every employee
SELECT * 
FROM Employees;

-- 2. Show only first name, last name, and department
SELECT FirstName, LastName, Department
FROM Employees;

-- 3. Display distinct departments
SELECT DISTINCT Department
FROM Employees;

-- 4. Get all employees in IT
SELECT * 
FROM Employees
WHERE Department = 'IT';

-- 5. Employees with salary > 70,000
SELECT * 
FROM Employees
WHERE Salary > 70000;

-- 6. Employees under 30 in Marketing
SELECT * 
FROM Employees
WHERE Age < 30 AND Department = 'Marketing';

-- 7. List employees with salary sorted high → low
SELECT FirstName, LastName, Salary
FROM Employees
ORDER BY Salary DESC;

-- 8. Top 3 highest paid employees
SELECT FirstName, LastName, Salary
FROM Employees
ORDER BY Salary DESC
LIMIT 3;

-- 9. Youngest employee(s)
SELECT * 
FROM Employees
ORDER BY Age
LIMIT 1;

-- 10. Total employees
SELECT COUNT(*) AS TotalEmployees
FROM Employees;

-- 11. Employees who left (Attrition = Yes)
SELECT COUNT(*) AS LeftEmployees
FROM Employees
WHERE Attrition = 'Yes';

-- 12. Average salary in Finance
SELECT AVG(Salary) AS AvgFinanceSalary
FROM Employees
WHERE Department = 'Finance';

-- 13. Max years at the company
SELECT MAX(YearsAtCompany) AS MaxYears
FROM Employees;

-- 14. Average age per department
SELECT Department, AVG(Age) AS AvgAge
FROM Employees
GROUP BY Department;

-- =====================================
-- WEEK 2: DISTINCT, IN, BETWEEN, LIKE, GROUP BY, HAVING, CASE
-- =====================================

-- DISTINCT
-- 1. All unique job roles
SELECT DISTINCT JobRole
FROM Employees;

-- 2. Unique education levels
SELECT DISTINCT EducationLevel
FROM Employees;

-- IN
-- 3. Employees in HR, IT, or Finance
SELECT FirstName, LastName, Department
FROM Employees
WHERE Department IN ('HR','IT','Finance');

-- 4. Employees aged 27, 30, or 35
SELECT FirstName, LastName, Age, Salary
FROM Employees
WHERE Age IN (27, 30, 35);

-- BETWEEN
-- 5. Employees with salary between 60,000 and 90,000
SELECT FirstName, LastName, Salary
FROM Employees
WHERE Salary BETWEEN 60000 AND 90000;

-- 6. Employees with 5–10 years at company
SELECT FirstName, LastName, YearsAtCompany
FROM Employees
WHERE YearsAtCompany BETWEEN 5 AND 10;

-- LIKE
-- 7. First name starts with A
SELECT FirstName, LastName
FROM Employees
WHERE FirstName LIKE 'A%';

-- 8. Last name ends with o
SELECT FirstName, LastName
FROM Employees
WHERE LastName LIKE '%o';

-- 9. First name contains 'ri'
SELECT FirstName, LastName
FROM Employees
WHERE FirstName LIKE '%ri%';

-- GROUP BY + HAVING
-- 10. Average salary per department
SELECT Department, AVG(Salary) AS AvgSalary
FROM Employees
GROUP BY Department;

-- 11. Departments with avg salary > 70,000
SELECT Department, AVG(Salary) AS AvgSalary
FROM Employees
GROUP BY Department
HAVING AVG(Salary) > 70000;

-- 12. Departments with more than 2 employees
SELECT Department, COUNT(*) AS NoOfEmployees
FROM Employees
GROUP BY Department
HAVING COUNT(*) > 2;

-- CASE
-- 13. Categorize salary bands
SELECT FirstName, LastName, Salary,
    CASE 
        WHEN Salary >= 90000 THEN 'High'
        WHEN Salary BETWEEN 60000 AND 89999 THEN 'Medium'
        ELSE 'Low'
    END AS SalaryBand
FROM Employees;

-- 14. Attrition status (Left / Active)
SELECT FirstName, LastName, Attrition,
    CASE
        WHEN Attrition = 'Yes' THEN 'Left'
        ELSE 'Active'
    END AS AttritionStatus
FROM Employees;

-- 15. Department size label (Large if > 3 employees)
SELECT Department, COUNT(*) AS NoOfEmployees,
    CASE 
        WHEN COUNT(*) > 3 THEN 'Large'
        ELSE 'Small'
    END AS DeptSize
FROM Employees
GROUP BY Department;
