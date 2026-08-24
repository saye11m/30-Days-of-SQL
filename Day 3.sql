-- ----------WHERE----------                                              
-- Q1. Find IT employees.
SELECT * FROM employee_sales WHERE department='IT';
-- Q2. Find salaries above 60000.
SELECT * FROM employee_sales WHERE salary>60000;
-- Q3. Find employees from Pune.
SELECT * FROM employee_sales WHERE city='Pune';
-- Q4. Find sales above 90000.
SELECT * FROM employee_sales WHERE sales_amount>90000;
-- Q5. Find employees who joined in 2022.
SELECT * FROM employee_sales WHERE YEAR(joining_date)=2022;

-- ----------LOGICAL AND COMPARISON OPERATORS----------
-- Q1. IT employees with salary above 60000.
SELECT * FROM employee_sales WHERE department='IT' AND salary>60000;
-- Q2. IT or Finance employees.
SELECT * FROM employee_sales WHERE department='IT' OR department='Finance';
-- Q3. Employees not in IT.
SELECT * FROM employee_sales WHERE NOT department='IT';
-- Q4. Pune employees with salary above 50000.
SELECT * FROM employee_sales WHERE city='Pune' AND salary>50000;
-- Q5. Sales employees with sales above 90000 OR salary above 60000.
SELECT * FROM employee_sales WHERE department='Sales' AND (sales_amount>90000 OR salary>60000);
   
   

-- ----------NOT OPERATOR----------
-- Q1. Find employees who are not in the IT department.
SELECT * FROM employee_sales
WHERE NOT department='IT';
-- Q2. Find employees who are not from Pune.
SELECT * FROM employee_sales
WHERE NOT city='Pune';
-- Q3. Find employees whose salary is not greater than 60000.
SELECT * FROM employee_sales
WHERE NOT salary>60000;
-- Q4. Find employees who are not in the Sales department.
SELECT * FROM employee_sales
WHERE NOT department='Sales';
-- Q5. Find employees whose status is not Active.
SELECT * FROM employee_sales
WHERE NOT status='Active';

-- ----------Combine of AND,OR and NOT----------
-- Q1. Find employees who are in IT or Finance and have a salary above 50000.
SELECT * FROM employee_sales
WHERE (department='IT' OR department='Finance') AND salary>50000;
-- Q2. Find employees who are not from Pune and have sales greater than 80000.
SELECT * FROM employee_sales
WHERE NOT city='Pune' AND sales_amount>80000;
-- Q3. Find employees who are in IT, Finance, or Sales and have a salary between 50000 and 70000.
SELECT * FROM employee_sales
WHERE department IN ('IT','Finance','Sales') AND salary BETWEEN 50000 AND 70000;
-- Q4. Find employees who are not in IT or HR and have either sales above 90000 or salary above 60000.
SELECT * FROM employee_sales
WHERE department NOT IN ('IT','HR') AND (sales_amount>90000 OR salary>60000);
-- Q5. Find employees who are from Pune or Mumbai, but are not in the Operations department,and have sales above 75000.
SELECT *FROM employee_sales
WHERE city IN ('Pune','Mumbai')
AND NOT department='Operations' AND sales_amount>75000;
