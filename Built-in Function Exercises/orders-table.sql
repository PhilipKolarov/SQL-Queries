USE Orders
GO
SELECT ProductName, OrderDate,
	DATEADD(day, 3, OrderDate) [Pay Due],
	DATEADD(month, 1, OrderDate) [Deliver Due]
FROM Orders
