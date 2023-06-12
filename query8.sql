--Find the products that have never been ordered
SELECT Products.product_id, Products.product_name
FROM Products
LEFT JOIN order_details ON Products.product_id = order_details.product_id
WHERE order_details.product_id IS NULL;
