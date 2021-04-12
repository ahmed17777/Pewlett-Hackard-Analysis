-- DELIVERABLE 1 

-- Retrieve the emp_no, first_name, and last_name columns from the Employees table.
SELECT e.emp_no,
e.first_name,
e.last_name,
-- Retrieve the title, from_date, and to_date columns from the Titles table.
t.title,
t.from_date,
t.to_date
-- Create a new table using the INTO clause.
INTO retirement_titles
-- Join both tables on the primary key.
FROM employees as e
INNER JOIN titles AS t
ON (e.emp_no = t.emp_no)
-- Filter the data on the birth_date column to retrieve the employees who were born between 1952 and 1955. Then, order by the employee number.
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no ASC;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (r.emp_no) r.emp_no,
r.first_name,
r.last_name,
r.title
INTO unique_titles
FROM retirement_titles as r 
ORDER BY emp_no ASC, to_date DESC;

-- Retrieve the number of titles from the Unique Titles table.
SELECT COUNT(ut.emp_no), ut.title 
-- Create a Retiring Titles table to hold the required information
INTO retiring_titles 
FROM unique_titles as ut 
GROUP BY title 
ORDER BY COUNT(title) DESC; 

SELECT * FROM retiring_titles;

-- DELIVERABLE 2 

-- Retrieve the emp_no, first_name, last_name, and birth_date columns from the Employees table.
SELECT DISTINCT ON (em.emp_no) em.emp_no, 
em.first_name, 
em.last_name, 
em.birth_date, 
-- Retrieve the from_date and to_date columns from the Department Employee table.
de.from_date, 
de.to_date, 
-- Retrieve the title column from the Titles table.
ti.title
-- Create a new table using the INTO clause.
INTO mentorship_eligible 
-- Join the Employees and the Department Employee tables on the primary key.
FROM employees AS em
LEFT JOIN dept_employees AS de
ON em.emp_no = de.emp_no
-- Join the Employees and the Titles tables on the primary key.
LEFT JOIN titles AS ti
ON em.emp_no = ti.emp_no
-- Filter the data on the to_date column to get current employees whose birth dates are between January 1, 1965 and December 31, 1965. 
WHERE (em.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
AND (de.to_date = '9999-01-01')
-- Order the table by the employee number.
ORDER BY em.emp_no;


SELECT * FROM mentorship_eligible; 