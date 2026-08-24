-- ----------BETWEEN----------                                                          -----     DAY 4   -----
-- Q1. Salaries between 50000 and 60000.
SELECT * FROM employee_sales WHERE salary BETWEEN 50000 AND 60000;
-- Q2. Sales between 80000 and 100000.
SELECT * FROM employee_sales WHERE sales_amount BETWEEN 80000 AND 100000;
-- Q3. Employees who joined in 2022.
SELECT * FROM employee_sales WHERE joining_date BETWEEN '2022-01-01' AND '2022-12-31';
-- Q4. Bonuses between 3000 and 5000.
SELECT * FROM employee_sales WHERE bonus BETWEEN 3000 AND 5000;
-- Q5. Employee IDs between 120 and 130.
SELECT * FROM employee_sales WHERE employee_id BETWEEN 120 AND 130;

--  ----------NOT IN----------
-- Q1. HR wants a list of employees who are not working in the departments that are currently involved in the technology transformation project.
SELECT employee_id, employee_name, department
FROM employee_sales
WHERE department NOT IN ('IT', 'Operations', 'Finance');
-- Q2. Management wants to identify employees who are not located in the company's three major office locations.
SELECT employee_id, employee_name, city
FROM employee_sales
WHERE city NOT IN ('Pune', 'Mumbai', 'Delhi');
-- Q3. HR wants to identify employees who are not in senior-level job roles and have a salary above 60000.
SELECT employee_id, employee_name, job_title, salary
FROM employee_sales
WHERE job_title NOT IN ('Manager', 'Senior Analyst', 'Senior Developer')
AND salary > 60000;
-- Q4. The Sales team wants to analyze high-performing employees while excluding departments that are handled separately.
SELECT employee_id, employee_name, department, sales_amount
FROM employee_sales
WHERE department NOT IN ('Finance', 'HR', 'Operations')
AND sales_amount > 80000;
-- Q5. Management wants to find active employees who are not assigned to either Sales or Marketing and have generated significant sales.
SELECT employee_id, employee_name, department, status, sales_amount
FROM employee_sales
WHERE department NOT IN ('Sales', 'Marketing') AND status = 'Active' AND sales_amount > 75000;

-- ----------LIKE/ WILDCARDS----------
-- Q1.  Find the employees whose names starting with A.
SELECT * FROM employee_sales WHERE employee_name LIKE 'A%';
-- Q2. Find the employees whose names ending with a.
SELECT * FROM employee_sales WHERE employee_name LIKE '%a';
-- Q3. Find the employees whose names containing 'an'.
SELECT * FROM employee_sales WHERE employee_name LIKE '%an%';
-- Q4. Emails containing gmail.
SELECT * FROM employee_sales WHERE email LIKE '%gmail%';
-- Q5. Job titles containing Analyst.
SELECT * FROM employee_sales WHERE job_title LIKE '%Analyst%';
-- Q6. Exactly one character after A
SELECT * FROM employee_sales
WHERE employee_name LIKE 'A__';
 -- Q7. Names where the second character is 'a'
SELECT * FROM employee_sales
WHERE employee_name LIKE '_a%'; 
