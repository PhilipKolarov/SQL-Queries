-- 06 Hotels by Count of Bookings
SELECT h.Id, h.[Name]
FROM Hotels AS h
JOIN HotelsRooms AS hr ON hr.HotelId = h.Id
JOIN Bookings AS b ON b.HotelId = h.Id
WHERE hr.RoomId = 8
GROUP BY h.Id, h.[Name]
ORDER BY COUNT(b.HotelId) DESC
