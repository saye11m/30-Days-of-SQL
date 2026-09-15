-- ----------INDEXES----------                               
-- Q1. Create an index on department.
CREATE INDEX idx_department ON employee_sales(department);

-- Q2. Create an index on city.
CREATE INDEX idx_city ON employee_sales(city);

-- Q3. Create an index on salary.
CREATE INDEX idx_salary ON employee_sales(salary);

-- Q4. Create a combined index.
CREATE INDEX idx_department_salary ON employee_sales(department,salary);

DROP INDEX idx_department_salary ON employee_sales;

-- Q5. Display indexes.
SHOW INDEX FROM employee_sales;

-- Q6. Create an index on job title
CREATE INDEX idx_employee_job_title
ON employee_sales(job_title);
           
SELECT *
FROM employee_sales
WHERE job_title = 'Data Analyst';

-- Q7. Create a UNIQUE index on email
CREATE UNIQUE INDEX idx_unique_email
ON employee_sales(email);


SHOW INDEX FROM employee_sales;

-- Q8. Create an index on joining date
CREATE INDEX idx_joining_date
ON employee_sales(joining_date);

SELECT *
FROM employee_sales
WHERE joining_date > '2025-01-01';
    -- TO DROP INDEX
DROP INDEX idx_joining_date ON employee_sales;
DROP INDEX idx_employee_job_title ON employee_sales;

-- Q9. Create a composite index on department and job title
CREATE INDEX idx_department_job
ON employee_sales(department, job_title);

SELECT *
FROM employee_sales
WHERE department = 'IT'
  AND job_title = 'Manager';

-- Q10. Drop an existing index

DROP INDEX idx_joining_date ON employee_sales;


SHOW INDEX FROM employee_sales
