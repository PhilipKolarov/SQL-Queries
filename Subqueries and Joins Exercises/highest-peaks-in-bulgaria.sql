SELECT
	mc.CountryCode
	,m.MountainRange
	,PeakName
	,Elevation
FROM Peaks AS p
JOIN Mountains AS m ON m.Id = p.MountainId
JOIN MountainsCountries AS mc ON mc.MountainId = m.Id
WHERE mc.CountryCode = 'BG' AND p.Elevation > 2835
ORDER BY Elevation DESC
