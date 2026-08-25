-- ----------PRIMARY KEY / FOREIGN KEY----------                                                              
-- Q1. Display the primary-key column.
SELECT employee_id FROM employee_sales;

-- Q2. Find employee 101 in which 101 is the primary key.
SELECT * FROM employee_sales WHERE employee_id=101;

-- Q3. Create a department table with a primary key.
CREATE TABLE departments (
 department_id INT PRIMARY KEY,
 department_name VARCHAR(30)
);

-- Q4. Insert departments.
INSERT INTO departments VALUES
(1,'IT'),
(2,'HR'),
(3,'Finance'),
(4,'Sales'),
(5,'Marketing'),
(6,'Operations');

-- Q5. Create a table with a foreign key to employee_sales.
CREATE TABLE employee_department (
 employee_id INT,
 department_id INT,
 FOREIGN KEY(employee_id) REFERENCES employee_sales(employee_id),
 FOREIGN KEY(department_id) REFERENCES departments(department_id)
);
-- Q6. Now tried to insert a duplicate Primary Key
INSERT INTO employee_sales (employee_id, employee_name, department, salary)
VALUES (101, 'Rahul', 'IT', 50000);
-- Q7. Insert a record using a valid Foreign Key
INSERT INTO employee_projects
(project_id, project_name, employee_id)
VALUES (1, 'Sales Dashboard', 101);
-- Q8. Try inserting an invalid Foreign Key
INSERT INTO employee_projects
(project_id, project_name, employee_id)
VALUES (2, 'Customer Analysis', 999);
-- Q9. Try deleting a referenced Primary Key
DELETE FROM employee_sales
WHERE employee_id = 101;
-- Q10. Display the table's key definitions So I can inspect how MySQL has defined the Primary Key and Foreign Key:
SHOW CREATE TABLE employee_projects;

-- ----------AGGREGATIONS----------

-- COUNT
-- Q1. Count all employees.
SELECT COUNT(*) FROM employee_sales;
-- Q2. Count IT employees.
SELECT COUNT(*) FROM employee_sales WHERE department='IT';
-- Q3. Count Pune employees.
SELECT COUNT(*) FROM employee_sales WHERE city='Pune';
-- Q4. Count employees earning above 60000.
SELECT COUNT(*) AS Total_cnt FROM employee_sales WHERE salary>60000;
-- Q5. Count employees with a bonus.
SELECT COUNT(bonus) FROM employee_sales;

-- SUM
-- Q1. Total salary.
SELECT SUM(salary) FROM employee_sales;
-- Q2. Total sales.
SELECT SUM(sales_amount) FROM employee_sales;
-- Q3. Total IT salary.
SELECT SUM(salary) AS IT_Sal FROM employee_sales WHERE department='IT';
-- Q4. Total Sales department sales.
SELECT SUM(sales_amount) FROM employee_sales WHERE department='Sales';
-- Q5. Total bonuses.
SELECT SUM(bonus) FROM employee_sales;

-- AVG
-- Q1. Average salary.
SELECT AVG(salary) FROM employee_sales;
-- Q2. Average sales.
SELECT AVG(sales_amount) FROM employee_sales;
-- Q3. Average IT salary.
SELECT AVG(salary) FROM employee_sales WHERE department='IT';
-- Q4. Average Pune salary.
SELECT AVG(salary) FROM employee_sales WHERE city='Pune';
-- Q5. Average bonus.
SELECT AVG(bonus) FROM employee_sales;

-- MIN
-- Q1. Minimum salary.
SELECT MIN(salary) FROM employee_sales;
-- Q2. Minimum sales.
SELECT MIN(sales_amount) FROM employee_sales;
-- Q3. Minimum IT salary.
SELECT MIN(salary) FROM employee_sales WHERE department='IT';
-- Q4. Earliest joining date.
SELECT MIN(joining_date) FROM employee_sales;
-- Q5. Minimum bonus.
SELECT MIN(bonus) FROM employee_sales;

-- MAX
-- Q1. Maximum salary.
SELECT MAX(salary) FROM employee_sales;
-- Q2. Maximum sales.
SELECT MAX(sales_amount) FROM employee_sales;
-- Q3. Maximum IT salary.
SELECT MAX(salary) FROM employee_sales WHERE department='IT';
-- Q4. Latest joining date.
SELECT MAX(joining_date) FROM employee_sales;
-- Q5. Maximum bonus.
SELECT MAX(bonus) FROM employee_sales;

-- GROUP BY
-- Q1. Count employees by department.
SELECT department,COUNT(*) FROM employee_sales GROUP BY department;
-- Q2. Average salary by department.
SELECT department,AVG(salary) FROM employee_sales GROUP BY department;
-- Q3. Total sales by department.
SELECT department,SUM(sales_amount) FROM employee_sales GROUP BY department;
-- Q4. Count employees by city.
SELECT city,COUNT(*) FROM employee_sales GROUP BY city;
-- Q5. Maximum salary by department.
SELECT department,MAX(salary) FROM employee_sales GROUP BY department;
