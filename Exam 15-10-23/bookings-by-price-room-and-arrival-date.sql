-- 05 Bookings by Price of Room and Arrival Date
SELECT CONVERT(varchar, ArrivalDate, 23) AS [ArrivalDate]
	   ,AdultsCount
	   ,ChildrenCount
FROM Bookings AS b
JOIN Rooms AS r ON r.Id = b.RoomId
ORDER BY r.Price DESC, ArrivalDate ASC
