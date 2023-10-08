CREATE PROCEDURE usp_GetEmployeesSalaryAboveNumber
@salaryLevel DECIMAL(18,4)
AS
	SELECT FirstName, LastName
	FROM Employees
	WHERE Salary >= @salarylevel
