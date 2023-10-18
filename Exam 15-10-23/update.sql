-- 03 Update
UPDATE Bookings
SET DepartureDate = DATEADD(day, 1, DepartureDate)
WHERE MONTH(DepartureDate) = '12'

UPDATE Tourists
SET Email = NULL
WHERE Email LIKE '%ma%'
