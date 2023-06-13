-- Find the total revenue for the year 2016
SELECT SUM(quantity) AS total_revenue
FROM orders
INNER JOIN order_details ON orders.order_id = order_details.order_id
WHERE order_date BETWEEN '2016-01-01' AND '2016-12-31';

