# Q61
SELECT e.emp_id, e.emp_name, e.dep_id, e.salary, d.dep_location
FROM employees e, department d 
WHERE e.dep_id = d.dep_id
AND EXTRACT(YEAR FROM e.hire_date)  = 1991 
AND (d.dep_location in ('SYDNEY','MELBOURNE')
AND e.salary BETWEEN 2000 and 5000)

# Q62
SELECT d.dep_id, e.emp_id, e.emp_name, e.salary, d.dep_name, d.dep_location, s.grade
FROM employees e, department d, salary_grade s
WHERE e.dep_id = d.dep_id
AND e.salary BETWEEN s.min_sal AND s.max_sal
AND s.grade in (3,4,5)
AND EXTRACT( YEAR FROM AGE(CURRENT_DATE, e.hire_date)) >= 25
AND (d.dep_name = 'MARKETING'
AND d.dep_location in ('MELBOURNE','PERTH'))

# Q63
SELECT * FROM employees e, employees m 
WHERE e.manager_id = m.emp_id
and e.hire_date < m.hire_date

# Q64
SELECT e.*, s.* FROM
employees e, salary_grade s
WHERE e.salary BETWEEN s.min_sal and s.max_sal
AND s.grade = 4 

# Q65
SELECT e.emp_name FROM employees e ,department d
WHERE e.dep_id = d.dep_id
AND e.hire_date > '1991-12-31'
AND (e.emp_name NOT IN ('MARKER','ADELYN') and d.dep_location NOT IN ('PRODUCTION ','AUDIT'))

# Q66
SELECT * from employees order by salary ASC

# Q67
SELECT * from employees ORDER BY dep_id ASC, job_name DESC

# Q68
SELECT DISTINCT * from employees ORDER BY job_name desc

# Q69
SELECT emp_id, emp_name, salary, salary/30 "Daily_Salary", 12 * salary "Annual_Salary"
FROM employees ORDER BY  12 * salary ASC

# Q70
SELECT * FROM employees WHERE job_name in ('CLERK','ANALYST') ORDER BY job_name DESC

# Q71
SELECT d.dep_location FROM department d, employees e
WHERE e.dep_id = d.dep_id
AND e.emp_name = 'CLARE'

# Q72
SELECT * FROM employees 
WHERE hire_date IN ('1991-05-01','1991-12-03','1990-01-19')
ORDER BY hire_date ASC

# Q73 
SELECT * from employees
WHERE salary < 1000 ORDER BY salary ASC

# Q74
SELECT * FROM employees ORDER BY salary ASC 

# Q75
SELECT * FROM employees ORDER BY job_name ASC, emp_id DESC 

# Q76
SELECT DISTINCT job_name FROM employees WHERE dep_id IN (2001,3001) ORDER BY job_name DESC

# Q77
SELECT * FROM employees WHERE job_name NOT IN ('PRESIDENT', 'MANAGER')  ORDER BY salary ASC

# Q78
SELECT * FROM employees WHERE 12 * salary < 25000 ORDER BY salary ASC

# Q79
SELECT emp_id, emp_name, 12 * salary "Annual Salary", 12 * salary/365 "Daily Salary" FROM employees WHERE job_name = 'SALESMAN' ORDER BY 12 * salary ASC

# Q80
SELECT emp_id, emp_name, hire_date, CURRENT_DATE, AGE(CURRENT_DATE, hire_date) exp 
FROM employees ORDER BY exp ASC

# Q81
SELECT * FROM employees WHERE hire_date BETWEEN '1991-06-30' and '1991-12-31' ORDER BY job_name ASC

# Q82
SELECT e.*, d.* FROM employees e, department d 
WHERE e.dep_id = d.dep_id
AND d.dep_name in ('FINANCE','AUDIT')
ORDER BY d.dep_id ASC

# Q83
SELECT e.*, s.* FROM employees e, salary_grade s
WHERE e.salary BETWEEN s.min_sal and s.max_sal
ORDER BY s.grade ASC

# Q84
SELECT e.emp_name, e.job_name, d.dep_name, e.salary, s.grade
FROM employees e, department d, salary_grade s
WHERE e.salary BETWEEN s.min_sal AND s.max_sal
ORDER BY d.dep_id ASC

# Q85
SELECT e.emp_name, e.job_name, e.salary, s.grade, d.dep_name 
FROM employees e, salary_grade s, department d
WHERE e.dep_id = d.dep_id 
AND e.job_name != 'CLERK'
AND e.salary BETWEEN s.min_sal AND s.max_sal
ORDER BY e.salary DESC

