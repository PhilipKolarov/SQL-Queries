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



CREATE TABLE Manufacturers(
	ManufacturerID INT PRIMARY KEY IDENTITY,
	[Name] NVARCHAR(50) NOT NULL,
	EstablishedOn DATETIME2,
);

CREATE TABLE Models(
	ModelID INT PRIMARY KEY IDENTITY(101, 1),
	[Name] NVARCHAR(50) NOT NULL,
	ManufacturerID INT FOREIGN KEY REFERENCES Manufacturers(ManufacturerID)
);

INSERT INTO Manufacturers([Name], EstablishedOn)
VALUES ('BMW', '07/03/1916'),
	   ('Tesla', '01/01/2003'),
	   ('Lada', '01/05/1966');

INSERT INTO Models([Name], ManufacturerID)
VALUES ('X1', 1),
	   ('i6', 1),
	   ('Model S', 2),
	   ('Model X', 2),
	   ('Model 3', 2),
	   ('Nova', 3);



CREATE TABLE Students(
	StudentID INT PRIMARY KEY IDENTITY,
	[Name] NVARCHAR(50) NOT NULL
);

CREATE TABLE Exams(
	ExamID INT PRIMARY KEY IDENTITY(101, 1),
	[Name] VARCHAR(50) NOT NULL,
);

CREATE TABLE StudentsExams(
	StudentID INT,
	ExamID INT,
	PRIMARY KEY(StudentID, ExamID),
	FOREIGN KEY(StudentID) REFERENCES Students(StudentID),
	FOREIGN KEY(ExamID) REFERENCES Exams(ExamID)
);

INSERT INTO Students([Name])
VALUES ('Mila'),
	   ('Toni'),
	   ('Ron');

INSERT INTO Exams([Name])
VALUES ('SpringMVC'),
	   ('Neo4j'),
	   ('Oracle 11g');

INSERT INTO StudentsExams(StudentID, ExamID)
VALUES (1, 101),
	   (1, 102),
	   (2, 101),
	   (3, 103),
	   (2, 102),
	   (2, 103);



CREATE TABLE Teachers(
	TeacherID INT PRIMARY KEY,
	[Name] NVARCHAR(50) NOT NULL,
	ManagerID INT REFERENCES Teachers(TeacherID)
)

INSERT INTO Teachers(TeacherID, [Name], ManagerID)
VALUES (101, 'Johnny', NULL),
	   (102, 'Laura', 101),
	   (103, 'Anna', 101),
	   (104, 'David', 101),
	   (105, 'Herbert', NULL),
	   (106, 'Sam', 105);
