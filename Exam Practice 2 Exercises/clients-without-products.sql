-- 7 Clients without Products
SELECT c.Id
	  ,c.[Name] AS Client
	  ,CONCAT(a.StreetName, ' ', a.StreetNumber, ', ', a.City, ', ', a.PostCode, ', ', cn.[Name]) AS [Address]
FROM Clients AS c
JOIN Addresses AS a ON c.AddressId = a .Id
JOIN Countries AS cn ON a.CountryId = cn.Id
LEFT JOIN ProductsClients AS pc ON pc.ClientId = c.Id
WHERE pc.ProductId IS NULL
ORDER BY c.[Name] ASC;
