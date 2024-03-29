-- Find the total revenue generated by each employee
SELECT Employees.employee_id, Employees.first_name, Employees.last_name, SUM(order_details.Quantity) AS TotalRevenue
FROM Employees
JOIN Orders ON Employees.employee_id = Orders.employee_id
JOIN order_details ON Orders.order_id = order_details.order_id
GROUP BY Employees.employee_id, Employees.first_name, Employees.last_name;
