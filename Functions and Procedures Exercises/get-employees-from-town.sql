CREATE PROCEDURE usp_GetEmployeesFromTown
@inputTown NVARCHAR(127)
AS
	SELECT FirstName, LastName
	FROM Employees AS e
	JOIN Addresses AS a ON a.AddressID = e.AddressID
	JOIN Towns AS t ON t.TownID = a.TownId
	WHERE t.Name = @inputTown
