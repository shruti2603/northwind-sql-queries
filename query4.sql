-- Find the total sales (Quantity*Unit_Price) for each category of products
SELECT Categories.category_id, Categories.category_name, 
SUM(Quantity*unit_price) AS TotalSales
FROM Categories
JOIN Products ON Categories.category_id = Products.category_id
JOIN order_details ON Products.product_id = order_details.product_id
GROUP BY Categories.category_id, Categories.category_name
ORDER BY TotalSales DESC;
