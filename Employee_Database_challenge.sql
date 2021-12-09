-- Queries Employee Database

SELECT e.emp_no, e.first_name, e.last_name, t.title, t.from_date, t.to_date
INTO retirement_titles
FROM employees AS e
INNER JOIN titles AS t
	ON (e.emp_no = t.emp_no)
-- Filter BirthDate
WHERE (e.birth_date BETWEEN ('1951-01-01') AND ('1955-12-31'))
ORDER BY e.emp_no;


-- Challenge Started Code 
-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (RT.emp_no) RT.emp_no,
RT.first_name,
RT.last_name,
RT.title

INTO unique_titles
FROM retirement_titles AS RT
ORDER BY RT.emp_no, RT.to_date DESC;

-- 
SELECT COUNT(UT.title), UT. title
INTO retiring_titles
FROM unique_titles AS UT
GROUP BY UT.title
ORDER BY COUNT DESC;

-- END DELIVERABLE 1

-- DELIVERABLE 2 
-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (e.emp_no) e.emp_no,
	e.first_name,
	e.last_name,
	e.birth_date,
	de.from_date,
	de.to_date,
	ti.title
INTO mentorship_eligibilty 
FROM employees AS e
INNER JOIN dept_emp as de
	ON(e.emp_no = de.emp_no)
INNER JOIN titles as ti
	ON(e.emp_no = ti.emp_no)
	

