# Q1

SELECT *
FROM employees
WHERE emp_id IN
    (SELECT manager_id
     FROM employees);

# Q2

SELECT emp_id,
       emp_name,
       job_name,
       hire_date,
       AGE(CURRENT_DATE, hire_date) experience
FROM employees
WHERE emp_id IN
    (SELECT manager_id
     FROM employees)# Q3

  SELECT e.emp_id,
         e.emp_name,
         e.salary,
         d.dep_name
  FROM employees e,
       department d WHERE d.dep_location IN ('SYDNEY',
                                             'PERTH')--  working in ‘SYDNEY’ or ‘PERTH’

  AND e.dep_id = d.dep_id
  AND e.emp_id IN
    (SELECT e.emp_id
     FROM employees e
     WHERE e.job_name IN ('MANAGER',
                          'ANALYST')-- work as 'MANAGERS' and 'ANALYST'

       AND (DATE_PART('year', CURRENT_DATE)-DATE_PART('year', hire_date))> 5
       AND e.commission IS NULL --    an experience more than 5 years without receiving the commission.
 )
ORDER BY d.dep_location ASC;

-- ascending order by department location
 # Q4

SELECT e.emp_id,
       e.emp_name,
       e.salary,
       d.dep_name,
       d.dep_location,
       d.dep_id,
       e.job_name
FROM employees e,
     department d
WHERE (d.dep_location = 'SYDNEY'
       OR d.dep_name= 'FINANCE')--    employees work at SYDNEY or working in the FINANCE department

  AND e.dep_id = d.dep_id
  AND e.emp_id IN
    (SELECT e.emp_id
     FROM employees e
     WHERE e.salary NOT IN (3000,
                            2800)--   monthly salary should not be 3000 or 2800

       AND e.salary * 12 > 28000 -- annual salary above 28000

       AND e.job_name != 'MANAGER' -- do not work as a MANAGER

       AND (trim(to_char(e.emp_id,'99999')) LIKE '__3%'
            OR trim(to_char(e.emp_id,'99999')) LIKE '__7%')--  whose ID contain a digit of '3' or '7' in 3rd position.
)
ORDER BY d.dep_id ASC,
         e.job_name DESC -- Sort the result-set in ascending order by department ID and descending order by job name.
 # Q5

SELECT *
FROM employees e,
     salary_grade s
WHERE e.salary BETWEEN s.min_sal AND s.max_sal
  AND s.grade IN (2,
                  3);

# Q6

SELECT *
FROM employees e,
     salary_grade s
WHERE e.salary BETWEEN s.min_sal AND s.max_sal
  AND s.grade IN (4,
                  5)
  AND e.emp_id IN
    (SELECT e.emp_id
     FROM employees e
     WHERE job_name IN ('ANALYST',
                        'MANAGER'));

# Q7

SELECT *
FROM employees
WHERE salary >
    (select salary
     FROM employees
     WHERE emp_name = 'JONAS');

# Q8

SELECT *
from employees
WHERE job_name =
    (select job_name
     FROM employees
     WHERE emp_name = 'FRANK');

# Q9

SELECT *
from employees
WHERE hire_date <
    (select hire_date
     FROM employees
     WHERE emp_name = 'ADELYN'); 


# Q10
SELECT *  FROM employees WHERE dep_id = 2001 AND job_name IN
(SELECT job_name FROM employees WHERE dep_id = 1001)

# Q11
SELECT * FROM employees where salary IN 
(SELECT salary FROM employees e WHERE (emp_name = 'FRANK' OR emp_name = 'SANDRINE')
AND employees.emp_id <> e.emp_id)
ORDER BY salary DESC; 

# Q12
SELECT * from employees WHERE job_name = 
(SELECT job_name FROM employees e WHERE e.emp_name = 'MARKER' AND employees.emp_id <> e.emp_id) 
OR salary > (SELECT salary FROM employees e WHERE e.emp_name= 'ADELYN' AND employees.emp_id <> e.emp_id)

# Q13
SELECT * FROM employees WHERE salary > 
(SELECT max(salary + commission) FROM employees WHERE job_name = 'SALESMAN' ) 

SELECT * FROM employees, department WHERE hire_date < 
(SELECT hire_date FROM employees WHERE emp_name = 'BLAZE') 
AND employees.dep_id = department.dep_id
AND department.dep_location IN ('PERTH','BRISBANE')

# Q15
SELECT * FROM employees e, department d, salary_grade s 
WHERE e.salary BETWEEN s.min_sal and s.max_sal
AND e.dep_id = d.dep_id
AND s.grade IN (3,4)
AND d.dep_name IN ('FINANCE','AUDIT')
AND e.salary > (select m.salary from employees m where m.emp_name = 'ADELYN')
AND e.hire_date < (select m.hire_date from employees m where m.emp_name = 'FRANK')
ORDER BY e.hire_date ASC;

# Q16
SELECT * FROM employees WHERE job_name IN (
     SELECT job_name FROM employees WHERE emp_name IN ('SANDRINE ','ADELYN'))
)

# Q17
SELECT job_name FROM employees e WHERE dep_id = 1001 
AND job_name NOT IN (SELECT job_name FROM employees e WHERE dep_id = 2001)

