--3. Get the total quantity of each product sold.
SELECT Products.product_id, Products.product_name, SUM(order_details.Quantity) AS TotalQuantity
FROM Products
JOIN order_details ON Products.product_id= Order_details.product_id
GROUP BY Products.product_id, Products.product_name
ORDER BY TotalQuantity DESC;
