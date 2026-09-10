-- FIRST_VALUE                                            
-- Q1. Show the highest salary.
SELECT employee_name,salary,
FIRST_VALUE(salary) OVER(ORDER BY salary DESC) AS highest_salary
FROM employee_sales;
-- Q2. Show highest salary in each department.
SELECT employee_name,department,salary,
FIRST_VALUE(salary) OVER(PARTITION BY department ORDER BY salary DESC) AS highest_salary
FROM employee_sales;
-- Q3. Show earliest joining date in each department.
SELECT employee_name,department,joining_date,
FIRST_VALUE(joining_date) OVER(PARTITION BY department ORDER BY joining_date) AS first_date
FROM employee_sales;
-- Q4. Compare each salary with department's highest salary.
SELECT employee_name,department,salary,
salary-FIRST_VALUE(salary) OVER(PARTITION BY department ORDER BY salary DESC) AS difference
FROM employee_sales;
-- Q5. Use FIRST_VALUE with a full frame.
SELECT employee_name,department,sales_amount,
FIRST_VALUE(sales_amount) OVER(
 PARTITION BY department ORDER BY sales_amount DESC
 ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
) AS highest_sales
FROM employee_sales;

-- LAST_VALUE
-- Q1. Show the lowest salary.
SELECT employee_name,salary,
LAST_VALUE(salary) OVER(
 ORDER BY salary
 ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
) AS lowest_salary
FROM employee_sales;
-- Q2. Show lowest salary in each department.
SELECT employee_name,department,salary,
LAST_VALUE(salary) OVER(
 PARTITION BY department ORDER BY salary
 ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
) AS lowest_salary
FROM employee_sales;
-- Q3. Show latest joining date in each department.
SELECT employee_name,department,joining_date,
LAST_VALUE(joining_date) OVER(
 PARTITION BY department ORDER BY joining_date
 ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
) AS latest_date
FROM employee_sales;
-- Q4. Compare salary with department's lowest salary.
SELECT employee_name,department,salary,
salary-LAST_VALUE(salary) OVER(
 PARTITION BY department ORDER BY salary
 ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
) AS difference
FROM employee_sales;
-- Q5. Show last/lowest sales in each department.
SELECT employee_name,department,sales_amount,
LAST_VALUE(sales_amount) OVER(
 PARTITION BY department ORDER BY sales_amount
 ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
) AS lowest_sales
FROM employee_sales;
  

-- PERCENT_RANK
-- Q1. Calculate salary percent rank.
SELECT employee_name,salary,PERCENT_RANK() OVER(ORDER BY salary) AS p_rank
FROM employee_sales;
-- Q2. Calculate percent rank within department.
SELECT employee_name,department,salary,
PERCENT_RANK() OVER(PARTITION BY department ORDER BY salary) AS p_rank
FROM employee_sales;
-- Q3. Calculate sales percent rank.
SELECT employee_name,sales_amount,PERCENT_RANK() OVER(ORDER BY sales_amount) AS p_rank
FROM employee_sales;
-- Q4. Find employees near the top by salary.
WITH r AS (
 SELECT employee_name,salary,PERCENT_RANK() OVER(ORDER BY salary DESC) AS p
 FROM employee_sales
)
SELECT * FROM r WHERE p<=0.20;
-- Q5. Use PERCENT_RANK with a frame clause.
SELECT employee_name,department,salary,
PERCENT_RANK() OVER(
 PARTITION BY department ORDER BY salary
 ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
) AS p_rank
FROM employee_sales;

-- NTILE
-- Q1. Divide employees into 4 salary groups.
SELECT employee_name,salary,NTILE(4) OVER(ORDER BY salary DESC) AS group_no
FROM employee_sales;
-- Q2. Divide each department into 2 salary groups.
SELECT employee_name,department,salary,
NTILE(2) OVER(PARTITION BY department ORDER BY salary DESC) AS group_no
FROM employee_sales;
-- Q3. Divide employees into 5 sales groups.
SELECT employee_name,sales_amount,NTILE(5) OVER(ORDER BY sales_amount DESC) AS group_no
FROM employee_sales;
-- Q4. Divide employees into 3 joining-date groups.
SELECT employee_name,joining_date,NTILE(3) OVER(ORDER BY joining_date) AS group_no
FROM employee_sales;
-- Q5. Divide each department into 4 groups.
SELECT employee_name,department,salary,
NTILE(4) OVER(PARTITION BY department ORDER BY salary DESC) AS group_no
FROM employee_sales;
