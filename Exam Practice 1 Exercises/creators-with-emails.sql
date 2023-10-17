-- 09 Creators with Emails
SELECT CONCAT_WS(' ', c.FirstName, c.LastName) AS FullName, c.Email, MAX(b.Rating)
FROM Creators AS c
JOIN CreatorsBoardgames AS cb ON cb.CreatorId = c.Id
JOIN Boardgames AS b ON b.Id = cb.BoardgameId
WHERE Email LIKE '%.com'
GROUP BY CONCAT_WS(' ', c.FirstName, c.LastName), c.Email
ORDER BY CONCAT_WS(' ', c.FirstName, c.LastName)
