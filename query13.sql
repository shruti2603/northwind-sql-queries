-- List all orders shipped to ‘Germany’
SELECT order_id, customer_id, employee_id, order_date, required_date, shipped_date, ship_via, freight, ship_name, ship_address, ship_city, ship_region, ship_postal_code, ship_country
FROM orders
WHERE ship_country = 'Germany';

