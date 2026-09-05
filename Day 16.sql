-- SUBQUERIES                                                                 
-- Q1. Find employees earning above average salary.
SELECT * FROM employee_sales
WHERE salary>(SELECT AVG(salary) FROM employee_sales);
-- Q2. Find the highest-paid employee.
SELECT * FROM employee_sales
WHERE salary=(SELECT MAX(salary) FROM employee_sales);
-- Q3. Find employees with above-average sales.
SELECT * FROM employee_sales
WHERE sales_amount>(SELECT AVG(sales_amount) FROM employee_sales);
-- Q4. Find the lowest-paid employee.
SELECT * FROM employee_sales
WHERE salary=(SELECT MIN(salary) FROM employee_sales);
-- Q5. Find employees earning above 50000 using a subquery.
SELECT * FROM employee_sales
WHERE salary>(SELECT 50000);

-- Q6.Find employees earning more than the average salary of the IT department.      -- Subqueries using WHERE
SELECT *
FROM employee_sales
WHERE salary > (SELECT AVG(salary)
    FROM employee_sales
    WHERE department = 'IT'
);
-- Q7.Employees earning the highest salary in Sales
SELECT *
FROM employee_sales
WHERE salary = (
    SELECT MAX(salary)
    FROM employee_sales
    WHERE department = 'Sales'
);

-- ----------CORRELATED SUBQUERIES----------
-- Q1. Employees above their department average salary.
SELECT e.*
FROM employee_sales e
WHERE e.salary>(SELECT AVG(x.salary) FROM employee_sales x
 WHERE x.department=e.department
);
-- Q2. Employees above their department average sales.
SELECT e.*
FROM employee_sales e
WHERE e.sales_amount>(
 SELECT AVG(x.sales_amount) FROM employee_sales x
 WHERE x.department=e.department
);
-- Q3. Employees with the highest salary in their department.
SELECT e.*
FROM employee_sales e
WHERE e.salary=(
 SELECT MAX(x.salary) FROM employee_sales x
 WHERE x.department=e.department
);
-- Q4. Employees with the highest sales in their department.
SELECT e.*
FROM employee_sales e
WHERE e.sales_amount=(
 SELECT MAX(x.sales_amount) FROM employee_sales x
 WHERE x.department=e.department
);
-- Q5. Employees above their city average salary.
SELECT e.*
FROM employee_sales e
WHERE e.salary>(
 SELECT AVG(x.salary) FROM employee_sales x
 WHERE x.city=e.city
);

-- Q6.Find employees earning more than their department's average salary
SELECT e.employee_name, e.department, e.salary
FROM employee_sales e
WHERE e.salary > (
    SELECT AVG(e2.salary)
    FROM employee_sales e2
    WHERE e2.department = e.department
);
