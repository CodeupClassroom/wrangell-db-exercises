use employees;

SELECT first_name, last_name, birth_date
FROM employees
WHERE emp_no IN (
                SELECT emp_no
                FROM dept_manager
                )
LIMIT 10;

SELECT first_name, last_name, birth_date
FROM employees e
       join dept_manager dm on dm.emp_no = e.emp_no
LIMIT 10;

SELECT first_name, last_name, birth_date
FROM employees
WHERE emp_no IN (110022, 110039, 110085)
LIMIT 10;

-- employees that make less than 40k

select e.first_name, e.last_name
from employees e
where e.emp_no in (
                  select emp_no from salaries where salary < 40000 and to_date > now()
                  );
