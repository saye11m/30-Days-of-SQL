-- DATEDIFF                                                            
-- Q1. Days since joining.
SELECT employee_name,DATEDIFF(CURDATE(),joining_date) FROM employee_sales;
-- Q2. Employees with more than 1000 days.
SELECT * FROM employee_sales WHERE DATEDIFF(CURDATE(),joining_date)>1000;
-- Q3. Days between joining and 2025-01-01.
SELECT employee_name,DATEDIFF('2025-01-01',joining_date) FROM employee_sales;
-- Q4. Maximum service days.
SELECT MAX(DATEDIFF(CURDATE(),joining_date)) FROM employee_sales;
-- Q5. Employee with longest service.
SELECT employee_name,DATEDIFF(CURDATE(),joining_date) AS service_days
FROM employee_sales ORDER BY service_days DESC LIMIT 1;

-- TIMESTAMPDIFF
-- Q1. Service in years.
SELECT employee_name,TIMESTAMPDIFF(YEAR,joining_date,CURDATE()) FROM employee_sales;
-- Q2. Service in months.
SELECT employee_name,TIMESTAMPDIFF(MONTH,joining_date,CURDATE()) FROM employee_sales;
-- Q3. Employees with more than 5 years.
SELECT * FROM employee_sales WHERE TIMESTAMPDIFF(YEAR,joining_date,CURDATE())>5;
-- Q4. Average service in years.
SELECT AVG(TIMESTAMPDIFF(YEAR,joining_date,CURDATE())) FROM employee_sales;
-- Q5. Employee with most service years.
SELECT employee_name,TIMESTAMPDIFF(YEAR,joining_date,CURDATE()) AS years
FROM employee_sales ORDER BY years DESC LIMIT 1;

-- DATE_FORMAT
-- Q1. Format date as DD-MM-YYYY.
SELECT employee_name,DATE_FORMAT(joining_date,'%d-%m-%Y') FROM employee_sales;
-- Q2. Format date as Month Year.
SELECT employee_name,DATE_FORMAT(joining_date,'%M %Y') FROM employee_sales;
-- Q3. Show joining year.
SELECT employee_name,DATE_FORMAT(joining_date,'%Y') FROM employee_sales;
-- Q4. Show joining month name.
SELECT employee_name,DATE_FORMAT(joining_date,'%M') FROM employee_sales;
-- Q5. Show readable joining date.
SELECT employee_name,DATE_FORMAT(joining_date,'%d %M %Y') FROM employee_sales;

-- DATE_SUB
-- Q1. Date one year before today.
SELECT DATE_SUB(CURDATE(),INTERVAL 1 YEAR);
-- Q2. Date six months before today.
SELECT DATE_SUB(CURDATE(),INTERVAL 6 MONTH);
-- Q3. Employees who joined before one year ago.
SELECT * FROM employee_sales WHERE joining_date<DATE_SUB(CURDATE(),INTERVAL 1 YEAR);
-- Q4. Employees who joined within the last five years.
SELECT * FROM employee_sales WHERE joining_date>=DATE_SUB(CURDATE(),INTERVAL 5 YEAR);
-- Q5. Employees who joined before two years ago.
SELECT * FROM employee_sales WHERE joining_date<DATE_SUB(CURDATE(),INTERVAL 2 YEAR);

-- DATE_ADD
-- Q1. Find the expected joining date after 1 month.
SELECT employee_name, DATE_ADD(joining_date, INTERVAL 1 MONTH) AS new_date
FROM employee_sales;

-- Q2. Find the date after 30 days from joining.
SELECT employee_name, DATE_ADD(joining_date, INTERVAL 30 DAY) AS date_after_30_days
FROM employee_sales;

-- Q3. Find the date after 1 year from joining.
 SELECT employee_name, DATE_ADD(joining_date, INTERVAL 1 YEAR) AS anniversary_date
FROM employee_sales;

-- Q4. Find the date after 7 days from joining.
SELECT employee_name, DATE_ADD(joining_date, INTERVAL 7 DAY) AS date_after_7_days
FROM employee_sales;

-- Q5. Add 3 months to the joining date.
SELECT employee_name, DATE_ADD(joining_date, INTERVAL 3 MONTH) AS date_after_3_months
FROM employee_sales;
