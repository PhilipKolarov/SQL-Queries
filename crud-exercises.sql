SELECT * FROM Departments;

SELECT Name FROM Departments;

SELECT FirstName, LastName, Salary
FROM Employees;

SELECT FirstName, MiddleName, LastName
FROM Employees;

SELECT FirstName + '.' + LastName + '@softuni.bg' AS [Full Email Address]
FROM Employees;

SELECT DISTINCT Salary
FROM Employees;

SELECT *
FROM Employees
WHERE JobTitle = 'Sales Representative';

SELECT FirstName, LastName, JobTitle
FROM Employees
WHERE Salary BETWEEN 20000 AND 30000;

SELECT CONCAT_WS(' ', FirstName, MiddleName, LastName)
FROM Employees
WHERE Salary IN(25000, 14000, 12500, 23600);

SELECT FirstName, LastName
FROM Employees
WHERE ManagerID IS NULL;

SELECT FirstName, LastName, Salary
FROM Employees
WHERE Salary > 50000
ORDER BY Salary DESC;

SELECT TOP(5)FirstName, LastName
FROM Employees
ORDER BY Salary DESC;

SELECT FirstName, LastName
FROM Employees
WHERE DepartmentID <> 4;

SELECT *
FROM Employees
ORDER BY Salary DESC, FirstName, LastName DESC, MiddleName;

CREATE VIEW V_EmployeesSalary
AS
SELECT FirstName, LastName, Salary
FROM Employees;

CREATE VIEW V_EmployeeNameJobTitle
AS
SELECT FirstName + ' ' + ISNULL(MiddleName, '') + ' ' + LastName AS [Employee Name], JobTitle
FROM Employees;

SELECT DISTINCT JobTitle
FROM Employees;

SELECT TOP(10) *
FROM Projects
ORDER BY StartDate, [Name];

SELECT TOP(7) FirstName, LastName, HireDate
FROM Employees
ORDER BY HireDate DESC;

UPDATE Employees
SET Salary = Salary*1.12
WHERE DepartmentID IN(
	SELECT DepartmentID
	FROM Departments
	WHERE [Name] IN('Engineering', 'Tool Design', 'Marketing', 'Information Services'));
SELECT Salary FROM Employees;

SELECT PeakName FROM Peaks
ORDER BY PeakName;

SELECT TOP (30) CountryName, Population FROM Countries
WHERE ContinentCode IN(
	SELECT ContinentCode FROM Continents
	WHERE ContinentName = 'Europe'
)
ORDER BY [Population] DESC, CountryName;

SELECT CountryName, CountryCode,
CASE CurrencyCode WHEN 'EUR' THEN 'Euro'
							 ELSE 'Not Euro' END AS Currency
FROM Countries
ORDER BY [CountryName]
