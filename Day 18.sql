-- ---------WINDOW FUNCTIONS---------                      
-- RANK
-- Q1. Rank employees by salary.
SELECT employee_name,salary,RANK() OVER(ORDER BY salary DESC) AS salary_rank
FROM employee_sales;
-- Q2. Rank employees inside each department.
SELECT employee_name,department,salary,
RANK() OVER(PARTITION BY department ORDER BY salary DESC) AS dept_rank
FROM employee_sales;
-- Q3. Rank employees by sales inside department.
SELECT employee_name,department,sales_amount,
RANK() OVER(PARTITION BY department ORDER BY sales_amount DESC) AS sales_rank
FROM employee_sales;
-- Q4. Find the highest-ranked employees.
WITH ranked AS (
 SELECT employee_name,salary,RANK() OVER(ORDER BY salary DESC) AS rnk
 FROM employee_sales
)
SELECT * FROM ranked WHERE rnk=1;
-- Q5. Use RANK with a frame clause.
SELECT employee_name,department,salary,
RANK() OVER(
 PARTITION BY department ORDER BY salary DESC
 ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
) AS dept_rank
FROM employee_sales;

-- DENSE_RANK
-- Q1. Dense-rank salaries.
SELECT employee_name,salary,DENSE_RANK() OVER(ORDER BY salary DESC) AS rnk
FROM employee_sales;
-- Q2. Dense-rank salaries inside department.
SELECT employee_name,department,salary,
DENSE_RANK() OVER(PARTITION BY department ORDER BY salary DESC) AS rnk
FROM employee_sales;
-- Q3. Dense-rank sales.
SELECT employee_name,sales_amount,
DENSE_RANK() OVER(ORDER BY sales_amount DESC) AS rnk
FROM employee_sales;
-- Q4. Dense-rank joining dates.
SELECT employee_name,joining_date,
DENSE_RANK() OVER(ORDER BY joining_date) AS rnk
FROM employee_sales;
-- Q5. Use DENSE_RANK with a frame clause.
SELECT employee_name,department,sales_amount,
DENSE_RANK() OVER(
 PARTITION BY department ORDER BY sales_amount DESC
 ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
) AS rnk
FROM employee_sales;

-- ROW_NUMBER
-- Q1. Give every employee a row number by salary.
SELECT employee_name,salary,
ROW_NUMBER() OVER(ORDER BY salary DESC) AS row_num
FROM employee_sales;
-- Q2. Give row numbers separately inside each department.
SELECT employee_name,department,salary,
ROW_NUMBER() OVER(PARTITION BY department ORDER BY salary DESC) AS row_num
FROM employee_sales;
-- Q3. Give row numbers by sales within each department.
SELECT employee_name,department,sales_amount,
ROW_NUMBER() OVER(PARTITION BY department ORDER BY sales_amount DESC) AS row_num
FROM employee_sales;
-- Q4. Give row numbers by joining date within each department.
SELECT employee_name,department,joining_date,
ROW_NUMBER() OVER(PARTITION BY department ORDER BY joining_date) AS row_num
FROM employee_sales;
-- Q5. Use ROW_NUMBER with a frame clause.
SELECT employee_name,department,salary,
ROW_NUMBER() OVER(
 PARTITION BY department ORDER BY salary DESC
 ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
) AS row_num
FROM employee_sales;

-- LEAD
-- Q1. Show next salary.
SELECT employee_name,salary,
LEAD(salary) OVER(ORDER BY employee_id) AS next_salary
FROM employee_sales;
-- Q2. Show next sales.
SELECT employee_name,sales_amount,
LEAD(sales_amount) OVER(ORDER BY employee_id) AS next_sales
FROM employee_sales;
-- Q3. Show next salary within department.
SELECT employee_name,department,salary,
LEAD(salary) OVER(PARTITION BY department ORDER BY salary) AS next_salary
FROM employee_sales;
-- Q4. Compare current sales with next sales.
SELECT employee_name,sales_amount,
LEAD(sales_amount) OVER(ORDER BY employee_id)-sales_amount AS difference
FROM employee_sales;
-- Q5. Use LEAD with a frame clause.
SELECT employee_name,department,sales_amount,
LEAD(sales_amount) OVER(
 PARTITION BY department ORDER BY employee_id
 ROWS BETWEEN CURRENT ROW AND 1 FOLLOWING
) AS next_sales
FROM employee_sales;

-- ---------LAG----------
-- Q1. Show previous salary.
SELECT employee_name,salary,
LAG(salary) OVER(ORDER BY employee_id) AS previous_salary
FROM employee_sales;
-- Q2. Show previous sales.
SELECT employee_name,sales_amount,
LAG(sales_amount) OVER(ORDER BY employee_id) AS previous_sales
FROM employee_sales;
-- Q3. Show previous salary within department.
SELECT employee_name,department,salary,
LAG(salary) OVER(PARTITION BY department ORDER BY salary) AS previous_salary
FROM employee_sales;
-- Q4. Compare current salary with previous salary.
SELECT employee_name,salary,
salary-LAG(salary) OVER(ORDER BY employee_id) AS salary_difference
FROM employee_sales;
-- Q5. Use LAG with a frame clause.
SELECT employee_name,department,sales_amount,
LAG(sales_amount) OVER(
 PARTITION BY department ORDER BY employee_id
 ROWS BETWEEN 1 PRECEDING AND CURRENT ROW
) AS previous_sales
FROM employee_sales;
