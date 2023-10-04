SELECT TOP(5) e.EmployeeID, FirstName,
	CASE
		WHEN p.StartDate > '2004-12-31' THEN NULL
		ELSE p.[Name]
	END ProjectName
FROM Employees AS e
JOIN EmployeesProjects AS ep ON ep.EmployeeID = e.EmployeeID
JOIN Projects AS p on p.ProjectID = ep.ProjectID
WHERE e.EmployeeID = 24
