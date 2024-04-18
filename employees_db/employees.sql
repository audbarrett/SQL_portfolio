-- Import each CSV (in order)
-- Display tables to check import
SELECT * FROM departments;
SELECT * FROM dept_emp;
SELECT * FROM dept_manager;
SELECT * FROM employees;
SELECT * FROM salaries;
SELECT * FROM titles;

-- Data Analysis
-- List employee number, last name, first name, sex, and salary of each employee
SELECT e.emp_no AS employee_number, e.last_name, e.first_name, e.sex, s.salary
FROM employees AS e
LEFT JOIN salaries AS s ON e.emp_no = s.emp_no;

-- List first name, last name, and hire date for employees who were hired in 1986
SELECT last_name, first_name, hire_date 
FROM employees 
WHERE hire_date >= '1986-01-01' AND hire_date < '1987-01-01';

-- List the manager of each department along with their 
-- department number, department name, employee number, last name, and first name.
SELECT e.last_name, e.first_name, 
	dm.dept_no AS department_number, dm.emp_no as employee_number,
	d.dept_name AS department_name
FROM dept_manager AS dm
LEFT JOIN employees AS e ON dm.emp_no = e.emp_no
LEFT JOIN departments AS d ON dm.dept_no = d.dept_no;

-- List the department number for each employee along with that employee’s 
-- employee number, last name, first name, and department name.
SELECT de.dept_no as department_number, e.emp_no as employee_number, 
		e.last_name, e.first_name, d.dept_name
FROM employees AS e
LEFT JOIN dept_emp AS de ON e.emp_no = de.emp_no
LEFT JOIN departments AS d ON de.dept_no = d.dept_no;

-- List first name, last name, and sex of each employee whose 
-- first name is Hercules and whose last name begins with the letter B.
SELECT last_name, first_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

-- List each employee in the Sales department, 
-- including their employee number, last name, and first name.
SELECT emp_no AS employee_number, last_name, first_name
FROM employees
WHERE emp_no IN(
	SELECT emp_no
	FROM dept_emp
	WHERE dept_no IN(
		SELECT dept_no
		FROM departments
		WHERE dept_name = 'Sales'));
		
-- List each employee in the Sales and Development departments, 
-- including their employee number, last name, first name, and department name.
SELECT de.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e
LEFT JOIN dept_emp AS de ON e.emp_no = de.emp_no
LEFT JOIN departments AS d ON de.dept_no = d.dept_no
WHERE dept_name = 'Sales' OR dept_name = 'Development';

-- List the frequency counts, in descending order, of all the employee last names 
-- (that is, how many employees share each last name).
SELECT last_name, COUNT(last_name) as last_name_count
FROM employees
GROUP BY last_name
ORDER BY last_name_count DESC;
