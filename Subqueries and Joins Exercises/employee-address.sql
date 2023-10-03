USE SoftUni
SELECT TOP(5) EmployeeID, JobTitle, a.AddressID, a.AddressText
FROM Employees AS e
JOIN Addresses AS a ON a.AddressID = e.AddressID
ORDER BY AddressID