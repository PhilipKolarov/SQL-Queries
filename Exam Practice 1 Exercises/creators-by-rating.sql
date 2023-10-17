-- 10 Creators by Rating
SELECT c.LastName, CEILING(AVG(b.Rating)), p.[Name]
FROM Creators AS c
JOIN CreatorsBoardgames AS cb ON cb.CreatorId = c.Id
JOIN Boardgames AS b ON cb.BoardgameId = b.Id
JOIN Publishers AS p ON p.Id = b.PublisherId
WHERE p.[Name] = 'Stonemaier Games'
GROUP BY LastName, p.[Name]
ORDER BY AVG(b.Rating) DESC
