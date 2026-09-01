-- ----------JOINS----------                         --- DAY 13 ---

CREATE TABLE department_info (
 department VARCHAR(30) PRIMARY KEY,
 manager_name VARCHAR(50),
 location VARCHAR(30)
);
INSERT INTO department_info VALUES
('IT','Vikram Deshmukh','Pune'),
('HR','Meera Rao','Pune'),
('Finance','Amit Verma','Mumbai'),
('Sales','Pooja Nair','Mumbai'),
('Marketing','Aditya Pawar','Pune'),
('Operations','Sahil Khan','Delhi');

-- INNER JOIN                                   -- Part 1 --
-- Q1. Employee and department manager.
SELECT e.employee_name,d.manager_name
FROM employee_sales e
 INNER JOIN department_info d 
 ON e.department=d.department;
-- Q2. Employee and department location.
SELECT e.employee_name,d.location
FROM employee_sales e 
INNER JOIN department_info d 
ON e.department=d.department;
-- Q3. IT employees and manager.
SELECT e.employee_name,d.manager_name
FROM employee_sales e JOIN department_info d ON e.department=d.department
WHERE e.department='IT';
-- Q4. Employee, department and manager.
SELECT e.employee_name,e.department,d.manager_name
FROM employee_sales e JOIN department_info d ON e.department=d.department;
-- Q5. Employees in departments located in Mumbai.
SELECT e.employee_name,e.department,d.location
FROM employee_sales e JOIN department_info d ON e.department=d.department
WHERE d.location='Mumbai';

-- LEFT JOIN
-- Q1. All employees with department manager.
SELECT e.employee_name,d.manager_name
FROM employee_sales e LEFT JOIN department_info d ON e.department=d.department;
-- Q2. All employees with department location.
SELECT e.employee_name,d.location
FROM employee_sales e LEFT JOIN department_info d ON e.department=d.department;
-- Q3. Pune employees with manager.
SELECT e.employee_name,e.department,d.manager_name
FROM employee_sales e LEFT JOIN department_info d ON e.department=d.department
WHERE e.city='Pune';
-- Q4. Employee salary and manager.
SELECT e.employee_name,e.salary,d.manager_name
FROM employee_sales e LEFT JOIN department_info d ON e.department=d.department;
-- Q5. All employee and department information.
SELECT e.*,d.manager_name,d.location
FROM employee_sales e LEFT JOIN department_info d ON e.department=d.department;

-- RIGHT JOIN
-- Q1. All departments and matching employees.
SELECT d.department,e.employee_name
FROM employee_sales e RIGHT JOIN department_info d ON e.department=d.department;
-- Q2. Department managers and employees.
SELECT d.manager_name,e.employee_name
FROM employee_sales e RIGHT JOIN department_info d ON e.department=d.department;
-- Q3. Department locations and employees.
SELECT d.location,e.employee_name
FROM employee_sales e RIGHT JOIN department_info d ON e.department=d.department;
-- Q4. Department names and employee IDs
SELECT d.department,e.employee_id
FROM employee_sales e RIGHT JOIN department_info d ON e.department=d.department;
-- Q5. Departments and employee salaries.
SELECT d.department,e.salary
FROM employee_sales e RIGHT JOIN department_info d ON e.department=d.department;
