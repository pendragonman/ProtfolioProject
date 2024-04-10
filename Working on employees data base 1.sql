 -- 1 No of employees in the company
SELECT COUNT(*) as no_of_employees FROM employees;

-- 2 Average salary of all employees.
SELECT AVG(salary) as average_salary FROM salaries;

-- 3 Highest paid employee in the Company.
SELECT 
    emp_no, salary AS highest_salary
FROM
    salaries
WHERE
    salary = (SELECT 
            MAX(salary) AS highest_salary
        FROM
            salaries)
ORDER BY highest_salary DESC
LIMIT 1;

-- 4 Job titles in organization.
SELECT * FROM departments;

-- 5 No of employees that holds the job title manager
SELECT COUNT(*) as dept_manager FROM titles WHERE title='manager';

-- 6 WHAT DEPT DOES EMPLOYEE WITH ID 10011 belong to.
SELECT dept_no FROM dept_emp where emp_no = '10011';
select dept_name from departments where dept_no = 'd009';

-- 7 Employees in the IT dept
SELECT * FROM departments ;
SELECT dept_no from departments where dept_name = 'IT';

-- 8 Employees that were hired on the year 1996
SELECT emp_no, first_name, last_name, hire_date FROM employees WHERE year(hire_date) = '1996';

-- 9 Number of employees in the Human resource department
select dept_no from departments WHERE dept_name = 'Human Resources';
SELECT COUNT(*) AS num_hr_employees FROM dept_emp WHERE dept_no = 'd003';

-- 10 list f employees by alphabetical order by last name
SELECT * FROM Employees ORDER BY last_name;

-- 11 Number of unique job titles in the company
SELECT COUNT(DISTINCT title) AS no_of_unique_title
FROM titles;

-- 12 What is the average tenure of employees in the sales department (i dont understand sir)

-- 13 Are there any employees whithout assigned department
SELECT * FROM departments WHERE dept_name = null;
-- therefore there are no null depts
