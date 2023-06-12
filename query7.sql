--7.Get the top 5 most sold products
SELECT Products.product_id, Products.product_name, SUM(order_details.Quantity) AS TotalSold
FROM Products
JOIN order_details ON Products.product_id = order_details.product_id
GROUP BY Products.product_id, Products.product_name
ORDER BY TotalSold DESC
LIMIT 5;