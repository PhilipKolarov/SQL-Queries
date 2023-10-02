SELECT 
	[Name] as Game,
	CASE
		WHEN DATEPART(hour, [Start]) BETWEEN 0 AND 11 THEN 'Morning'
		WHEN DATEPART(hour, [Start]) BETWEEN 12 AND 17 THEN 'Afternoon'
		WHEN DATEPART(hour, [Start]) BETWEEN 18 AND 23 THEN 'Evening'
	END AS [Part of the Day],
	CASE
		WHEN Duration <=3 THEN 'Extra Short'
		WHEN Duration <=6 AND Duration > 3 THEN 'Short'
		WHEN Duration > 6 THEN 'Long'
		ELSE 'Extra Long'
	END Duration
FROM Games
ORDER BY [Name], [Duration], [Part of the Day]