# Q18
select * FROM employees where salary
= (select max(salary) from employees)

# Q19
select * FROM employees e
where salary
= (select max(salary) from employees e, department d WHERE e.dep_id = d.dep_id AND d.dep_name = 'MARKETING')

# Q20
SELECT e.emp_id, e.emp_name, e.job_name, e.hire_date,e.salary
FROM employees e
WHERE e.dep_id IN
    (SELECT d.dep_id
     FROM department d
     WHERE d.dep_location = 'PERTH')
  AND e.hire_date IN
    (SELECT max(hire_date)
     FROM employees
     WHERE emp_id IN
         (SELECT emp_id
          FROM employees e,
               salary_grade s
          WHERE e.salary BETWEEN s.min_sal AND s.max_sal
            AND s.grade = 3)) ;

# Q21
SELECT * FROM employees
WHERE hire_date < (
	select max(hire_date) from employees where manager_id = (
			select emp_id from employees where emp_name = 'KAYLING'))

# Q22
SELECT *
FROM employees
WHERE dep_id IN
    (SELECT dep_id
     FROM department
     WHERE department.dep_location ='SYDNEY')
  AND emp_id IN
    (SELECT emp_id
     FROM employees e,
          salary_grade s
     WHERE e.salary BETWEEN s.min_sal AND s.max_sal
       AND s.grade IN (3,
                       4,
                       5) )
  AND job_name != 'PRESIDENT'
  AND salary >
    (SELECT max(salary)
     FROM employees
     WHERE dep_id IN
         (SELECT dep_id
          FROM department
          WHERE department.dep_location = 'PERTH')
       AND job_name IN ('MANAGER',
                        'SALESMAN')
       AND manager_id NOT IN
         (SELECT emp_id
          FROM employees
          WHERE emp_name = 'KAYLING'));

# Q23
SELECT * FROM employees WHERE hire_date IN (
     SELECT min(hire_date) from employees 
     WHERE EXTRACT(YEAR FROM hire_date) = 1991)

# Q24
SELECT * FROM employees
WHERE job_name IN (SELECT job_name FROM employees 
WHERE hire_date IN (
	select min(hire_date) from employees where to_char(hire_date,'yyyy') = '1991'))

# Q25
select * FROM employees where
hire_date IN (select min(hire_date) from employees
WHERE manager_id = (
     SELECT e.emp_id FROM employees e, salary_grade s WHERE emp_name = 'KAYLING'
     AND e.salary between s.min_sal and s.max_sal
     AND s.grade IN (4,5) 
	)
			  )

# Q26 
SELECT sum(salary) from employees 
where job_name IN (
     select job_name FROM employees 
     WHERE job_name = 'MANAGER')

# Q27
SELECT sum(salary) from employees 
WHERE salary BETWEEN (
      (SELECT emp_id
     FROM employees e,
          salary_grade s
     WHERE e.salary BETWEEN s.min_sal AND s.max_sal
       AND s.grade = 3);

# Q28
SELECT * from employees 
WHERE dep_id = 100 AND salary > (
SELECT AVG(salary) from employees
WHERE dep_id = 2001)

# Q29
SELECT d.dep_id, d.dep_name, d.dep_location, count(*)
FROM employees e, department d 
WHERE e.dep_id = d.dep_id group by d.dep_id
HAVING count(*) = (SELECT max(mycount) FROM (select count(*) mycount from employees GROUP BY dep_id) a )

# Q30 
SELECT * FROM employees 
WHERE manager_id = (SELECT emp_id FROM employees WHERE emp_name = 'JONAS') 

# Q31
SELECT * FROM employees WHERE dep_id NOT IN
(SELECT dep_id from department WHERE dep_name = 'MARKETING')

# Q32
SELECT e.emp_name, e.job_name, d.dep_name, d.dep_location 
FROM employees e, department d WHERE e.dep_id = d.dep_id
AND e.emp_id IN (SELECT manager_id FROM employees)

# Q33
SELECT d.dep_name, e.emp_name, e.salary
FROM department d, employees e
WHERE e.dep_id = d.dep_id
and (e.dep_id, e.salary) IN
(
	select e.dep_id, max(e.salary) as salary from employees e group by e.dep_id
)

# Q34
SELECT *
FROM employees
WHERE salary >=
    (SELECT (max(salary)+min(salary))/2
     FROM employees);

# Q35
SELECT *
FROM employees m
WHERE m.emp_id IN
    (SELECT manager_id
     FROM employees)
  AND m.salary >
    (SELECT avg(e.salary)
     FROM employees e
     WHERE e.manager_id = m.emp_id );

# Q36
SELECT *
FROM employees w,
     employees m
WHERE w.manager_id = m.emp_id
  AND w.salary < m.salary
  AND w.salary > ANY
    (SELECT salary
     FROM employees
     WHERE emp_id IN
         (SELECT manager_id
          FROM employees));

Q37
SELECT e.emp_name,
       d.avgsal,
       e.dep_id AS "Current Salary"
FROM employees e,

  (SELECT avg(salary) avgsal,
          dep_id
   FROM employees
   GROUP BY dep_id) d
WHERE e.dep_id=d.dep_id;

Q38
SELECT * from employees ORDER BY salary ASC limit 5