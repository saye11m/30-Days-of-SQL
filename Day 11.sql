-- ----------DATE & TIME---------- 
-- If we use a postgresql then we will use EXTRACT function SYNTAX: SELECT employee_name,EXTRACT(DAYNAME(joining_date)) FROM employee_sales;

-- ----------CURDATE(Current Date)----------
-- Q1. Display today's date.
SELECT CURDATE();
-- Q2. Show today's date beside every employee.
SELECT employee_name,CURDATE() FROM employee_sales;
-- Q3. Calculate days since joining.
SELECT employee_name,DATEDIFF(CURDATE(),joining_date) AS days_worked FROM employee_sales;
-- Q4. Find employees who joined before today.
SELECT * FROM employee_sales WHERE joining_date<CURDATE();
-- Q5. Show joining date and today's date.
SELECT employee_name,joining_date,CURDATE() FROM employee_sales;

-- DAYNAME
-- Q1. Display joining weekday.
SELECT employee_name,DAYNAME(joining_date) FROM employee_sales;
-- Q2. Find Monday joiners.
SELECT * FROM employee_sales 
  WHERE DAYNAME(joining_date)='Monday';
-- Q3. Count employees by weekday.
SELECT DAYNAME(joining_date),COUNT(*) FROM employee_sales 
  GROUP BY DAYNAME(joining_date);
-- Q4. Show name, date and weekday.
SELECT employee_name,joining_date,DAYNAME(joining_date) FROM employee_sales;
-- Q5. Find Sunday joiners.
SELECT * FROM employee_sales 
  WHERE DAYNAME(joining_date)='Sunday';

-- YEAR / MONTH
-- Q1. Display joining year.
SELECT employee_name,YEAR(joining_date) FROM employee_sales;
-- Q2. Display joining month.
SELECT employee_name,MONTH(joining_date) FROM employee_sales;
-- Q3. Find employees who joined in 2022.
SELECT * FROM employee_sales WHERE YEAR(joining_date)=2022;
-- Q4. Count employees by year.
SELECT YEAR(joining_date),COUNT(*) FROM employee_sales 
  GROUP BY YEAR(joining_date);
-- Q5. Count employees by month.
SELECT MONTH(joining_date),COUNT(*) FROM employee_sales 
  GROUP BY MONTH(joining_date);
