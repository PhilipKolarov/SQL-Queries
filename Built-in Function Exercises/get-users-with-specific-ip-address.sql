SELECT 
	Username, 
	[IP Address]
FROM Users
WHERE [IP Address] LIKE '___.1%.%.___'
ORDER BY Username
