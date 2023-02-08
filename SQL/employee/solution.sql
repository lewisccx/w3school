# Q1
SELECT * FROM employees

# Q2
SELECT salary from employees

# Q3
SELECT DISTINCT job_name FROM employees

# Q4
SELECT emp_name, CONCAT('$ ', ROUND(salary * 1.15)) AS salary FROM employees

# Q5
SELECT emp_name|| '     ' ||job_name AS "Employee & Job" FROM employees

# Q6
SELECT emp_name||' '|| CONCAT('(',job_name,')') AS "Employee" FROM employees

# Q7
SELECT emp_id, emp_name, salary, to_char(hire_date,'MONTH DD, YYYY') FROM employees 

# Q8
SELECT length(trim(emp_name)) FROM employees

# Q9
SELECT emp_id, salary, commission from employees

# Q10
SELECT DISTINCT dep_id, job_name from employees