-- ----------SUBSTRING----------                                                
-- SYNTAX : SUBSTRING(column_name, starting_position, number_of_characters)
-- Q1. First 3 characters of name.
SELECT employee_name,SUBSTRING(employee_name,1,3) FROM employee_sales;
-- Q2. First 5 characters of job title.
SELECT job_title,SUBSTRING(job_title,1,5) FROM employee_sales;
-- Q3. First 4 characters of department.
SELECT department,SUBSTRING(department,1,4) FROM employee_sales;
-- Q4. First 5 characters of email.
SELECT email,SUBSTRING(email,1,5) FROM employee_sales;
-- Q5. First 2 characters of name.
SELECT employee_name,SUBSTRING(employee_name,1,2) FROM employee_sales;
--  Q7.Display trimmed names in lowercase
SELECT LOWER(TRIM(employee_name)) AS employee_name
FROM employee_sales;

-- LEFT / RIGHT
-- Q1. First 3 characters of names.
SELECT employee_name,LEFT(employee_name,3) FROM employee_sales;
-- Q2. Last 3 characters of names.
SELECT employee_name,RIGHT(employee_name,3) FROM employee_sales;
-- Q3. First 2 characters of city.
SELECT city,LEFT(city,2) FROM employee_sales;
-- Q4. Last 4 characters of email.
SELECT email,RIGHT(email,4) FROM employee_sales;
-- Q5. First 4 characters of job title.
SELECT job_title,LEFT(job_title,4) FROM employee_sales;

-- REPLACE
-- Q1. Replace gmail in email.
SELECT REPLACE(email,'gmail','companymail') FROM employee_sales;
-- Q2. Replace Pune with PUNE.
SELECT REPLACE(city,'Pune','PUNE') FROM employee_sales;
-- Q3. Replace spaces in names.
SELECT REPLACE(employee_name,' ','_') FROM employee_sales;
-- Q4. Replace Executive with Exec.
SELECT REPLACE(job_title,'Executive','Exec') FROM employee_sales;
-- Q5. Replace IT with Technology.
SELECT REPLACE(department,'IT','Technology') FROM employee_sales;

-- LOCATE
-- Q1. Find @ in email.
SELECT email,LOCATE('@',email) FROM employee_sales;
-- Q2. Find 'a' in names.
SELECT employee_name,LOCATE('a',employee_name) FROM employee_sales;
-- Q3. Find Analyst in job titles.
SELECT job_title,LOCATE('Analyst',job_title) FROM employee_sales;
-- Q4. Find emails containing @.
SELECT * FROM employee_sales WHERE LOCATE('@',email)>0;
-- Q5. Find names containing a.
SELECT * FROM employee_sales WHERE LOCATE('a',employee_name)>0;