# Q86 
SELECT e.emp_id, e.emp_name, e.salary, d.dep_name, s.grade, 
AGE(CURRENT_DATE, e.hire_date) Experience, 
(12 * salary) Annual_Salary
FROM employees e, department d, salary_grade s 
WHERE e.dep_id = d.dep_id
AND e.salary BETWEEN s.min_sal AND s.max_sal
AND e.dep_id NOT IN (1001,2001)

# Q87
SELECT e.*, d.* 
FROM employees e, department d
WHERE e.dep_id = d.dep_id 

# Q88
SELECT * 
FROM employees e, employees m
WHERE e.manager_id = m.emp_id
AND e. hire_date < m.hire_date

# Q89
SELECT emp_id, emp_name, salary, dep_id
FROM employees
WHERE dep_id = 1001
ORDER BY salary ASC

# Q90
SELECT MAX(salary) from employees

# Q91
SELECT DISTINCT e.job_name, AVG(e.salary), AVG(e.salary + e.commission) 
FROM employees e group by e.job_name

# Q92
SELECT DISTINCT e.job_name, sum(12 * e.salary)
FROM employees e
WHERE to_char(e.hire_date, 'yyyy') = '1991'
GROUP BY e.job_name

# Q93
SELECT e.emp_id, e.emp_name, d.dep_id, d.dep_location
FROM employees e, department d
WHERE e.dep_id = d.dep_id

# Q94
SELECT e.emp_id, e.emp_name, d.dep_id, d.dep_location, d.dep_name
FROM employees e, department d
WHERE e.dep_id = d.dep_id
AND e.dep_id IN (1001,2001)

# Q95
SELECT e.emp_id, e.emp_name, e.salary, s.grade
FROM employees e, salary_grade s
WHERE e.salary BETWEEN s.min_sal AND s.max_sal

# Q96
SELECT w.manager_id , count(*)
FROM employees w, employees e WHERE
w.manager_id = e.emp_id 
group by w.manager_id
ORDER BY w.manager_id ASC

# Q97
SELECT dep_id,
       job_name,
       count(*)
FROM employees
GROUP BY dep_id,
         job_name;

# Q98
SELECT dep_id, count(*) FROM
employees GROUP BY dep_id HAVING count(*) >= 2

# Q99
SELECT s.grade, count(*), MAX(e.salary) 
FROM employees e, salary_grade s
WHERE e.salary BETWEEN s.min_sal AND s.max_sal
GROUP BY s.grade 

# Q100
SELECT d.dep_name, s.grade, count(e.*) 
FROM employees e, department d, salary_grade s
WHERE e.dep_id = d.dep_id
and job_name = 'SALESMAN'
AND e.salary BETWEEN s.min_sal AND s.max_sal
GROUP BY d.dep_name,s.grade
HAVING  count(*) >= 2

# Q101
SELECT dep_id, count(*)
FROM employees GROUP BY dep_id HAVING count(*) < 4

# Q102
SELECT d.dep_name, count(*) 
FROM employees e, department d
WHERE e.dep_id = d.dep_id 
GROUP BY d.dep_name HAVING count(*) >= 2

# Q103
SELECT emp_id, count(emp_id) 
FROM employees
GROUP BY emp_id 

# Q104
SELECT count(*), AVG(salary), dep_id, job_name
FROM employees
GROUP BY dep_id, job_name

# Q105
SELECT emp_name
FROM employees
WHERE emp_name LIKE 'A%'
AND LENGTH(emp_name) = 6

# Q106
SELECT *
FROM employees
WHERE LENGTH(emp_name) = 6
AND emp_name LIKE '__R%'

# Q107
SELECT *
FROM employees
WHERE LENGTH(emp_name) = 6
AND emp_name LIKE 'A%N'

# Q108
SELECT *
FROM employees
WHERE lower(to_char(hire_date,'MON')) LIKE '_a%'

# Q109
SELECT *
FROM employees
WHERE emp_name LIKE '%AR%'

# Q110
SELECT *
FROM employees
WHERE hire_date BETWEEN '1990-01-01' AND '1999-12-31'

# Q111
SELECT emp_id, TRIM(to_char(emp_id, '99999')) btrim
FROM employees
WHERE to_char(emp_id, '99999') NOT LIKE '68%'

# Q112
SELECT *
FROM employees
WHERE emp_name LIKE '%A%'

# Q113
SELECT *
FROM employees
WHERE emp_name LIKE '%S'
AND LENGTH(emp_name) = 6

# Q114
SELECT *
FROM employees
WHERE to_char(hire_date,'MONTH') LIKE '%A%'

# Q115
SELECT *
FROM employees
WHERE to_char(hire_date,'MONTH') LIKE '_A%'