SELECT 
	c.CountryCode
	,COUNT(mc.MountainId) AS MountainRanges
FROM Countries AS c
LEFT JOIN MountainsCountries AS mc ON mc.CountryCode = c.CountryCode
WHERE c.CountryCode IN ('BG', 'RU', 'US')
GROUP BY c.CountryCode
