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
SELECT length(TRIM(emp_name)) FROM employees

# Q9
SELECT emp_id, salary, commission FROM employees

# Q10
SELECT DISTINCT dep_id, job_name FROM employees

# Q11 
SELECT * FROM employees WHERE dep_id != 2001

# Q12
SELECT * FROM employees WHERE hire_date < '1991-01-01'

# Q13
SELECT AVG(salary) FROM employees WHERE job_name = 'ANALYST'

# Q14
SELECT * FROM employees WHERE emp_name = 'BLAZE'

# Q15
SELECT * FROM employees WHERE commission > salary

# Q16
SELECT * FROM employees WHERE (salary * 1.25) > 3000

# Q17
SELECT emp_name FROM employees WHERE LENGTH(emp_name) = 6

# Q18 
SELECT * FROM employees WHERE EXTRACT(MONTH FROM hire_date) = 1

# Q19
SELECT  e.emp_name|| ' work for ' ||m.emp_name  
FROM employees e, employees m 
WHERE e.manager_id = m.emp_id 

# Q20
SELECT * FROM employees WHERE UPPER(job_name) = 'CLERK'

# Q21
SELECT *
FROM employees
WHERE EXTRACT(YEAR
              FROM age(CURRENT_DATE, hire_date)) > 27;

# Q22
SELECT * FROM employees WHERE salary < 3500

# Q23
SELECT name, job_name, salary FROM employees WHERE UPPER(job_name) = 'ANALYST'

# Q24
SELECT * FROM employees WHERE EXTRACT(YEAR FROM hire_date) = 1991

# Q25
SELECT emp_id, emp_name, hire_date, salary FROM employees WHERE hire_date < '1991-04-01'

# Q26
SELECT emp_name, job_name FROM employees WHERE manager_id IS NULL

# Q27
SELECT * FROM employees WHERE hire_date = '1991-05-01'

# Q28
SELECT emp_id, emp_name, salary , AGE(CURRENT_DATE, hire_date) AS experience 
FROM employees 
WHERE manager_id = 68319

# Q29
SELECT emp_id, emp_name, salary , AGE(CURRENT_DATE, hire_date) AS experience 
FROM employees
WHERE salary * 12 / 365 > 100

# Q30
SELECT emp_name FROM employees WHERE hire_date + interval '96 months' > '1999-12-31'

# Q31
SELECT * FROM employees WHERE MOD(salary, 2) != 0

# Q32
SELECT * FROM employees WHERE LENGTH(TRIM(to_char(salary,'9999'))) = 3 

# Q33
SELECT * FROM employees WHERE EXTRACT(MONTH FROM hire_date) = 4

# Q34
SELECT * FROM employees WHERE EXTRACT(DAY FROM hire_date) < 19

# Q35
SELECT * FROM employees WHERE upper(job_name) = 'SALESMAN' 
AND EXTRACT(MONTH FROM AGE(CURRENT_DATE, hire_date)) > 10

# Q36
SELECT * FROM employees WHERE dep_id IN (3001, 1001)
AND EXTRACT(YEAR FROM hire_date) = 1991

# Q37
SELECT * FROM employees WHERE dep_id IN (1001, 2001)

# Q38
SELECT * FROM employees WHERE UPPER(job_name) = 'CLERK' AND dep_id = 2001 

# Q39
SELECT emp_id, emp_name, salary, job_name 
FROM employees
WHERE commission < salary 
AND (salary * 12 + commission) < 34000 
AND UPPER(job_name) = 'SALESMAN' 
AND dep_id = '3001'

# Q40
SELECT * from employees WHERE upper(job_name) IN ('CLERK', 'MANAGER')

# Q41
SELECT * FROM employees WHERE EXTRACT(MONTH FROM hire_date) != 2

# Q42
SELECT * FROM employees WHERE EXTRACT(YEAR FROM hire_date) = 1991

# Q43 
SELECT * FROM employees WHERE hire_date BETWEEN '1991-06-01' AND '1991-06-30'

# Q44
SELECT * FROM employees WHERE  salary * 12 BETWEEN 24000 AND 50000 

# Q45
SELECT * FROM employees 
WHERE to_char(hire_date,'yyyy-mm-dd') IN ('1991-05-01' ,'1991-02-20','1991-12-03')

# Q46
select * from employees WHERE manager_id IN (63679, 68319, 66564, 69000)

# Q47
SELECT * FROM employees WHERE hire_date BETWEEN '1991-07-01' AND '1991-12-31'

# Q48 
SELECT * FROM employees WHERE hire_date BETWEEN '1990-01-01' AND '1999-12-31'

# Q49
SELECT * FROM employees WHERE job_name = 'MANAGER' AND dep_id IN ('1001', '2001')

# Q50
SELECT * FROM employees WHERE to_char(hire_date,'mm') = '02' AND salary BETWEEN 1001 AND 2000

# Q51 
SELECT * FROM employees WHERE hire_date < '1991-01-01' OR hire_date > '1991-12-31'

# Q52
SELECT e.emp_id, e.emp_name, e.job_name, e.manager_id, e.hire_date, e.salary, e.commission, d.dep_id, d.dep_name
FROM employees e, department d
WHERE e.dep_id = d.dep_id

# Q53
SELECT e.emp_name, e.job_name, (e.salary * 12) "Annual Salary", d.dep_id, s.grade
FROM employees e, department d, salary_grade s
WHERE e.dep_id = d.dep_id
AND e.salary BETWEEN s.min_sal AND s.max_sal
AND (((12 * e.salary) >= 60000) OR (e.job_name != 'ANALYST'))

# Q54
SELECT e.emp_name, e.job_name, e.manager_id, e.salary, m.emp_name, m.salary
FROM employees e, employees m 
WHERE e.manager_id = m.emp_id
AND e.salary > m.salary 

# Q55
SELECT e.emp_name, e.dep_id, e.salary, e.commission
FROM employees e, department d WHERE
e.dep_id = d.dep_id
AND d.dep_location = 'PERTH'
AND e.salary BETWEEN 2000 AND 5000 

# Q56
SELECT s.grade, e.emp_name 
FROM employees e, salary_grade s
WHERE e.dep_id IN (1001, 3001) 
AND (e.salary BETWEEN s.min_sal AND s.max_sal
AND s.grade NOT in (4))
AND e.hire_date < '1992-12-31'
ORDER BY s.grade ASC

# Q57
SELECT e.emp_id, e.emp_name, e.job_name, e.manager_id, e.hire_date, e.dep_id, m.emp_name
FROM employees e, employees m 
WHERE e.manager_id = m.emp_id 
AND m.emp_name = 'JONAS'

# Q58
SELECT e.emp_name , s.max_sal 
FROM employees e, salary_grade s
WHERE e.emp_name = 'FRANK'
AND e.salary BETWEEN s.min_sal AND s.max_sal 

# Q59
SELECT * FROM employees
WHERE job_name IN ('MANAGER','ANALYST')
AND salary BETWEEN 2000 AND 5000

# Q60
SELECT e.emp_id, e.emp_name, e.dep_id, e.salary, d.dep_location
FROM employees e, department d
WHERE e.dep_id = d.dep_id
AND d.dep_location in ('PERTH','MELBOURNE')
AND EXTRACT(MONTH FROM AGE(CURRENT_DATE, e.hire_date)) > 10