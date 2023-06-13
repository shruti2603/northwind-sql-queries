--21.Get the list of customers who have ordered ‘Chai’ product
SELECT Customers.customer_id, Customers.company_name
FROM Customers
JOIN Orders ON Customers.customer_id = Orders.customer_id
JOIN order_details ON Orders.order_id = order_details.order_id
JOIN Products ON order_details.product_id = Products.product_id
WHERE Products.product_name = 'Chai';

--22. Get the employees who have processed orders for ‘Chai’ product
SELECT DISTINCT Employees.employee_id, Employees.first_name, Employees.last_name
FROM Employees
JOIN Orders ON Employees.employee_id = Orders.employee_id
JOIN order_details ON Orders.order_id = order_details.order_id
JOIN Products ON order_details.product_id = Products.product_id
WHERE Products.product_name = 'Chai';

--23. Find the most common shipping country
SELECT ship_country, COUNT(order_id) AS TotalOrders
FROM Orders
GROUP BY ship_country
ORDER BY TotalOrders DESC
LIMIT 1;

--24. Find the order with the highest total cost
SELECT Orders.order_id, SUM(order_details.Quantity) AS TotalCost
FROM Orders
JOIN order_details ON Orders.order_id = Order_details.Order_id
GROUP BY Orders.order_id
ORDER BY TotalCost DESC
LIMIT 1;

--25. Find the employees who have processed more than 100 orders
SELECT Employees.employee_id ,Employees.first_name, Employees.last_name,  COUNT(Orders.order_id) AS TotalOrders
FROM Employees
JOIN Orders ON Employees.employee_id = Orders.employee_id
GROUP BY Employees.employee_id, Employees.first_name, Employees.last_name
HAVING COUNT(Orders.order_id) > 100;

--26. Find the customer who has ordered the most ‘Chai’ product
SELECT Customers.customer_id, Customers.company_name, SUM(order_details.Quantity) AS TotalQuantity
FROM Customers
JOIN Orders ON Customers.customer_id = Orders.customer_id
JOIN order_details ON Orders.order_id = order_details.order_id
JOIN Products ON order_details.product_id = Products.product_id
WHERE Products.product_name = 'Chai'
GROUP BY Customers.customer_id, Customers.company_name
ORDER BY TotalQuantity DESC
LIMIT 1;

--27. Find the average quantity of products ordered in each order
SELECT Orders.order_id, AVG(order_details.Quantity) AS AverageQuantity
FROM Orders
JOIN order_details ON Orders.order_id = order_details.order_id
GROUP BY Orders.order_id;

--28. Find the top 3 most popular categories of products ordered
SELECT Categories.category_id, Categories.category_name, COUNT(*) AS TotalOrders
FROM Categories
JOIN Products ON Categories.category_id = Products.category_id
JOIN order_details ON Products.product_id = order_details.product_id
GROUP BY Categories.category_id, Categories.category_name
ORDER BY TotalOrders DESC
LIMIT 3;

--29. Find the month in the year 2016 with the highest total sales
SELECT strftime('%m', Orders.order_date) AS Month, SUM(order_details.Quantity ) AS TotalSales
FROM Orders
JOIN order_details ON Orders.order_id= order_details.order_id
WHERE strftime('%Y', Orders.order_date) = '2016'
GROUP BY Month
ORDER BY TotalSales DESC
LIMIT 1;

--30. Find the employee who processed the most orders in August 2016
SELECT Employee_id, COUNT(order_id) AS TotalOrders
FROM Orders
WHERE order_date BETWEEN '2016-08-01' AND '2016-08-31'
GROUP BY employee_id
ORDER BY TotalOrders DESC
LIMIT 1;

