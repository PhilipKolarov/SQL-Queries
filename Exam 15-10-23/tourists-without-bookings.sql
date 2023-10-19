-- 07 Tourists without Bookings
SELECT t.Id, [Name], PhoneNumber
FROM Tourists AS t
LEFT JOIN Bookings AS b ON b.TouristId = t.Id
WHERE b.TouristId IS NULL
ORDER BY [Name] ASC
