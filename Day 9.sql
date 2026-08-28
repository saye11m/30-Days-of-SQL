-- ----------STRING FUNCTIONS----------                  

-- ----------CONCAT----------
-- Q1. Combine name and department.
SELECT CONCAT(employee_name,' - ',department) FROM employee_sales;
-- Q2. Combine name and email.
SELECT CONCAT(employee_name,' <',email,'>') FROM employee_sales;
-- Q3. Combine city and department.
SELECT CONCAT(city,' - ',department) FROM employee_sales;
-- Q4. Create employee code.
SELECT CONCAT('EMP-',employee_id) FROM employee_sales;
-- Q5. Create a simple description.
SELECT CONCAT(employee_name,' works as ',job_title) FROM employee_sales;

-- ----------UPPER / LOWER----------
-- Q1. Names in uppercase.
SELECT UPPER(employee_name) FROM employee_sales;
-- Q2. Names in lowercase.
SELECT LOWER(employee_name) FROM employee_sales;
-- Q3. Departments in uppercase.
SELECT UPPER(department) FROM employee_sales;
-- Q4. Job titles in lowercase.
SELECT LOWER(job_title) FROM employee_sales;
-- Q5. Emails in uppercase.
SELECT UPPER(email) FROM employee_sales;
-- Q6.Convert name and email to lowercase
SELECT LOWER(employee_name) AS employee_name,
       LOWER(email) AS email
FROM employee_sales;
-- Q7.Display uppercase names only for employees earning more than 50000
SELECT UPPER(employee_name) AS employee_name,
       salary
FROM employee_sales
WHERE salary > 50000;

-- ----------LENGTH----------
-- Q1. Name length.
SELECT employee_name,LENGTH(employee_name) FROM employee_sales;
-- Q2. Email length.
SELECT email,LENGTH(email) FROM employee_sales;
-- Q3. Names longer than 10 characters.
SELECT * FROM employee_sales WHERE LENGTH(employee_name)>10;
-- Q4. Department name length.
SELECT department,LENGTH(department) FROM employee_sales;
-- Q5. Longest employee name.
SELECT employee_name,LENGTH(employee_name) AS name_length
FROM employee_sales 
ORDER BY name_length DESC LIMIT 1;
-- Q6.Find employees whose email has more than 20 characters
SELECT employee_name, email, LENGTH(email) AS email_length
FROM employee_sales
WHERE LENGTH(email) > 20;
-- Q7.Find the department with the longest name
SELECT department, LENGTH(department) AS department_length
FROM employee_sales
ORDER BY department_length DESC
LIMIT 1;

-- ----------TRIM----------
-- Q1. Trim a text value.
SELECT TRIM('   SQL Analyst   ');
-- Q2. Trim names.
SELECT TRIM(employee_name) FROM employee_sales;
-- Q3. Trim job titles.
SELECT TRIM(job_title) FROM employee_sales;
-- Q4. Trim departments.
SELECT TRIM(department) FROM employee_sales;
-- Q5. Show trimmed name lengths.
SELECT employee_name,LENGTH(TRIM(employee_name)) FROM employee_sales;
