CREATE TABLE Passports(
	PassportID INT PRIMARY KEY IDENTITY(101, 1),
	PassportNumber NVARCHAR(20)
);

CREATE TABLE Persons(
	PersonID INT PRIMARY KEY IDENTITY,
	FirstName NVARCHAR(50),
	Salary DECIMAL(8,2),
	PassportID INT UNIQUE FOREIGN KEY REFERENCES Passports(PassportID)
)

INSERT INTO Passports(PassportNumber)
VALUES('N34FG21B'),
	  ('K65L04R7'),
	  ('ZE657QP2');

INSERT INTO Persons(FirstName, Salary, PassportID)
VALUES('Roberto', 43300.00, 102),
	  ('Tom', 56100.00, 103),
	  ('Yana', 60200.00, 101);
