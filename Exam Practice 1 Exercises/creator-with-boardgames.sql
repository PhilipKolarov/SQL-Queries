-- 11 Creator with Boardgames
CREATE FUNCTION udf_CreatorWithBoardgames(@name NVARCHAR(50))
RETURNS INT
AS
BEGIN
	DECLARE @totalGames INT = 
	(
		SELECT COUNT(BoardgameId)
		FROM CreatorsBoardgames AS cb
		JOIN Creators AS c ON c.ID = cb.CreatorId
		WHERE c.FirstName = @name
	)
	RETURN @totalGames
END
