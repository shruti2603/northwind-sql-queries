-- Find all employees who report to ‘Andrew Fuller’
SELECT Employees.employee_id, Employees.first_name, Employees.last_name
FROM Employees
JOIN Employees AS Manager ON Employees.reports_to = Manager.employee_id
WHERE Manager.first_name = 'Andrew' AND Manager.last_name = 'Fuller';
