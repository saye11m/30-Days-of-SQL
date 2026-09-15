-- TRIGGERS                                  
CREATE TABLE employee_audit (
 audit_id INT AUTO_INCREMENT PRIMARY KEY,
 employee_id INT,
 action_type VARCHAR(30),
 action_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- BEFORE INSERT
-- Q1. Create a trigger that changes negative salary to 0.
DELIMITER //
CREATE TRIGGER before_employee_insert
BEFORE INSERT ON employee_sales
FOR EACH ROW
BEGIN
 IF NEW.salary<0 THEN SET NEW.salary=0; END IF;
END //
DELIMITER ;
-- Q2. Test it with a negative salary.
INSERT INTO employee_sales VALUES
(994,'Before Insert Test','IT','Intern',105,'Pune',-1000,10000,'2026-01-05','before@gmail.com','Active',500);
-- Q3. Check the corrected salary.
SELECT employee_id,salary FROM employee_sales WHERE employee_id=994;
-- Q4. Delete the test row.
DELETE FROM employee_sales WHERE employee_id=994;
-- Q5. Confirm deletion.
SELECT * FROM employee_sales WHERE employee_id=994;

-- AFTER INSERT
-- Q1. Create an audit trigger after insert.
DELIMITER //
CREATE TRIGGER after_employee_insert
AFTER INSERT ON employee_sales
FOR EACH ROW
BEGIN
 INSERT INTO employee_audit(employee_id,action_type) VALUES(NEW.employee_id,'INSERT');
END //
DELIMITER ;
-- Q2. Insert a test employee.
INSERT INTO employee_sales VALUES
(993,'After Insert Test','IT','Intern',105,'Pune',30000,10000,'2026-01-06','after@gmail.com','Active',500);
-- Q3. Check the audit.
SELECT * FROM employee_audit WHERE employee_id=993;
-- Q4. Check the employee.
SELECT * FROM employee_sales WHERE employee_id=993;
-- Q5. Delete the test employee.
DELETE FROM employee_sales WHERE employee_id=993;

-- BEFORE UPDATE
-- Q1. Create a trigger that prevents negative salary.
DELIMITER //
CREATE TRIGGER before_employee_update
BEFORE UPDATE ON employee_sales
FOR EACH ROW
BEGIN
 IF NEW.salary<0 THEN SET NEW.salary=0; END IF;
END //
DELIMITER ;
DROP TRIGGER before_employee_update;
-- Q2. Increase salary.
UPDATE employee_sales SET salary=salary+500 WHERE employee_id=101;
-- Q3. Try a negative salary.
UPDATE employee_sales SET salary=-500 WHERE employee_id=102;
-- Q4. Check the result.
SELECT employee_id,salary FROM employee_sales WHERE employee_id=102;
-- Q5. Restore the salary.
UPDATE employee_sales SET salary=58000 WHERE employee_id=102;

-- AFTER UPDATE
-- Q1. Create an audit trigger after update.
DELIMITER //
CREATE TRIGGER after_employee_update
AFTER UPDATE ON employee_sales
FOR EACH ROW
BEGIN
 INSERT INTO employee_audit(employee_id,action_type) VALUES(NEW.employee_id,'UPDATE');
END //
DELIMITER ;
-- Q2. Update a bonus.
UPDATE employee_sales SET bonus=COALESCE(bonus,0)+100 WHERE employee_id=103;
-- Q3. View the audit.
SELECT * FROM employee_audit WHERE employee_id=103 AND action_type='UPDATE';
-- Q4. Update another employee.
UPDATE employee_sales SET city='Pune' WHERE employee_id=106;
-- Q5. View all update audits.
SELECT * FROM employee_audit WHERE action_type='UPDATE';

-- BEFORE DELETE
-- Q1. Create a BEFORE DELETE audit trigger.
DELIMITER //
CREATE TRIGGER before_employee_delete
BEFORE DELETE ON employee_sales
FOR EACH ROW
BEGIN
 INSERT INTO employee_audit(employee_id,action_type) VALUES(OLD.employee_id,'BEFORE DELETE');
END //
DELIMITER ;
-- Q2. Insert a temporary employee.
INSERT INTO employee_sales VALUES
(991,'Delete Test','IT','Intern',105,'Pune',25000,10000,'2026-01-07','delete@gmail.com','Active',500);
-- Q3. Delete the temporary employee.
DELETE FROM employee_sales WHERE employee_id=991;
-- Q4. Check the audit.
SELECT * FROM employee_audit WHERE employee_id=991;
-- Q5. Confirm the employee is gone.
SELECT * FROM employee_sales WHERE employee_id=991;

-- AFTER DELETE
-- Q1. Create an AFTER DELETE audit trigger.
DELIMITER //
CREATE TRIGGER after_employee_delete
AFTER DELETE ON employee_sales
FOR EACH ROW
BEGIN
 INSERT INTO employee_audit(employee_id,action_type) VALUES(OLD.employee_id,'AFTER DELETE');
END //
DELIMITER ;
-- Q2. Insert a temporary employee.
INSERT INTO employee_sales VALUES
(990,'After Delete Test','IT','Intern',105,'Pune',25000,10000,'2026-01-08','afterdelete@gmail.com','Active',500);
-- Q3. Delete the employee.
DELETE FROM employee_sales WHERE employee_id=990;
-- Q4. Check the audit.
SELECT * FROM employee_audit WHERE employee_id=990;
-- Q5. Display all audit records.
SELECT * FROM employee_audit;

-- 1. BEFORE INSERT — Modify data before inserting

-- Requirement: The company does not want negative salaries to be stored. If a new employee is inserted with a negative salary, automatically change the salary to 0 before inserting the employee.

DELIMITER //

CREATE TRIGGER before_employee_insert
BEFORE INSERT ON employee_sales
FOR EACH ROW
BEGIN
    IF NEW.salary < 0 THEN
        SET NEW.salary = 0;
    END IF;
END //

DELIMITER ;
DROP TRIGGER before_employee_insert;
-- Tested it:
INSERT INTO employee_sales VALUES
(99, 'Trigger Insert Test', 'IT', 'Intern', 105, 'Pune',
-1000, 10000, '2026-01-05', 'triggerinsert@gmail.com',
'Active', 500);

-- Check:

SELECT employee_id, employee_name, salary
FROM employee_sales
WHERE employee_id = 994;


-- 2. BEFORE UPDATE Trigger

-- Requirement The company doesn't want an employee's salary to become negative during an update. If a negative salary is entered, change it to 0.

DELIMITER //

CREATE TRIGGER before_employee_update
BEFORE UPDATE ON employee_sales
FOR EACH ROW
BEGIN
    IF NEW.salary < 0 THEN
        SET NEW.salary = 0;
    END IF;
END //

DELIMITER ;

-- Test :
UPDATE employee_sales
SET salary = -500
WHERE employee_id = 102;

-- Check it:

SELECT employee_id, salary
FROM employee_sales
WHERE employee_id = 102;


-- 3. BEFORE DELETE Trigger

-- Requirement Before an employee is deleted, the company wants to record the employee ID in the audit table.

DELIMITER //

CREATE TRIGGER before_employee_delete
BEFORE DELETE ON employee_sales
FOR EACH ROW
BEGIN
    INSERT INTO employee_audit(employee_id, action_type)
    VALUES (OLD.employee_id, 'BEFORE DELETE');
END //

DELIMITER ;

-- Test:

DELETE FROM employee_sales
WHERE employee_id = 991;

-- Check:

SELECT *
FROM employee_audit
WHERE employee_id = 991;

-- 4. AFTER INSERT — Automatically create an audit record

-- Requirement: Whenever a new employee is successfully inserted, the company wants to automatically record the employee ID and action in the audit table.

DELIMITER //

CREATE TRIGGER after_employee_insert
AFTER INSERT ON employee_sales
FOR EACH ROW
BEGIN
    INSERT INTO employee_audit(employee_id, action_type)
    VALUES (NEW.employee_id, 'INSERT');
END //

DELIMITER ;

-- Test :

INSERT INTO employee_sales VALUES
(993, 'Trigger Audit Test', 'IT', 'Intern', 105, 'Pune',
30000, 10000, '2026-01-06', 'triggeraudit@gmail.com',
'Active', 500);

-- Check the audit:

SELECT *
FROM employee_audit
WHERE employee_id = 993;


-- 5. AFTER UPDATE — Track changes

-- Requirement: Whenever employee information is updated, the company wants to automatically record the employee ID and the action in the audit table.

DELIMITER //

CREATE TRIGGER after_employee_update
AFTER UPDATE ON employee_sales
FOR EACH ROW
BEGIN
    INSERT INTO employee_audit(employee_id, action_type)
    VALUES (NEW.employee_id, 'UPDATE');
END //

DELIMITER ;

-- Test:

UPDATE employee_sales
SET bonus = COALESCE(bonus, 0) + 100
WHERE employee_id = 103;

-- Check:

SELECT *
FROM employee_audit
WHERE employee_id = 103
AND action_type = 'UPDATE';


-- 6. AFTER DELETE — Record deleted employees

-- Requirement: Whenever an employee is deleted, the company wants to maintain an audit record containing the ID of the deleted employee.

DELIMITER //

CREATE TRIGGER after_employee_delete
AFTER DELETE ON employee_sales
FOR EACH ROW
BEGIN
    INSERT INTO employee_audit(employee_id, action_type)
    VALUES (OLD.employee_id, 'DELETE');
END //

DELIMITER ;

-- First created a temporary employee:

INSERT INTO employee_sales VALUES
(990, 'Delete Test', 'IT', 'Intern', 105, 'Pune', 25000, 10000, '2026-01-08', 'deletetest@gmail.com','Active', 500);

-- Now deleted them:

DELETE FROM employee_sales
WHERE employee_id = 990;

-- Now check the audit to verify :

SELECT *
FROM employee_audit
WHERE employee_id = 990;
