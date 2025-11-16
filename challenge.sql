-- Task 1: Top 5 Customers by Total Spend
SELECT c.first_name || ' ' || c.last_name AS customer,
    SUM(oi.quantity * oi.unit_price) AS total_spend
FROM customers AS c
JOIN orders AS o
    ON c.id = o.customer_id
JOIN order_items AS oi
    ON o.id = oi.order_id
GROUP BY c.id
ORDER BY total_spend DESC
LIMIT 5;

-- Task 2: Total Revenue by Product Category 
SELECT p.category AS category,
    SUM(oi.quantity * oi.unit_price) AS revenue
FROM products AS p
JOIN order_items AS oi
    ON p.id = oi.product_id
JOIN orders as o
    ON oi.order_id = o.id
GROUP BY p.category
ORDER BY revenue DESC;

-- Task 3: Employees Earnings Above their Department Average
SELECT e.first_name, e.last_name, 
    d.name AS department_name,
    e.salary AS employee_salary,
    dept.avg_salary AS department_average
FROM employees AS e
JOIN departments AS d
    ON e.department_id = d.id
JOIN (SELECT department_id, AVG(salary) AS avg_salary
    FROM employees GROUP BY department_id)
AS dept on e.department_id = dept.department_id
WHERE e.salary > dept.avg_salary
ORDER BY d.name, e.salary DESC;

-- Task 4: Cities with the Most Loyal Customers
SELECT city,
    SUM(CASE WHEN loyalty_level = 'Gold' THEN 1 ELSE 0 END) AS gold_count,
    SUM(CASE WHEN loyalty_level = 'Silver' THEN 1 ELSE 0 END) AS silver_count,
    SUM(CASE WHEN loyalty_level = 'Bronze' THEN 1 ELSE 0 END) AS bronze_count
FROM customers
GROUP BY city
ORDER BY gold_count DESC, silver_count DESC, bronze_count DESC, city;