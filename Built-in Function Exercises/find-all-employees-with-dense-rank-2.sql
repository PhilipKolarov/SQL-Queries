SELECT * FROM
	(SELECT EmployeeId, FirstName, LastName, Salary
	,DENSE_RANK() OVER (PARTITION BY Salary ORDER BY EmployeeID) as [Rank]
	FROM Employees
	WHERE Salary BETWEEN 10000 AND 50000) AS [Subquery]
	WHERE Subquery.Rank = 2
ORDER BY Salary DESC
