--5. List the employees and the number of orders each employee has taken
SELECT Employees.employee_id, Employees.first_name, Employees.last_name, COUNT(Orders.order_id) AS TotalOrders
FROM Employees
LEFT JOIN Orders ON Employees.employee_id = Orders.employee_id
GROUP BY Employees.employee_id, Employees.first_name, Employees.last_name
ORDER BY TotalOrders DESC;
