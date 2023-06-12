--Find the customers who have not placed any orders
SELECT Customers.customer_id, Customers.company_name
FROM Customers
LEFT JOIN Orders ON Customers.customer_id = Orders.customer_id
WHERE Orders.customer_id IS NULL;
