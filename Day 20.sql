-- ----------VIEWS----------                                                                   

-- Q1. Create a view for IT employees.
CREATE OR REPLACE VIEW it_employees AS
SELECT employee_id,employee_name,salary FROM employee_sales WHERE department='IT';
-- Q2. Read the IT view.
SELECT * FROM it_employees;
-- Q3. Create a high-salary view.
CREATE OR REPLACE VIEW high_salary_employees AS
SELECT employee_id,employee_name,department,salary FROM employee_sales WHERE salary>60000;

SELECT * FROM high_salary_employees;
-- Q4. Create a department summary view.
CREATE OR REPLACE VIEW department_summary AS
SELECT department,COUNT(*) AS employee_count,AVG(salary) AS average_salary
FROM employee_sales GROUP BY department;
-- Q5. View for recently joined employees
CREATE VIEW recent_joiners AS
SELECT employee_id, employee_name, department, joining_date
FROM employee_sales
WHERE joining_date > '2025-01-01';

SELECT * FROM recent_joiners;

-- Q6.View for employees with their salary and sales
CREATE VIEW employee_performance AS
SELECT employee_id, employee_name, department,salary, sales_amount
FROM employee_sales;

SELECT *
FROM employee_performance
WHERE sales_amount > 100000;
DROP VIEW it_employees;
 -- Q7. View for employees without a manager
CREATE VIEW top_level_employees AS
SELECT employee_id, employee_name, department, manager_id
FROM employee_sales
WHERE manager_id IS NULL;

SELECT * FROM top_level_employees;

-- Q8. View for employees from selected cities
CREATE VIEW pune_employees AS
SELECT employee_id, employee_name, department, city
FROM employee_sales
WHERE city = 'Pune';

SELECT * FROM pune_employees;

-- Q9. Modify an existing View
CREATE OR REPLACE VIEW employee_salary_view AS
SELECT employee_id,employee_name,department,salary,joining_date
FROM employee_sales;

SELECT * FROM employee_salary_view;
