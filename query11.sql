--11. Calculate the average product price by category
SELECT Categories.category_id, Categories.category_name, AVG(Products.unit_price) AS AveragePrice
FROM Categories
JOIN Products ON Categories.category_id = Products.category_id
GROUP BY Categories.category_id, Categories.category_name;
