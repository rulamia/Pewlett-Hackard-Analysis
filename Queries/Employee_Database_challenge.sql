--Retirement Titles (Not Dictinct)
Select e.emp_no, 
	e.first_name, 
	e.last_name, 
	ti.title, 
	ti.from_date, 
	ti.to_date
into retirement_titles
from employees as e
inner join titles as ti 
on (e.emp_no = ti.emp_no)
where (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no;
--------------------------------------------------
-- Distint employees with titles
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title
INTO unique_titles
FROM retirement_titles
WHERE to_date = '9999-01-01'
ORDER BY emp_no, to_date DESC;
--------------------------------------------------
--Count of Retireing Titles
Select count(title) as title_count, title
into retiring_titles
from unique_titles
group by title
order by title_count DESC;
--------------------------------------------------
--Mentorship Eligibility
select distinct on (e.emp_no) e.emp_no,
	e.first_name,
	e.last_name,
	e.birth_date,
	de.from_date,
	de.to_date,
	ti.title
into mentorship_eligibilty
from employees as e
join dept_emp as de on (e.emp_no = de.emp_no)
join titles as ti on (e.emp_no = ti.emp_no)
where (de.to_date = '9999-01-01') 
and (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
order by e.emp_no;
--------------------------------------------------
-- Mentorship Eligibility count by title
select count(title) as title_count, title
from mentorship_eligibilty
group by title;