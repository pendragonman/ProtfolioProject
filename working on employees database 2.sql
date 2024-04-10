----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- FOR EMPLOYEES TABLE
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 1. What is the total number of employees in the database.
SELECT COUNT(*) as total_employee FROM employees;

-- 2. What is the average age of employees
SELECT ROUND(AVG(2023 - year(birth_date))) as AVG_age FROM employees;

-- 3. What is the earliest hire date among all the employees.
SELECT MIN(hire_date) as early_hired from employees;

-- 4. How many male and female employees are there.
SELECT 
    gender, COUNT(*) AS Gender_count
FROM
    employees
GROUP BY gender;

-- 5 what is the most common first name among employees.
SELECT 
    first_name, COUNT(*) AS fname_count
FROM
    employees
GROUP BY first_Name
ORDER BY fname_count DESC
LIMIT 1;

-- 6 What is the most common last name among the employees.
SELECT last_name, COUNT(*) AS lname_count
FROM employees
GROUP BY last_name
ORDER BY lname_count DESC
LIMIT 1;

-- 7. How many emloyees were hired in each year.
SELECT 
    hire_date, COUNT(hire_date) AS employees_hired
FROM
    employees
GROUP BY hire_date; 

-- 8. What is the gender distribution among employees.
SELECT gender, COUNT(*) AS gender_count,
       ROUND((COUNT(*) / (SELECT COUNT(*) FROM employees)) * 100, 2) AS percentage
FROM employees
GROUP BY gender;

-- 9. What is the average length of employment (in years) for employees.
SELECT ROUND(AVG(DATEDIFF(CURDATE(), hire_date) / 365)) AS average_employment_years
FROM employees;

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- FOR DEPARTMENT EMPLOYEES TABLE
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 10 How many employees have been associated with each department
SELECT * FROM dept_emp;
SELECT COUNT(dept_no) as count_dept_emp FROM dept_emp;
 
 -- 11 WHAT is the earliest start date for employees in each departent.
SELECT emp_no, MIN(from_date) as early_started from dept_emp group by emp_no order by early_started ASC;

-- 12 How many employees  have never changed their department.
SELECT dept_no
FROM dept_emp
GROUP BY dept_no
HAVING COUNT(DISTINCT dept_no) = 1;

-- 13. What is the average duration duration of employment for employees in each department?

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- FOR THE SALARIES TABLE
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- 14 What is the average salary of employees?
SELECT * FROM salaries;
SELECT emp_no, ROUND(AVG(salary),2) AS AVG_SALARY FROM salaries GROUP BY emp_no;

-- 15 What is the highest salary among all employees.
SELECT 
    emp_no, MAX(salary) AS highest_paid
FROM
    salaries
GROUP BY emp_no
ORDER BY highest_paid DESC
LIMIT 1;

-- 16 Number of employees that have same salary through out their employment. 

-- 17. What is the total salary expenditure for the company
SELECT SUM(salary) AS total_salary_expenditure
FROM salaries;

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- FOR THE TITLES TABLE
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 18. How many employees have held each job titles
SELECT title, COUNT(*) AS employee_count
FROM titles
GROUP BY title;

-- 19. What is the most common job titles among employees. 
SELECT title, count(*) AS max_employee_count FROM titles GROUP BY title order by max_employee_count DESC LIMIT 1;

-- 20. What is the average duration for holding a job title for employees.
SELECT * FROM titles;
SELECT title, ROUND(AVG(DATEDIFF(to_date, from_date))) AS avg_duration FROM titles GROUP BY title;