-- ----------Transactions----------                       

-- 1. Employee Promotion & Location Update
-- Requirement: Promote employee 114 to Senior Analyst and move them to Department as Finance. The city is entered incorrectly as Mumbai so correct it to Pune.
SELECT * FROM employee_sales
WHERE employee_id =114;
START TRANSACTION;

-- Update department
UPDATE employee_sales
SET department = 'Finance'
WHERE employee_id = 114;

SAVEPOINT department_updated;

-- Update job title
UPDATE employee_sales
SET job_title = 'Senior_Analyst'
WHERE employee_id = 114;

SAVEPOINT promotion_completed;

-- Incorrect city update
UPDATE employee_sales
SET city = 'Mumbai'
WHERE employee_id = 114;

-- Verify
SELECT *
FROM employee_sales
WHERE employee_id = 114;

-- Undo only the incorrect city update
ROLLBACK TO SAVEPOINT promotion_completed;

-- Correct city
UPDATE employee_sales
SET city = 'Pune'
WHERE employee_id = 114;

-- Final verification
SELECT employee_id, employee_name,
       department, job_title, city
FROM employee_sales
WHERE employee_id = 114;

COMMIT;

-- 2. Employee Contact Information Correction
-- Requirement: Update employee 115's email and city. The city is entered incorrectly, so correct it to Banglore.

START TRANSACTION;
SELECT * FROM employee_sales
WHERE employee_id = 115;
-- Correct email
UPDATE employee_sales
SET email = 'Isha.Gupta@gmail.com'
WHERE employee_id = 115;

SAVEPOINT email_corrected;

-- Incorrect city
UPDATE employee_sales
SET city = 'Mumbai'
WHERE employee_id = 115;

-- Verify
SELECT employee_id, employee_name,
       email, city
FROM employee_sales
WHERE employee_id = 115;

-- Undo incorrect city update
ROLLBACK TO SAVEPOINT email_corrected;
SELECT * FROM employee_sales;
-- Correct city
UPDATE employee_sales
SET city = 'Bangalore'
WHERE employee_id = 115;

-- Final verification
SELECT employee_id, employee_name,
       email, city
FROM employee_sales
WHERE employee_id = 115;

COMMIT;

-- 3. Payroll Processing
-- Requirement: Increase employee 116's salary by ₹4,000. The bonus is entered incorrectly as ₹3,000, so correct it to ₹1,500.

START TRANSACTION;

-- Salary adjustment
UPDATE employee_sales
SET salary = salary + 4000
WHERE employee_id = 116;

SAVEPOINT salary_processed;

-- Incorrect bonus adjustment
UPDATE employee_sales
SET bonus = bonus + 3000
WHERE employee_id = 116;

-- Verify
SELECT employee_id, employee_name,
       salary, bonus
FROM employee_sales
WHERE employee_id = 116;

-- Undo incorrect bonus
ROLLBACK TO SAVEPOINT salary_processed;

-- Apply correct bonus
UPDATE employee_sales
SET bonus = bonus + 1500
WHERE employee_id = 116;

-- Final verification
SELECT employee_id, employee_name,
       salary, bonus
FROM employee_sales
WHERE employee_id = 116;

COMMIT;

-- 4. Employee Transfer Processing
-- Requirement: Transfer employee 117 to IT and Pune. The city is entered incorrectly as Mumbai, so correct it to Pune.

START TRANSACTION;

-- Transfer employee to IT
UPDATE employee_sales
SET department = 'IT'
WHERE employee_id = 117;

SAVEPOINT department_transfer;

-- Incorrect city
UPDATE employee_sales
SET city = 'Mumbai'
WHERE employee_id = 117;

-- Verify
SELECT employee_id, employee_name,
       department, city
FROM employee_sales
WHERE employee_id = 117;

-- Undo city change
ROLLBACK TO SAVEPOINT department_transfer;

-- Correct city
UPDATE employee_sales
SET city = 'Pune'
WHERE employee_id = 117;

-- Final verification
SELECT employee_id, employee_name,
       department, city
FROM employee_sales
WHERE employee_id = 117;

COMMIT;

-- 5. Sales Performance Correction
-- Requirement: Increase employee 118's sales amount by ₹10,000. The bonus is entered as ₹4,000 instead of ₹2,000, so correct it.

START TRANSACTION;

-- Update sales amount
UPDATE employee_sales
SET sales_amount = sales_amount + 10000
WHERE employee_id = 118;

SAVEPOINT sales_updated;

-- Incorrect bonus update
UPDATE employee_sales
SET bonus = bonus + 4000
WHERE employee_id = 118;

-- Verify
SELECT employee_id, employee_name,
       sales_amount, bonus
FROM employee_sales
WHERE employee_id = 118;

-- Undo incorrect bonus
ROLLBACK TO SAVEPOINT sales_updated;

-- Correct bonus
UPDATE employee_sales
SET bonus = bonus + 2000
WHERE employee_id = 118;

-- Final verification
SELECT employee_id, employee_name,
       sales_amount, bonus
FROM employee_sales
WHERE employee_id = 118;

COMMIT;

-- 6. Employee Role & Salary Revision
-- Requirement: Promote employee 119 to Team Lead. The salary increment is entered as ₹10,000 instead of ₹7,000, so correct it.

START TRANSACTION;

-- Promotion
UPDATE employee_sales
SET job_title = 'Team Lead'
WHERE employee_id = 119;

SAVEPOINT promotion_completed;

-- Incorrect salary increment
UPDATE employee_sales
SET salary = salary + 10000
WHERE employee_id = 119;

-- Verify
SELECT employee_id, employee_name,
       job_title, salary
FROM employee_sales
WHERE employee_id = 119;

-- Undo incorrect salary update
ROLLBACK TO SAVEPOINT promotion_completed;

-- Correct salary increment
UPDATE employee_sales
SET salary = salary + 7000
WHERE employee_id = 119;

-- Final verification
SELECT employee_id, employee_name,
       job_title, salary
FROM employee_sales
WHERE employee_id = 119;

COMMIT;

-- 7. Employee Profile & Status Update
-- Requirement: Update employee 120's department to Operations and job title to Executive. The status is incorrectly changed to Inactive, so keep it Active.

START TRANSACTION;

-- Department correction
UPDATE employee_sales
SET department = 'Operations'
WHERE employee_id = 120;

SAVEPOINT department_updated;

-- Job title correction
UPDATE employee_sales
SET job_title = 'Executive'
WHERE employee_id = 120;

SAVEPOINT profile_completed;

-- Incorrect status update
UPDATE employee_sales
SET status = 'Inactive'
WHERE employee_id = 120;

-- Verify
SELECT employee_id, employee_name,
       department, job_title, status
FROM employee_sales
WHERE employee_id = 120;

-- Undo only incorrect status update
ROLLBACK TO SAVEPOINT profile_completed;

-- Correct status
UPDATE employee_sales
SET status = 'Active'
WHERE employee_id = 120;

-- Final verification
SELECT employee_id, employee_name,
       department, job_title, status
FROM employee_sales
WHERE employee_id = 120;

COMMIT;

