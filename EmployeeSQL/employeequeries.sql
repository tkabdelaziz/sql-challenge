-- 1. List the following details of each employee: employee number, last name, first name, gender, and salary
-- Need to use JOIN employees and salaries
SELECT emp.emp_no,emp.firstname,emp.lastname,emp.gender,s.salary
FROM employees AS emp
INNER JOIN salaries AS s
ON emp.emp_no = s.emp_num;

-- 2. List employees who were hired in 1986
SELECT firstname, lastname,hire_date FROM employees WHERE (date_part('year', hire_date) = 1986);

-- 3. List the manager of each department with the following information: 
-- department number, department name, the manager's employee number, last name, first name, and start and end employment dates.
-- JOIN departments, dept_manager, and employees
SELECT dept.*,deptman.emp_no,deptman.from_date,deptman.to_date,emp.firstname,emp.lastname
FROM departments AS dept
INNER JOIN dept_manager AS deptman
ON dept.dept_no = deptman.dept_no

INNER JOIN employees AS emp
ON deptman.emp_no = emp.emp_no;

-- 4. List the department of each employee with the following information: 
-- employee number, last name, first name, and department name
-- JOIN departments, dept_emp, and employees
SELECT dept.dept_name,deptemp.emp_no,emp.firstname,emp.lastname
FROM departments AS dept
INNER JOIN dept_emp AS deptemp
ON dept.dept_no = deptemp.dept_no

INNER JOIN employees AS emp
ON deptemp.emp_no = emp.emp_no;

-- 5. List all employees whose first name is "Hercules" and last names begin with "B."
SELECT firstname, lastname FROM employees 
WHERE firstname = 'Hercules'
AND lastname LIKE 'B%';

-- 6. List all employees in the Sales department:
-- employee number, last name, first name, and department name
-- JOIN departments, dept_emp, and employees
SELECT dept.dept_name,deptemp.emp_no,emp.firstname,emp.lastname
FROM departments AS dept
INNER JOIN dept_emp AS deptemp
ON dept.dept_no = deptemp.dept_no

INNER JOIN employees AS emp
ON deptemp.emp_no = emp.emp_no
WHERE dept.dept_name = 'Sales';

-- 7. List all employees in the Sales and Development departments:
-- employee number, last name, first name, and department name
-- JOIN departments, dept_emp, and employees
SELECT dept.dept_name,deptemp.emp_no,emp.firstname,emp.lastname
FROM departments AS dept
INNER JOIN dept_emp AS deptemp
ON dept.dept_no = deptemp.dept_no

INNER JOIN employees AS emp
ON deptemp.emp_no = emp.emp_no
WHERE dept.dept_name = 'Sales'
OR dept.dept_name = 'Development';

-- 8. In descending order, list the frequency count of employee last names
-- i.e. how many employees share each last name
-- COUNT(*)
SELECT lastname, COUNT(*) As "Frequency Count"
FROM employees
GROUP BY lastname
ORDER BY "Frequency Count" Desc;

