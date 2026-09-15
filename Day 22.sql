-- STORED PROCEDURES                        

-- Q1. Create a procedure to display all employees.
DELIMITER //
CREATE PROCEDURE get_all_employees()
BEGIN
 SELECT * FROM employee_sales;
END //
DELIMITER ;
CALL get_all_employees();


-- Q2. Create a procedure to display IT employees.
DELIMITER $$
CREATE PROCEDURE get_it_employees()
BEGIN
 SELECT * FROM employee_sales WHERE department='IT';
END $$
DELIMITER ;
CALL get_it_employees();

-- Q3. Create a procedure with a department parameter.
DELIMITER //
CREATE PROCEDURE get_department_employees(IN dept_name VARCHAR(30))
BEGIN
 SELECT * FROM employee_sales WHERE department=dept_name;
END //
DELIMITER ;
CALL get_department_employees('Sales');

-- Q4. HR wants to find employees from a particular department whose salary is greater than a specified amount.
DELIMITER //

CREATE PROCEDURE GetEmployeesByDeptAndSalary(IN dept_name VARCHAR(50),IN min_salary DECIMAL(10,2))
BEGIN
    SELECT *
    FROM employee_sales
    WHERE department = dept_name
      AND salary > min_salary;
END //

DELIMITER ;
CALL GetEmployeesByDeptAndSalary('IT', 50000);

-- Q5. Create a procedure with salary parameter.
DELIMITER //
CREATE PROCEDURE get_high_salary_employees(IN min_salary DECIMAL(10,2))
BEGIN
 SELECT * FROM employee_sales
 WHERE salary>min_salary;
END //
DELIMITER ;
CALL get_high_salary_employees(60000);

-- Q6. Create a procedure to count employees by department.
DELIMITER //
CREATE PROCEDURE count_department_employees(IN dept_name VARCHAR(30))
BEGIN
 SELECT COUNT(*) AS employee_count FROM employee_sales WHERE department=dept_name;
END //
DELIMITER ;
CALL count_department_employees('Finance');

-- Q7. The Stored Procedure is no longer required and needs to be removed. 
DROP PROCEDURE IF EXISTS GetEmployeesByDepartment;
