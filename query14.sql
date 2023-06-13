--14. Find the most expensive product in each category
SELECT Categories.category_name, Products.product_name, Products.unit_price
FROM (
  SELECT category_id, MAX(unit_price) AS MaxPrice
  FROM Products
  GROUP BY category_id
) AS MaxPrices
JOIN Products ON MaxPrices.category_id = Products.category_id AND MaxPrices.MaxPrice = Products.unit_price
JOIN Categories ON Products.category_id = Categories.category_id;
