CREATE FUNCTION ufn_CalculateFutureValue(@Sum DECIMAL(18,2), @Rate FLOAT, @Years INT)
RETURNS DECIMAL(20,4)
AS
BEGIN
	RETURN @Sum * POWER((1 + @Rate), @Years)
END
