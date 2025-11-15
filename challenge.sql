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