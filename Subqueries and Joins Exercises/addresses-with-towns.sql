SELECT Top(50) FirstName, LastName, t.[Name] AS Town, a.AddressText
FROM Employees AS e
JOIN Addresses AS a ON a.AddressID = e.AddressID
JOIN Towns AS t ON a.TownID = t.TownID
ORDER BY FirstName, LastName
