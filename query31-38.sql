--31. Find the top 3 customers who have ordered the most products
SELECT customer_id,COUNT(order_id) AS TotalOrders
FROM Orders
GROUP BY customer_id
ORDER BY TotalOrders DESC
LIMIT 3;

--32. Find the employees who have not processed any orders
SELECT Employees.employee_id, Employees.first_name, Employees.last_name
FROM Employees
LEFT JOIN Orders ON Employees.employee_id = Orders.employee_id
WHERE Orders.employee_id IS NULL;

--33. Find the suppliers who supply the top 5 most sold products
SELECT Suppliers.supplier_id, Suppliers.company_name, COUNT(*) AS TotalSales
FROM Suppliers
JOIN Products ON Suppliers.supplier_id = Products.supplier_id
JOIN order_details ON Products.product_id = order_details.product_id
GROUP BY Suppliers.supplier_id, Suppliers.company_name
ORDER BY TotalSales DESC
LIMIT 5;

--34. Find the customers who have ordered products from all categories
SELECT Customers.customer_id, Customers.company_name
FROM Customers
WHERE Customers.customer_id IN (
    SELECT Orders.customer_id
    FROM Orders
    JOIN order_details ON Orders.order_id= order_details.order_id
    JOIN Products ON order_details.product_id= Products.product_id
    GROUP BY Orders.customer_id
    HAVING COUNT(DISTINCT Products.category_id) = (

        SELECT COUNT(*) FROM Categories
    )
);

--35. Find the total sales for each year
SELECT strftime('%Y', Orders.order_date) AS Year, SUM(order_details.Quantity) AS TotalSales
FROM Orders
JOIN order_details ON Orders.order_id = order_details.order_id
GROUP BY Year;

--36. Classify customers based on their total order amounts such that total order amounts > 5000 should be classified as ‘High Value’, if > 1000 then as ‘Medium Value’ and otherwise as ‘Low Value’
SELECT Customers.company_name, TotalOrderAmount,
  CASE
    WHEN TotalOrderAmount > 5000 THEN 'High Value'
    WHEN TotalOrderAmount > 1000 THEN 'Medium Value'
    ELSE 'Low Value'
  END AS CustomerClass
FROM Customers
JOIN (
  SELECT customer_id, SUM(order_details.Quantity) AS TotalOrderAmount
  FROM Orders
  JOIN order_details ON Orders.order_id= order_details.order_id
  GROUP BY customer_id
) AS OrderAmounts ON Customers.customer_id = OrderAmounts.customer_id;


--37.Classify products based on their sales volume such that TotalQuantity > 1000 Then SalesCategory as ‘High Sales’. If TotalQuantity>500 Then ‘Medium Sales’ and else ‘Lower Sales’
SELECT Products.product_name, TotalQuantity,
  CASE
    WHEN TotalQuantity > 1000 THEN 'High Sales'
    WHEN TotalQuantity > 500 THEN 'Medium Sales'
    ELSE 'Lower Sales'
  END AS SalesCategory
FROM Products
JOIN (
  SELECT product_id, SUM(order_details.Quantity) AS TotalQuantity
  FROM order_details
  GROUP BY product_id
) AS SalesVolumes ON Products.product_id= SalesVolumes.product_id;


--38. Classify employees based on the number of orders they have processed such that NumberOfOrders > 100 Then PerformanceCategory as ‘High Performing’. If NumberOfOrders>50 Then ‘Medium Performing’ and else ‘Lower Performing’
     SELECT Employees.employee_id, Employees.first_name, Employees.last_name,
  CASE
    WHEN OrderCounts.NumberOfOrders > 100 THEN 'High Performing'
    WHEN OrderCounts.NumberOfOrders > 50 THEN 'Medium Performing'
    ELSE 'Lower Performing'
  END AS PerformanceCategory
FROM Employees
LEFT JOIN (
  SELECT employee_id, COUNT(*) AS NumberOfOrders
  FROM Orders
  GROUP BY Employee_id
) AS OrderCounts ON Employees.employee_id = OrderCounts.employee_id;
