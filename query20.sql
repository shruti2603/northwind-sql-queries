--20. List the top 5 employees who have processed the most orders
SELECT employee_id, COUNT(order_id) AS TotalOrders
FROM Orders
GROUP BY employee_id
ORDER BY TotalOrders DESC
LIMIT 5;
