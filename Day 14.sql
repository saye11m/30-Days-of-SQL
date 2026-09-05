-- ----------FULL OUTER JOIN----------           ---  DAY 14 ---                  
-- Q1. Show all employees and departments
SELECT e.employee_name, d.department
FROM employee_sales e
LEFT JOIN department_info d
ON e.department = d.department
UNION
SELECT e.employee_name, d.department
FROM employee_sales e
RIGHT JOIN department_info d
ON e.department = d.department;

-- Q2. Show all employees and their department locations
SELECT e.employee_name, d.location
FROM employee_sales e
LEFT JOIN department_info d
ON e.department = d.department
UNION
SELECT e.employee_name, d.location
FROM employee_sales e
RIGHT JOIN department_info d
ON e.department = d.department;

-- Q3.Show all departments and their managers with employee names
SELECT d.department, d.manager_name, e.employee_name
FROM employee_sales e
LEFT JOIN department_info d
ON e.department = d.department
UNION
SELECT d.department, d.manager_name, e.employee_name
FROM employee_sales e
RIGHT JOIN department_info d
ON e.department = d.department;

-- Q4. Show all employees and their salaries with departments
SELECT e.employee_name, e.salary, d.department
FROM employee_sales e
LEFT JOIN department_info d
ON e.department = d.department
UNION
SELECT e.employee_name, e.salary, d.department
FROM employee_sales e
RIGHT JOIN department_info d
ON e.department = d.department;

-- Q5. Show all departments and employee IDs
SELECT d.department, e.employee_id
FROM employee_sales e
LEFT JOIN department_info d
ON e.department = d.department
UNION
SELECT d.department, e.employee_id
FROM employee_sales e
RIGHT JOIN department_info d
ON e.department = d.department;


-- CROSS JOIN
-- Q1. Every employee-department combination.
SELECT e.employee_name,d.department
FROM employee_sales e CROSS JOIN department_info d;
-- Q2. Every employee-manager combination.
SELECT e.employee_name,d.manager_name
FROM employee_sales e CROSS JOIN department_info d;
-- Q3. First 20 cross-join rows.
SELECT e.employee_name,d.department
FROM employee_sales e CROSS JOIN department_info d LIMIT 20;
-- Q4. Unique city-department combinations.
SELECT DISTINCT e.city,d.department
FROM employee_sales e CROSS JOIN department_info d;
-- Q5. Count cross-join rows.
SELECT COUNT(*) FROM employee_sales e CROSS JOIN department_info d;

-- SELF JOIN
-- Q1. Show employee and manager.
SELECT e.employee_name AS employee,m.employee_name AS manager
FROM employee_sales e LEFT JOIN employee_sales m ON e.manager_id=m.employee_id;
-- Q2. Show IT employees and managers.
SELECT e.employee_name,m.employee_name AS manager
FROM employee_sales e LEFT JOIN employee_sales m ON e.manager_id=m.employee_id
WHERE e.department='IT';
-- Q3. Show employee and manager salary.
SELECT e.employee_name,e.salary,m.employee_name AS manager,m.salary AS manager_salary
FROM employee_sales e LEFT JOIN employee_sales m ON e.manager_id=m.employee_id;
-- Q4. Find employees whose manager earns more.
SELECT e.employee_name,e.salary,m.employee_name AS manager,m.salary AS manager_salary
FROM employee_sales e JOIN employee_sales m ON e.manager_id=m.employee_id
WHERE m.salary>e.salary;
-- Q5. Count team members under each manager.
SELECT m.employee_name AS manager,COUNT(e.employee_id) AS team_size
FROM employee_sales e JOIN employee_sales m ON e.manager_id=m.employee_id
GROUP BY m.employee_id,m.employee_name;
