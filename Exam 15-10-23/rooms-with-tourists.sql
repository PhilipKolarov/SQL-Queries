-- 11 Rooms with Tourists
CREATE FUNCTION udf_RoomsWithTourists(@name VARCHAR(40))
RETURNS INT
AS
BEGIN
	DECLARE @result INT;

	SELECT @result = SUM(AdultsSum + ChildrenSum)
	FROM (SELECT SUM(b.AdultsCount) AS AdultsSum
				 ,SUM(b.ChildrenCount) AS ChildrenSum
		  FROM Bookings AS b
		  JOIN Rooms AS r ON r.Id = b.RoomId
		  WHERE r.[Type] = @name
		  GROUP BY r.[Type]) AS sbqry

	RETURN @result
END
