CREATE PROCEDURE usp_DeleteEmployeesFromDepartment
@departmentId INT
AS
BEGIN
	DECLARE @employeesToBeDeleted TABLE(Id INT)

	INSERT INTO @employeesToBeDeleted(ID)
	SELECT EmployeeID
	FROM Employees
	WHERE DepartmentID = @departmentId

	ALTER TABLE Departments
	ALTER COLUMN ManagerID INT

	UPDATE Departments
	SET ManagerID = NULL
	WHERE ManagerID IN (SELECT * FROM @employeesToBeDeleted)

	UPDATE Employees
	SET ManagerID = NULL
	WHERE ManagerID IN (SELECT * FROM @employeesToBeDeleted)

	DELETE FROM EmployeesProjects
	WHERE EmployeeID IN (SELECT * FROM @employeesToBeDeleted)

	DELETE FROM Employees
	WHERE DepartmentID = @departmentId

	DELETE FROM Departments
	WHERE DepartmentID = @departmentId

	SELECT COUNT(*)
	FROM Employees
	WHERE DepartmentID = @departmentId
END
