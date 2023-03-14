# Q175 combine 2 tables


# Q176 Find nth highest salary

SELECT MAX(salary) SecondHighestSalary
FROM employees where salary < (SELECT MAX(salary)
FROM employees)


SELECT emp_name, salary FROM employees
ORDER BY salary DESC OFFSET 2 LIMIT 1

SELECT NULLIF((SELECT emp_name, salary FROM employees
ORDER BY salary DESC OFFSET 2 LIMIT 1),NULL) AS SecondHighestSalary

# Q178 score rank
SELECT salary, dense_rank() over (ORDER BY salary DESC) as "rank" FROM employees

# Q180 consecutive numbers
SELECT DISTINCT l1.num consecutiveNum FROM logs l1
JOIN logs l2 ON l1.id = l2.id + 1 AND l1.num = l2.num
JOIN logs l3 ON 11.id = l3.id + 2 AND l1.num = l3.num

# Q181 employees earning more than their manager 
SELECT DISTINCT e.emp_name 
FROM employees e, employees m
WHERE e.manager_id  = m.emp_id 
AND e.salary > m.salary

# Q182 find duplicate emails
SELECT email FROM (SELECT email, count(email) AS cnt FROM person GROUP BY email) temp WHERE temp.cnt > 1;

SELECT email FROM Person GROUP BY email having count(email) > 1

# Q183 Customer who never order 
# LEFT (OUTER) JOIN: Returns all records from the left table, and the matched records from the right table
# RIGHT (OUTER) JOIN: Returns all records from the right table, and the matched records from the left table

SELECT name AS Customers FROM Customers 
LEFT JOIN Orders ON Customers.id = Orders.customerId
WHERE Orders.customerId  IS NULL

SELECT name AS Customers FROM Customers WHERE id NOT IN (select customerId FROM Orders)

# Q184 department highest salary
SELECT d.dep_name, e.emp_name, e.salary
FROM department d, employees e
WHERE e.dep_id = d.dep_id
AND (e.dep_id, e.salary) IN
(
	select e.dep_id, max(e.salary) as salary from employees e group by e.dep_id
)
group by d.dep_name,e.emp_name, e.salary

