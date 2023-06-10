-- Retrieves the top 3 customers by total order quantity
SELECT c.customer_name, SUM(o.quantity) AS total_order_quantity
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_name
ORDER BY total_order_quantity DESC
LIMIT 3;
