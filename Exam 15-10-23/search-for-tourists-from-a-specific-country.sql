-- 12 Search for Tourists from a Specific Country
CREATE PROCEDURE usp_SearchByCountry(@country NVARCHAR(50))
AS
BEGIN
	SELECT t.[Name]
		   ,t.PhoneNumber
		   ,t.Email
		   ,COUNT(b.Id) AS CountOfBookings
	FROM Tourists AS t
	JOIN Countries AS ct ON ct.Id = t.CountryId
	JOIN Bookings AS b ON b.TouristId = t.Id
	JOIN Hotels AS h ON h.Id = b.HotelId
	JOIN Destinations AS d ON d.Id = h.DestinationId
	JOIN Countries AS cd ON cd.Id = d.Id
	WHERE ct.[Name] = @country
	GROUP BY t.[Name], t.PhoneNumber, t.Email
	HAVING COUNT(b.Id) > 0
END
