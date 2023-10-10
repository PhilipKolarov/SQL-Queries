CREATE PROCEDURE usp_GetHoldersFullName
AS
	SELECT CONCAT_WS(' ', FirstName, LastName)
	FROM AccountHolders
