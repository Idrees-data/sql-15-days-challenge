-- Day 11: E-commerce Data Analytics using SQL
-- Focus: Inserts + Business Analytics Queries

-- Insert sample data

INSERT INTO customers VALUES
(1, 'Ali', 'ali@gmail.com', 'Hyderabad'),
(2, 'Sara', 'sara@yahoo.com', 'Delhi'),
(3, 'John', 'john@gmail.com', 'Mumbai'),
(4, 'Ayesha', 'ayesha@gmail.com', 'Hyderabad');

INSERT INTO products VALUES
(101, 'Laptop', 60000),
(102, 'Phone', 30000),
(103, 'Headphones', 3000),
(104, 'Keyboard', 1500);

INSERT INTO orders VALUES
(1001, 1, '2024-01-10'),
(1002, 2, '2024-01-11'),
(1003, 1, '2024-01-15'),
(1004, 3, '2024-01-20');

INSERT INTO order_items VALUES
(1001, 101, 1),
(1001, 103, 2),
(1002, 102, 1),
(1003, 104, 1),
(1003, 103, 1),
(1004, 101, 1);

-- Analytics Queries

-- Total orders per customer
SELECT c.name, COUNT(o.order_id) AS total_orders
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.name;

-- Total revenue per customer
SELECT c.name,
       SUM(p.price * oi.quantity) AS total_revenue
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
GROUP BY c.name;

-- Top-selling products
SELECT p.product_name,
SUM(oi.quantity) AS total_sold
FROM products p
JOIN order_items oi
ON p.product_id = oi.product_id
GROUP BY p.product_name
ORDER BY total_sold DESC;

-- Customers with no orders
SELECT c.name
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;

-- Daily revenue
SELECT o.order_date,
SUM(p.price * oi.quantity) AS daily_revenue
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
GROUP BY o.order_date;
