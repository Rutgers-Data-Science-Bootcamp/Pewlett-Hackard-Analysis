-- Deliverable 1: The Number of Retiring Employees by Title 
--Steps 1-8;
SELECT e.emp_no,
       e.first_name,
       e.last_name,
ti.title,
ti.from_date,
ti.to_date
INTO retirement_titles
FROM employees AS e
INNER JOIN titles as ti
ON (e.emp_no = ti.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31') 
ORDER BY e.emp_no;


-- Use Dictinct with Orderby to remove duplicate rows
--Step 9: Retrieve the employee number, first and last name, and title columns from the Retirement Titles table.
--FROM retirement_titles AS rt
--Step 10-14: 
SELECT DISTINCT ON (rt.emp_no) rt.emp_no,
       rt.first_name,
       rt.last_name,
       rt.title
       --rt.to_date
INTO unique_titels
FROM retirement_titles AS rt
WHERE rt.to_date ='9999-01-01'
ORDER BY rt.emp_no, rt.title DESC;
SELECT * FROM unique_titels;
--Step 16 retrieve the number of employees by their most recent job title who are about to retire
SELECT COUNT(ut.emp_no),
             ut.title
INTO retiring_titles
FROM unique_titels AS ut
GROUP BY ut.title
ORDER BY COUNT(title) DESC;

SELECT * FROM retiring_titles;

--Deliverable 2 The Employees Eligible for the Mentorship Program
SELECT DISTINCT ON (e.emp_no) e.emp_no,
       e.first_name,
       e.last_name,
       e.birth_date,
       de.from_date,
       de.to_date,
       ti.title
INTO mentorship_eligibles
FROM employees AS e
INNER JOIN dept_emp AS de
ON (e.emp_no = de.emp_no)
INNER JOIN titles AS ti
ON (e.emp_no = ti.emp_no)
WHERE (de.to_date = '9999-01-01') AND
      (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY emp_no;

SELECT * FROM mentorship_eligibles;




       
