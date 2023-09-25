SELECT 
	CONCAT(FirstName, ' ', LastName) as 'Full Name'
	,Salary
	,d.[Name]
FROM Employees AS e JOIN Departments AS d ON e.EmployeeID = d.DepartmentID
WHERE e.DepartmentID = 1
