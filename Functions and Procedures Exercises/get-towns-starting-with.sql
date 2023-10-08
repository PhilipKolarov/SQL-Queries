CREATE PROCEDURE usp_GetTownsStartingWith
@InputString NVARCHAR(50)
AS
	SELECT [Name]
	FROM Towns
	WHERE [Name] LIKE @InputString + '%'
