CREATE PROCEDURE usp_GetHoldersWithBalanceHigherThan
@accountThreshold MONEY
AS
BEGIN
	SELECT ah.FirstName, ah.LastName
	FROM AccountHolders AS ah
	LEFT JOIN Accounts AS a ON ah.Id = a.AccountHolderId
	GROUP BY ah.Id, ah.FirstName, ah.LastName
	HAVING SUM(a.Balance) > @accountThreshold
	ORDER BY FirstName, LastName
END	
