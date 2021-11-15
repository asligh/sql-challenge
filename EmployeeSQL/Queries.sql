--1
--List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT e.emp_no AS "employee_number",
       e.last_name,
	   e.first_name,
	   e.sex,
	   e.hire_date
FROM EMPLOYEE AS e
ORDER BY LAST_NAME ASC;

--2
--List first name, last name, and hire date for employees who were hired in 1986.
SELECT e.first_name,
       e.last_name,
	   e.hire_date
FROM EMPLOYEE AS e
WHERE EXTRACT(YEAR FROM e.HIRE_DATE) = 1986
ORDER BY LAST_NAME ASC;

--3
--List the manager of each department with the following information: department number, 
--department name, the manager's employee number, last name, first name.
SELECT dm.dept_no AS "department_number",
       d.name AS "department_name",
	   e.emp_no "employee_number",
	   e.last_name
	   e.first_name,
FROM DEPT_MANAGER AS dm
INNER JOIN DEPARTMENT AS d ON d.dept_no = dm.dept_no
INNER JOIN EMPLOYEE AS e ON e.emp_no = dm.emp_no
ORDER BY e.last_name, e.emp_no ASC;

--4
--List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT e.emp_no AS "employee_number",
       e.last_name,
	   e.first_name,
	   d.name AS "department_name"
FROM EMPLOYEE AS e
INNER JOIN DEPT_EMPLOYEE AS de ON de.emp_no = e.emp_no
INNER JOIN DEPARTMENT AS d ON d.dept_no = de.dept_no
ORDER BY e.last_name, e.emp_no ASC;

--5
--List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT e.first_name,
       e.last_name,
	   e.sex
FROM EMPLOYEE AS e
WHERE TRIM(e.first_name) = 'Hercules' AND TRIM(e.last_name) LIKE 'B%'
ORDER BY e.last_name ASC;

--6
--List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT e.emp_no AS "employee_number",
       e.last_name,
	   e.first_name,
	   d.name AS "department_name"
FROM EMPLOYEE AS e
INNER JOIN DEPT_EMPLOYEE AS de ON de.emp_no = e.emp_no
INNER JOIN DEPARTMENT AS d ON d.dept_no = de.dept_no
WHERE LOWER(TRIM(d.name)) = 'sales'
ORDER BY e.last_name, e.emp_no ASC;

--7
--List all employees in the Sales and Development departments, including their employee number, 
--last name, first name, and department name.
SELECT e.emp_no AS "employee_number",
       e.last_name,
	   e.first_name,
	   d.name AS "department_name"
FROM EMPLOYEE AS e
INNER JOIN DEPT_EMPLOYEE AS de ON de.emp_no = e.emp_no
INNER JOIN DEPARTMENT AS d ON d.dept_no = de.dept_no
WHERE LOWER(TRIM(d.name)) IN ('sales','development')
ORDER BY d.name, e.last_name, e.first_name ASC;

--8
--In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT e.last_name, COUNT(*) AS "Frequency"
FROM EMPLOYEE e
GROUP BY e.last_name
ORDER BY COUNT(*) DESC;

--ID number search
select * from employee as e where e.emp_no = 499942 --April Fools!