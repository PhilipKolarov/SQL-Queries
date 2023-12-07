SELECT DepartmentID, AVG(Salary) AS AverageSalary
FROM EmployeesNew
GROUP BY DepartmentID
