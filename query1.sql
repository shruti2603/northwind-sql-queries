--Get the total number of orders placed by each customer
SELECT Customers.customer_id, Customers.company_name, COUNT(Orders.order_id) AS TotalOrders
FROM Customers
JOIN Orders ON Customers.customer_id = Orders.customer_id
GROUP BY Customers.customer_id, Customers.company_name
ORDER BY TotalOrders DESC;

