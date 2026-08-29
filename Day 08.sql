-- ----------COALESCE----------                                    -- DAY 8 --
-- Q1. Replace NULL bonus with 0.
SELECT employee_name,COALESCE(bonus,0) AS bonus FROM employee_sales;
-- Q2. Add salary and bonus safely.
SELECT employee_name,salary+COALESCE(bonus,0) AS total_pay FROM employee_sales;
-- Q3. Replace NULL manager ID with 0.
SELECT employee_name,COALESCE(manager_id,0) AS manager_id FROM employee_sales;
-- Q4.Use multiple columns with COALESCE
SELECT employee_name,
    COALESCE(city, department, 'Unknown') AS available_information
FROM employee_sales;
-- Q5. Show bonus with a default text.
SELECT employee_name,COALESCE(CAST(bonus AS CHAR),'No Bonus') AS bonus FROM employee_sales;
-- 	Q6. Show employee city, replacing NULL with "Not Provided"
SELECT employee_name,COALESCE(city, 'Not Provided') AS employee_city
FROM employee_sales;
-- Q7. Calculate total bonus by department
SELECT
    department,SUM(COALESCE(bonus, 0)) AS total_bonus
FROM employee_sales
GROUP BY department;

-- IFNULL
-- Q1. Replace NULL bonus with 0.
SELECT employee_name,IFNULL(bonus,0) FROM employee_sales;
-- Q2. Replace NULL manager ID with 0.
SELECT employee_name,IFNULL(manager_id,0) FROM employee_sales;
-- Q3. Calculate total pay.
SELECT employee_name,salary+IFNULL(bonus,0) AS total_pay FROM employee_sales;
-- Q4. Find employees whose bonus is NULL.
SELECT * FROM employee_sales WHERE IFNULL(bonus,0)=0;
-- Q5. Display manager ID with 999 as default.
SELECT employee_name,IFNULL(manager_id,999) FROM employee_sales;
-- Q6.Replace missing cities
SELECT
    employee_name,
    IFNULL(city, 'Not Provided') AS city
FROM employee_sales;

-- NULLIF
-- Q1. Return NULL if salary is 0.
SELECT employee_name,NULLIF(salary,0) FROM employee_sales;
-- Q2. Return NULL if sales are 0.
SELECT employee_name,NULLIF(sales_amount,0) FROM employee_sales;
-- Q3. Return NULL if bonus is 0.
SELECT employee_name,NULLIF(bonus,0) FROM employee_sales;
-- Q4. Return NULL when salary equals 50000.
SELECT employee_name,NULLIF(salary,50000) FROM employee_sales;
-- Q5. Return NULL for Pune.
SELECT employee_name,NULLIF(city,'Pune') FROM employee_sales;
