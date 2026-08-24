-- ----------ORDER BY----------                                                                  
-- Q1. Sort salary low to high.
SELECT * FROM employee_sales ORDER BY salary;
-- Q2. Sort salary high to low.
SELECT * FROM employee_sales ORDER BY salary DESC;
-- Q3. Sort names alphabetically.
SELECT * FROM employee_sales ORDER BY employee_name;
-- Q4. Sort sales high to low.
SELECT * FROM employee_sales ORDER BY sales_amount DESC;
-- Q5. Sort by department and salary.
SELECT * FROM employee_sales ORDER BY department,salary DESC;

-- ----------LIMIT----------
-- Q1. Show first 5 employees.
SELECT * FROM employee_sales LIMIT 5;
-- Q2. Show top 3 salaries.
SELECT * FROM employee_sales ORDER BY salary DESC LIMIT 3;
-- Q3. Show top 2 sales.
SELECT * FROM employee_sales ORDER BY sales_amount DESC LIMIT 2;
-- Q4. Show first 10 Pune employees.
SELECT * FROM employee_sales WHERE city='Pune' LIMIT 10;
-- Q5. Show the highest-paid employee.
SELECT * FROM employee_sales ORDER BY salary DESC LIMIT 1;

-- ----------INSERT / UPDATE / DELETE / TRUNCATE----------
-- Q1. Insert a temporary employee.
INSERT INTO employee_sales VALUES
(999,'Chandu verma','IT','Intern',105,'Pune',30000,20000,'2026-01-01','Chandu.Verma@gmail.com','Active',1000);
SELECT * FROM employee_sales;
-- Q2. Update the temporary employee salary.
UPDATE employee_sales SET salary=32000 WHERE employee_id=999;
-- Q3. Delete the temporary employee.
DELETE FROM employee_sales WHERE employee_id=999;
-- Q4. Create a small table and truncate it.
CREATE TABLE truncate_demo AS SELECT * FROM employee_sales WHERE 1=0;
INSERT INTO truncate_demo SELECT * FROM employee_sales LIMIT 3;
TRUNCATE TABLE truncate_demo;
-- Q5. Confirm it is empty.
SELECT * FROM truncate_demo;
