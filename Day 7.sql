-- ----------HAVING----------                                                                               
SELECT department,COUNT(*) AS Count FROM employee_sales 
GROUP BY department HAVING COUNT(*)>10;
-- Q2. Departments with average salary above 55000.
SELECT department,AVG(salary) FROM employee_sales 
GROUP BY department HAVING AVG(salary)>55000;
-- Q3. Departments with total sales above 800000.
SELECT department,SUM(sales_amount)  AS Total FROM employee_sales
GROUP BY department HAVING SUM(sales_amount)>800000;
-- Q4. Cities with more than 10 employees.
SELECT city,COUNT(*) FROM employee_sales 
GROUP BY city HAVING COUNT(*)>10;
-- Q5. Departments whose maximum salary is above 70000.
SELECT department,MAX(salary) FROM employee_sales 
GROUP BY department HAVING MAX(salary)>70000;

-- ----------CASE----------
-- Q1. Label salary High or Low.
SELECT employee_name,salary,
CASE WHEN salary>=60000 THEN 'High' ELSE 'Low' END AS salary_level
FROM employee_sales;
-- Q2. Label sales Good or Needs Improvement.
SELECT employee_name,sales_amount,
CASE WHEN sales_amount>=90000 THEN 'Good' ELSE 'Needs Improvement' END AS sales_level
FROM employee_sales;
-- Q3. Label salary High, Medium or Low.
SELECT employee_name,salary,
CASE WHEN salary>=70000 THEN 'High'
     WHEN salary>=50000 THEN 'Medium'
     ELSE 'Low' END AS salary_level
FROM employee_sales;
-- Q4. Label bonus size.
SELECT employee_name,bonus,
CASE WHEN bonus>=6000 THEN 'Large'
     WHEN bonus>=4000 THEN 'Medium'
     ELSE 'Small' END AS bonus_level
FROM employee_sales;
-- Q5. Label Pune employees.
SELECT employee_name,city,
CASE WHEN city='Pune' THEN 'Pune Employee' ELSE 'Other City' 
END AS city_group
FROM employee_sales;
