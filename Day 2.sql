-- ----------SELECT----------                                                          
-- Q1. Display all employees.
SELECT * FROM employee_sales;
-- Q2. Display employee names and departments.
SELECT employee_name, department FROM employee_sales;
-- Q3. Display names and salaries.
SELECT employee_name, salary FROM employee_sales;
-- Q4. Display employee IDs and job titles.
SELECT employee_id, job_title FROM employee_sales;
-- Q5. Display names, cities and sales.
SELECT employee_name, city, sales_amount FROM employee_sales;

-- ----------Aliases----------
 -- Q1. Display employee names with a readable column name
SELECT employee_name AS Employee_Name
FROM employee_sales;
 -- Q2. Display employee names and salaries with custom column names
SELECT employee_name AS Employee_Name,
       salary AS Monthly_Salary
FROM employee_sales;
 -- Q3. Display employee ID and job title with aliases
SELECT employee_id AS Employee_ID,
       job_title AS Job_Title
FROM employee_sales;
 -- Q4. Display employee name, department and city with readable aliases
SELECT employee_name AS Employee_Name,
       department AS Department_Name,
       city AS Work_Location
FROM employee_sales;
-- Q5. Display employee name and sales amount with business-friendly aliases
SELECT employee_name AS Employee_Name,
       sales_amount AS Total_Sales
FROM employee_sales;

-- ----------DISTINCT----------  
-- Q1. Unique departments.
SELECT DISTINCT department FROM employee_sales;
-- Q2. Unique cities.
SELECT DISTINCT city FROM employee_sales;
-- Q3. Unique job titles.
SELECT DISTINCT job_title FROM employee_sales;
-- Q4. Unique statuses.
SELECT DISTINCT status FROM employee_sales;
-- Q5. Unique department-city combinations.
SELECT DISTINCT department,city FROM employee_sales;
