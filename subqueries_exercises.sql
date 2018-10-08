
USE employees;

# Find all the employees with the
#  same hire date as employee 101010 using a sub-query.

SELECT concat(first_name, " ", last_name) as "Employees with the same hire date as employee #101010"
FROM employees
WHERE hire_date = (
  SELECT hire_date
  FROM employees
  where emp_no = 101010
);

# Find all the titles held by all employees with the first name Aamod.
SELECT distinct title
from titles WHERE emp_no in (
  select emp_no from employees
  where first_name = 'Aamod'
);

# Find all the current department managers that are female.
select first_name, last_name
from employees
WHERE gender = "F"
  AND
  emp_no in (
  SELECT emp_no
  from dept_manager
  where to_date > now()
);


# Find all the department names that currently have female managers.
# department names
# dept_manager to see who is a manager
# employees table to determine gender
SELECT dept_name
  from departments
  WHERE dept_no IN (
    select dept_no
    from dept_manager
    WHERE to_date > now()
          AND emp_no in (
      SELECT emp_no
      from employees
      where gender = 'F'
    )
  );

# Find the first and last name of the employee with the highest salary.
## Employee has many Salary
## any given salary belongs to one and only one employee
select first_name, last_name
from employees
where emp_no = (
  select emp_no
  from salaries
  where salary in (
    select max(salary)
    from salaries
  )
);

