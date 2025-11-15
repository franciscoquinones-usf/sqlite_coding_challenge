-- Task 1: Top 5 Customers by Total Spend
SELECT c.first_name || ' ' || c.last_name AS customer,
    o.id AS order_id, o.order_date, o.status
FROM orders o 
JOIN customers c ON o.customer_id = c.id
WHERE o.status = 'Delivered'




-- Task 2: Total Revenue by Product Category

-- Task 3: Employees Earning Above Their Department Average

-- Task 4: Cities with the Most Loyal Customers

