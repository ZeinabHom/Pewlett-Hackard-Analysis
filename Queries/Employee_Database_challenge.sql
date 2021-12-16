
SELECT e.emp_no,
       e.first_name,
       e.last_name,
       ti.title,
       ti.from_date,
       ti.to_date
INTO retirement_titles
FROM employees as e
INNER JOIN titles as ti
ON (e.emp_no = ti.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no ASC;



-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) 
	   		rt.emp_no,
      		rt.first_name,
       		rt.last_name,
      		 rt.title
INTO unique_titles
FROM retirement_titles as rt
ORDER BY emp_no ASC , to_date DESC;



SELECT title, COUNT(emp_no) 
FROM unique_titles 
INTO retiring_titles
GROUP BY title
ORDER BY COUNT DESC



SELECT DISTINCT ON (emp_no) 
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
		ON (e.emp_no = de.emp_no)
	INNER JOIN titles as ti 
		ON (e.emp_no = ti.emp_no)
	WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
		AND (de.to_date = '9999-01-01')
ORDER BY emp_no ASC;
