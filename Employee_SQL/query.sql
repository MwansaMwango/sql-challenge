
-- 1. List the following details of each employee: employee number, last name, first name, sex, and salary.

SELECT 
	e.emp_no Employee_Number,
	e.last_name Last_Name,
	e.first_name First_Name,
	e.sex Sex,
	s.salary Salary
FROM Employees e
INNER JOIN Salaries s
ON e.emp_no = s.emp_no;


-- 2. List first name, last name, and hire date for employees who were hired in 1986.

SELECT 
	e.first_name First_Name,
	e.last_name Last_Name,
	e.hire_date Hire_Date
FROM Employees e 
WHERE hire_date LIKE '%/%/1986'


-- 3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
SELECT 
	d.dept_no department_number,
	d.dept_name department_name,
	dm.emp_no manager_employee_number,
	e.last_name last_name,
	e.first_name first_name

FROM dept_manager dm
LEFT JOIN departments d 
ON dm.dept_no = d.dept_no
LEFT JOIN employees e
ON dm.emp_no = e.emp_no



-- 4. List the department of each employee with the following information: employee number, last name, first name, and department name.

SELECT 
	e.emp_no employee_number,
	e.last_name last_name,
	e.first_name first_name,
	d.dept_name department_name
FROM employees e
LEFT JOIN dept_emp de
ON e.emp_no = de.emp_no
LEFT JOIN departments d
ON d.dept_no = de.dept_no


-- 5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."

SELECT 
	e.first_name,
	e.last_name,
	e.sex
FROM employees e
WHERE e.first_name = 'Hercules'
AND e.last_name LIKE 'B%'

-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.

SELECT 
	e.emp_no employee_number,
	e.last_name,
	e.first_name,
	d.dept_name department_name

FROM employees e
LEFT JOIN dept_emp de
ON e.emp_no = de.emp_no
LEFT JOIN departments d
ON d.dept_no = de.dept_no
WHERE d.dept_name = 'Sales'

-- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT 
	e.emp_no employee_number,
	e.last_name,
	e.first_name,
	d.dept_name

FROM employees e
LEFT JOIN dept_emp de
ON e.emp_no = de.emp_no
LEFT JOIN departments d
ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales'
OR d.dept_name = 'Development'


-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

SELECT
	e.last_name,
	count(e.last_name) frequency_count
	
FROM employees e
GROUP BY e.last_name
ORDER BY frequency_count DESC




