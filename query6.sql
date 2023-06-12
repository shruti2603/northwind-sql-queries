--Get the customers who have placed more than 10 orders
SELECT Customers.customer_id, Customers.company_name, COUNT(Orders.order_id) AS TotalOrders
FROM Customers
JOIN Orders ON Customers.customer_id = Orders.customer_id
GROUP BY Customers.customer_id, Customers.company_name
HAVING COUNT(Orders.order_id) > 10;