## Pewlett-Hackard-Analysis

The purpose of this project is to determine the number of retiring employees per title, and identify employees who are eligible to participate in a mentorship program.
Retirement criteria is; 

	 - Employees who were born between January 1, 1952 and December 31, 1955 

Mentorship criteria is;
 

	 - The current employees who were born between January 1, 1965 and December 31, 1965	
	  
### The Number of Retiring Employees by Title
Two database( employees & titles ) are used in this part. The primary key in employees table is emp_no and it is a foreign key in titles table.

	 - SELECT  e.emp_no,
			   e.first_name,
			   e.last_name,
			   ti.title,
			   ti.from_date,
			   ti.to_date
		INTO retirement_titles
		FROM employees as e
		INNER JOIN titles as ti
		ON (e.emp_no  =  ti.emp_no)
		WHERE (e.birth_date  BETWEEN  '1952-01-01'  AND  '1955-12-31')
		ORDER BY emp_no ASC;

A retirement_titles  table is created in this part  that shows all the titles of employees who were born between January 1, 1952 and December 31, 1955.
Then because  some employees may have multiple titles in the database, we need to remove duplicated or repeated employee.
We can use DISTINCT ON statement to create table with last title of each employee. The below query is used;

	 - SELECT DISTINCT  ON (emp_no)
				 rt.emp_no,
				 rt.first_name,
				 rt.last_name,
				 rt.title
			INTO unique_titles
			FROM retirement_titles as rt
			ORDER BY emp_no ASC , to_date DESC;

The below query is used to make a table that shows number of retirement employees in each title

	 - SELECT title, COUNT(emp_no)
		 FROM unique_titles
		 INTO retiring_titles
		 GROUP BY title
		 ORDER BY  COUNT  DESC

### The Employees Eligible for the Mentorship Program
The purpose of this part is to create a mentorship-eligibility table that shows the current employees who were born between January 1, 1965 and December 31, 1965. Three databases are used in this part (employees, dept_emp & titles). The primary key in employee table is emp_no that it is foriegn key in titles and dept_emp tables. the below query is used in this part;

		SELECT DISTINCT  ON (emp_no)
					e.emp_no,
					e.first_name,
					e.last_name,
					e.birth_date,
					de.from_date,
					de.to_date,
					ti.title
			INTO mentorship_eligibilty
			FROM employees as e
			INNER JOIN dept_emp as de
			ON (e.emp_no  =  de.emp_no)
			INNER JOIN titles as ti
			ON (e.emp_no  =  ti.emp_no)
			WHERE (e.birth_date  BETWEEN  '1965-01-01'  AND  '1965-12-31')
			AND (de.to_date  =  '9999-01-01')
			ORDER BY emp_no ASC;

### Results
In first part of this project, we find below results as follows;

	 - The list of retirement-age employees with their last title. 

	 - Total number of retirement-age employees for each title.

In second part of this project, The mentorship-eligibility table is created to show number of retirement-age employees who are eligible to participate in a mentorship program.

### Summary

How many roles will need to be filled as the "silver tsunami" begins to make an impact
The below table shows that the number of retirement- age employees in each departments. Development and production departments have the maximum  of retirement- age employees. Finance department has the minimum of retirement- age employees.
```
![Alt text](C:\Users\zeina\Desktop\3.png?raw=true)
```
Are there enough qualified, retirement-ready employees in the departments to mentor the next generation of Pewlett Hackard employees?
The below table shows the number of  mentorship eligible for each department, the maximum number is 396 for development department and  the minimum number is 64 for finance department.

![Alt text](C:\Users\zeina\Desktop/5.png?raw=true)
