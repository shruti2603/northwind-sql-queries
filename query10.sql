--10. List all ‘Orders’ with ‘Customer’ details and ‘Employee’ who processed it
SELECT Orders.order_id, Orders.order_date, Customers.customer_id, Customers.company_name, Employees.employee_id, Employees.first_name, Employees.last_name
FROM Orders
JOIN Customers ON Orders.customer_id = Customers.customer_id
JOIN Employees ON Orders.employee_id = Employees.employee_id;
