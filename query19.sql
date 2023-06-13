--Find the customers who have spent more than $5000 in total
SELECT Customers.customer_id, Customers.company_name, SUM(order_details.quantity) AS TotalSpent
FROM Customers
JOIN Orders ON Customers.customer_id= Orders.customer_id
JOIN order_details ON Orders.order_id = order_details.order_id
GROUP BY Customers.customer_id, Customers.company_name
HAVING TotalSpent > 5000;
