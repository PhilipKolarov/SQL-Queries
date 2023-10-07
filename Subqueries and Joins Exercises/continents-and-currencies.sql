SELECT ContinentCode, CurrencyCode, CurrencyUsage FROM
	(SELECT *,
	DENSE_RANK() OVER (PARTITION BY ContinentCode ORDER BY CurrencyUsage DESC) AS CurrencyRank
	FROM
		(SELECT ContinentCode, CurrencyCode, COUNT(CurrencyCode) AS CurrencyUsage
		FROM Countries
		GROUP BY ContinentCode, CurrencyCode) AS Subquery
	WHERE CurrencyUsage > 1) AS SecondSubquery
WHERE CurrencyRank = 1
ORDER BY ContinentCode
