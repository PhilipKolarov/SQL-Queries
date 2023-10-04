SELECT FirstName, LastName, HireDate, d.[Name]
FROM Employees AS e
JOIN Departments AS d ON d.DepartmentID = e.DepartmentID
WHERE d.[Name] IN ('Finance', 'Sales') AND
	  HireDate > '1999-01-01'
ORDER BY HireDate
