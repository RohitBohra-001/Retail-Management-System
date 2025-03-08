-- complex queries and reports

-- Example 1: JOIN query to get order details with customer and product information
USE online_retail_store;

SELECT
    o.order_id,
    o.order_date,
    o.status,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    p.name AS product_name,
    od.quantity,
    od.price
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
JOIN order_details od ON o.order_id = od.order_id
JOIN products p ON od.product_id = p.product_id;

--Example 2: Window function to rank products by quantity sold
SELECT
    p.product_id,
    p.name,
    SUM(od.quantity) AS total_quantity_sold,
    RANK() OVER (ORDER BY quantity DESC) AS sales_rank
FROM products p
JOIN order_details od ON p.product_id = od.product_id
GROUP BY p.product_id, p.name;

--Example 3: Using a CTE to analyse monthly sales trend
WITH MonthlySales AS (
    SELECT
        DATE_FORMAT(o.order_date, '%Y-%m') AS month,
        SUM(total_amount) AS total_sales
    FROM orders
    GROUP BY DATE_FORMAT
)
SELECT month, total_sales
FROM MonthlySales
ORDER BY month;


