-- SET OPERATORS                                        

-- UNION
-- Q1. Combine Pune and Mumbai employee names.
SELECT employee_name FROM employee_sales WHERE city='Pune'
UNION
SELECT employee_name FROM employee_sales WHERE city='Mumbai';
-- Q2. Combine IT and Finance employee IDs.
SELECT employee_id FROM employee_sales WHERE department='IT'
UNION
SELECT employee_id FROM employee_sales WHERE department='Finance';
-- Q3. Combine high-salary and high-sales IDs.
SELECT employee_id FROM employee_sales WHERE salary>60000
UNION
SELECT employee_id FROM employee_sales WHERE sales_amount>100000;
-- Q4. Combine employees from 2021 and 2022.
SELECT employee_id FROM employee_sales WHERE YEAR(joining_date)=2021
UNION
SELECT employee_id FROM employee_sales WHERE YEAR(joining_date)=2022;
-- Q5. Combine Pune and Delhi city values.
SELECT city FROM employee_sales WHERE city='Pune'
UNION
SELECT city FROM employee_sales WHERE city='Delhi';

-- UNION ALL
-- Q1. Combine Pune and Mumbai names.
SELECT employee_name FROM employee_sales WHERE city='Pune'
UNION ALL
SELECT employee_name FROM employee_sales WHERE city='Mumbai';
-- Q2. Combine IT and Finance IDs.
SELECT employee_id FROM employee_sales WHERE department='IT'
UNION ALL
SELECT employee_id FROM employee_sales WHERE department='Finance';
-- Q3. Combine high-salary and high-sales IDs.
SELECT employee_id FROM employee_sales WHERE salary>60000
UNION ALL
SELECT employee_id FROM employee_sales WHERE sales_amount>100000;
-- Q4. Combine 2021 and 2022 IDs.
SELECT employee_id FROM employee_sales WHERE YEAR(joining_date)=2021
UNION ALL
SELECT employee_id FROM employee_sales WHERE YEAR(joining_date)=2022;
-- Q5. Combine Pune and Delhi names.
SELECT employee_name FROM employee_sales WHERE city='Pune'
UNION ALL
SELECT employee_name FROM employee_sales WHERE city='Delhi';

-- INTERSECT 
-- Q1. Find employees who are in Pune AND salary above 60000.
SELECT employee_id FROM employee_sales WHERE city='Pune'
INTERSECT
SELECT employee_id FROM employee_sales WHERE salary>60000;
-- Q2. Find IT employees with sales above 90000.
SELECT employee_id FROM employee_sales WHERE department='IT'
INTERSECT
SELECT employee_id FROM employee_sales WHERE sales_amount>90000;
-- Q3. Find 2021 joiners with salary above 50000.
SELECT employee_id FROM employee_sales WHERE YEAR(joining_date)=2021
INTERSECT
SELECT employee_id FROM employee_sales WHERE salary>50000;
-- Q4. Find Mumbai employees in Sales.
SELECT employee_id FROM employee_sales WHERE city='Mumbai'
INTERSECT
SELECT employee_id FROM employee_sales WHERE department='Sales';
-- Q5. Find employees with bonus above 5000 and salary above 60000.
SELECT employee_id,employee_name FROM employee_sales WHERE bonus>5000
INTERSECT
SELECT employee_id,employee_name FROM employee_sales WHERE salary>60000;

-- EXCEPT 
-- Q1. Find employees who are not in IT.
SELECT employee_id FROM employee_sales
EXCEPT
SELECT employee_id FROM employee_sales WHERE department='IT';
-- Q2. Find employees not from Pune.
SELECT employee_id,city FROM employee_sales
EXCEPT
SELECT employee_id,city FROM employee_sales WHERE city='Pune';
-- Q3. Find employees not earning above 60000.
SELECT employee_id FROM employee_sales
EXCEPT
SELECT employee_id FROM employee_sales WHERE salary>60000;
-- Q4. Find employees who did not join in 2022.
SELECT employee_id,employee_name FROM employee_sales
EXCEPT
SELECT employee_id,employee_name FROM employee_sales WHERE YEAR(joining_date)=2022;
-- Q5. Find employees without a bonus.
SELECT employee_id FROM employee_sales
EXCEPT
SELECT employee_id FROM employee_sales WHERE bonus IS NOT NULL;
