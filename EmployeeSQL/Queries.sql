--Pewlett Hackard Employee Database Analysis--

--1. List the employee number, last name, first name, sex, and salary of each employee.

Select e.emp_no, e.last_name, e.first_name, e.sex, s.salary
From employees e
Join salaries s on e.emp_no = s.emp_no
Order by e.emp_no
;

--2. List the first name, last name, and hire date for the employees who were hired in 1986.

Select first_name, last_name, hire_date
From employees
Where date_part('year', hire_date) = 1986
Order by hire_date
;

--3. List the manager of each department along with their department number, department name, employee number, last name, and first name.

Select dm.dept_no, d.dept_name, dm.emp_no, e. last_name, e.first_name
From dept_manager as dm
Left Join departments as d on
dm.dept_no = d.dept_no
Left Join employees as e on 
dm.emp_no = e.emp_no
Order by emp_no
;
		
--4. List the department number for each employee along with that employee’s employee number, last name, first name, and department name.

Select e.emp_no, e.last_name, e.first_name, de.dept_no, d.dept_name
From employees e
Inner Join dept_emp de
On e.emp_no = de.emp_no
Inner Join departments d
On d.dept_no = de.dept_no
Order by e.emp_no
;


--5. List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.

Select first_name, last_name, sex
From employees
Where first_name = 'Hercules'
And last_name Like 'B%'
;

--6. List each employee in the Sales department, including their employee number, last name, and first name.

Select emp_no, last_name, first_name
From employees 
Where emp_no In
(	
	Select emp_no
	From dept_emp
	Where dept_no In
	(
		Select dept_no 
		From departments
		Where dept_name = 'Sales'
	)
);

--8. List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.

Select de.emp_no, e.last_name, e.first_name, d.dept_name
From employees e
Inner Join dept_emp de
On e.emp_no = de.emp_no
Inner Join departments d
On de.dept_no = d.dept_no
Where dept_name IN('Sales')
Or dept_name IN ('Development')
Order by emp_no
;

--9. List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).

Select last_name, count(last_name) as last_name_frequency
From employees
Group by last_name
Order by last_name_frequency Desc
;

