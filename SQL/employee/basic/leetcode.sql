# Q175 combine 2 tables


# Q176 Find nth highest salary

SELECT MAX(salary) SecondHighestSalary
FROM employees where salary < (SELECT MAX(salary)
FROM employees)


SELECT emp_name, salary FROM employees
ORDER BY salary DESC OFFSET 2 LIMIT 1

SELECT NULLIF((SELECT emp_name, salary FROM employees
ORDER BY salary DESC OFFSET 2 LIMIT 1),NULL) as SecondHighestSalary

# Q178 score rank
SELECT salary, dense_rank() over (ORDER BY salary DESC) as "rank" FROM employees

# Q180 consecutive numbers
SELECT distinct l1.num consecutiveNum FROM logs l1
JOIN logs l2 on l1.id = l2.id + 1 and l1.num = l2.num
JOIN logs l3 on 11.id = l3.id + 2 and l1.num = l3.num

# Q181 employees earning more than their manager 
SELECT distinct e.emp_name 
FROM employees e, employees m
WHERE e.manager_id  = m.emp_id 
AND e.salary > m.salary

# Q182 find duplicate emails
select email from (SELECT email, count(email) as cnt from person GROUP BY email) temp WHERE temp.cnt > 1;

select email from Person GROUP BY email having  count(email) > 1

# Q183 Customer who never order 
# LEFT (OUTER) JOIN: Returns all records from the left table, and the matched records from the right table
# RIGHT (OUTER) JOIN: Returns all records from the right table, and the matched records from the left table

SELECT name as Customers from Customers 
left join Orders on Customers.id = Orders.customerId
WHERE Customers.id  IS NULL

SELECT name as Customers from Customers where id NOT IN (select customerId from Orders)

# Q184 department highest salary
SELECT d.dep_name, e.emp_name, e.salary
FROM department d, employees e
WHERE e.dep_id = d.dep_id
and (e.dep_id, e.salary) in
(
	select e.dep_id, max(e.salary) as salary from employees e group by e.dep_id
)
group by d.dep_name,e.emp_name, e.salary

