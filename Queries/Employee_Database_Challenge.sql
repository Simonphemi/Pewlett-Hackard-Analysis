--Deliverable 1

SELECT emp_no, first_name, last_name
FROM employees;

SELECT title, from_date, to_date
FROM titles;

SELECT emp.emp_no, emp.first_name,emp.last_name, t.title, t.from_date,t.to_date
INTO retirement_titles
FROM employees as emp
INNER JOIN titles as t
ON emp.emp_no = t.emp_no
WHERE emp.birth_date BETWEEN '1952-01-01' AND '1955-01-01' 
ORDER BY t.emp_no;
--drop table retirement_titles
SELECT * FROM retirement_titles;

SELECT DISTINCT ON (emp_no)emp_no,
first_name,
last_name,
title

INTO unique_titles
FROM retirement_titles
ORDER BY emp_no ASC, to_date DESC;

SELECT * FROM unique_titles;

SELECT COUNT (emp.title) AS ct, emp.title
INTO retiring_titles
FROM unique_titles as emp

GROUP BY emp.title
ORDER BY ct DESC; 
SELECT * FROM retiring_titles;

--deliverable 2
--Mentorship table
SELECT DISTINCT ON (emp.emp_no)emp.emp_no,
	emp.first_name, emp.last_name, emp.birth_date, de.from_date, de.to_date, ts.title
INTO mentorship_eligibility
FROM employees AS emp
INNER JOIN dept_emp AS de
ON emp.emp_no = de.emp_no
INNER JOIN titles AS ts
ON emp.emp_no = ts.emp_no
WHERE (emp.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
AND (de.to_date = '9999-01-01')
ORDER BY emp.emp_no;

SELECT * FROM mentorship_eligibility;