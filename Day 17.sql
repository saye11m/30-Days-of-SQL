-- CTE                                       --- DAY 17 ---
-- Q1. Display employees with salary above 50000 using a CTE.
WITH high_salary AS (
 SELECT * FROM employee_sales WHERE salary>50000
)
SELECT * FROM high_salary;
-- Q2. Display IT employees using a CTE.
WITH it_employees AS (
 SELECT * FROM employee_sales WHERE department='IT'
)
SELECT * FROM it_employees;
-- Q3. Display employees with sales above 90000.
WITH high_sales AS (
 SELECT employee_name,sales_amount FROM employee_sales WHERE sales_amount>90000
)
SELECT * FROM high_sales;
-- Q4. Calculate average salary using a CTE.
WITH salary_data AS (
 SELECT AVG(salary) AS avg_salary FROM employee_sales
)
SELECT * FROM salary_data;
-- Q5. Find employees above average salary using a CTE.
WITH salary_data AS (
 SELECT AVG(salary) AS avg_salary FROM employee_sales
)
SELECT e.* FROM employee_sales e CROSS JOIN salary_data s
WHERE e.salary>s.avg_salary;

-- MULTIPLE CTEs
-- Q1. Create IT and Finance CTEs and combine them.
WITH IT AS (
 SELECT * FROM employee_sales WHERE department='IT'
),
finance AS (
 SELECT * FROM employee_sales WHERE department='Finance'
)
SELECT employee_id,employee_name FROM IT    
UNION ALL
SELECT employee_id,employee_name FROM finance;
-- Q2. Create high-salary and high-sales CTEs.
WITH high_salary AS (
 SELECT employee_id,employee_name FROM employee_sales WHERE salary>60000
),
high_sales AS (
 SELECT employee_id,employee_name FROM employee_sales WHERE sales_amount>90000
)
SELECT * FROM high_salary
UNION
SELECT * FROM high_sales;
-- Q3. Create employee-count and salary-summary CTEs.
WITH dept_count AS (
 SELECT department,COUNT(*) AS emp_count FROM employee_sales GROUP BY department
),
dept_salary AS (
 SELECT department,AVG(salary) AS avg_salary FROM employee_sales GROUP BY department
)
SELECT c.department,c.emp_count,s.avg_salary
FROM dept_count c JOIN dept_salary s ON c.department=s.department;
-- Q4. Create sales and salary summaries.
WITH sales AS (
 SELECT department,SUM(sales_amount) AS total_sales FROM employee_sales GROUP BY department
),
salary AS (
 SELECT department,AVG(salary) AS avg_salary FROM employee_sales GROUP BY department
)
SELECT s.department,s.total_sales,a.avg_salary
FROM sales s JOIN salary a ON s.department=a.department;
-- Q5. Create a simple employee CTE and show managers.
WITH employees AS (
 SELECT employee_id,employee_name,manager_id FROM employee_sales
)
SELECT e.employee_name,m.employee_name AS manager
FROM employees e LEFT JOIN employee_sales m ON e.manager_id=m.employee_id;

-- RECURSIVE CTE
-- Q1. Generate numbers from 1 to 10.
WITH RECURSIVE numbers AS (
 SELECT 1 AS num
 UNION ALL
 SELECT num+1 FROM numbers WHERE num<10
)
SELECT * FROM numbers;
-- Q2. Generate numbers from 1 to 20.
WITH RECURSIVE numbers AS (
 SELECT 1 AS num
 UNION ALL
 SELECT num+1 FROM numbers WHERE num<20
)
SELECT * FROM numbers;
-- Q3. Generate even numbers from 2 to 20.
WITH RECURSIVE even_numbers AS (
 SELECT 2 AS num
 UNION ALL
 SELECT num+2 FROM even_numbers WHERE num<20
)
SELECT * FROM even_numbers;
-- Q4. Generate years from 2020 to 2026.
WITH RECURSIVE years AS (
 SELECT 2020 AS yr
 UNION ALL
 SELECT yr+1 FROM years WHERE yr<2026
)
SELECT * FROM years;
-- Q5. Generate numbers 1 to 5 and their squares.
WITH RECURSIVE numbers AS (
 SELECT 1 AS num
 UNION ALL
 SELECT num+1 FROM numbers WHERE num<5
)
SELECT num,num*num AS square FROM numbers;
