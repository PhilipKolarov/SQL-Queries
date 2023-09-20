CREATE TABLE Employees(
	Id INT PRIMARY KEY IDENTITY NOT NULL
	,FirstName VARCHAR(31) NOT NULL
	,LastName VARCHAR(31) NOT NULL
	,Title VARCHAR(31) NOT NULL
	,Notes VARCHAR(MAX)
);

CREATE TABLE Customers(
	AccountNumber INT PRIMARY KEY NOT NULL
	,FirstName VARCHAR(31) NOT NULL
	,LastName VARCHAR(31) NOT NULL
	,PhoneNumber BIGINT
	,EmergencyName VARCHAR(15)
	,EmergencyNumber INT
	,Notes VARCHAR(MAX)
);

CREATE TABLE RoomStatus(
	RoomStatus VARCHAR(31) PRIMARY KEY NOT NULL
	,Notes VARCHAR(MAX)
);

CREATE TABLE RoomTypes(
	RoomType VARCHAR(31) PRIMARY KEY NOT NULL
	,Notes VARCHAR(MAX)
);

CREATE TABLE BedTypes(
	BedType VARCHAR(31) PRIMARY KEY NOT NULL
	,Notes VARCHAR(MAX)
);

CREATE TABLE Rooms(
	RoomNumber INT PRIMARY KEY NOT NULL
	,RoomType VARCHAR(31) FOREIGN KEY REFERENCES RoomTypes(RoomType) NOT NULL
	,BedType VARCHAR(31) FOREIGN KEY REFERENCES BedTypes(BedType) NOT NULL
	,Rate SMALLINT NOT NULL
	,RoomStatus VARCHAR(31) FOREIGN KEY REFERENCES RoomStatus(RoomStatus) NOT NULL
	,Notes VARCHAR(MAX)
);

CREATE TABLE Payments(
	Id INT PRIMARY KEY IDENTITY NOT NULL
	,EmployeeId INT FOREIGN KEY REFERENCES Employees(Id) NOT NULL
	,PaymentDate DATE
	,AccountNumber INT FOREIGN KEY REFERENCES Customers(AccountNumber) NOT NULL
	,FirstDateOccupied DATE
	,LastDateOccupied DATE
	,TotalDays TINYINT NOT NULL
	,AmountCharged SMALLINT
	,TaxRate DECIMAL(5,2)
	,TaxAmount SMALLINT
	,PaymentTotal INT NOT NULL
	,Notes VARCHAR(MAX)
);

CREATE TABLE Occupancies(
	Id INT PRIMARY KEY IDENTITY NOT NULL
	,EmployeeId INT FOREIGN KEY REFERENCES Employees(Id) NOT NULL
	,DateOccupied DATE NOT NULL
	,AccountNumber INT FOREIGN KEY REFERENCES Customers(AccountNumber) NOT NULL
	,RoomNumber INT FOREIGN KEY REFERENCES Rooms(RoomNumber) NOT NULL
	,RateApplied INT NOT NULL
	,PhoneCharge SMALLINT
	,Notes VARCHAR(MAX)
);

INSERT INTO Employees(FirstName, LastName, Title)
VALUES			('Daniel', 'Radcliffe', 'Supervisor')
				,('Rupert', 'Grint', 'Sales Rep')
				,('Emma', 'Watson', 'Sales Manager');

INSERT INTO Customers(AccountNumber, FirstName, LastName)
VALUES			(1823503, 'Tom', 'Felton')
				,(1780231, 'Helena', 'Bonham-Carter')
				,(1652992, 'Ralph', 'Fines');

INSERT INTO RoomStatus(RoomStatus)
VALUES			('Vacant')
				,('Taken')
				,('Under Construction');

INSERT INTO RoomTypes(RoomType)
VALUES			('Single Bedroom')
				,('Two Bedroom')
				,('Villa');

INSERT INTO BedTypes(BedType)
VALUES			('Single')
				,('Double')
				,('Bunk');

INSERT INTO Rooms(RoomNumber, RoomType, BedType, Rate, RoomStatus)
VALUES			 (205, 'Single Bedroom', 'Single', 70, 'Taken')
				 ,(312, 'Two Bedroom', 'Double', 110, 'Vacant')
				 ,(602, 'Villa', 'Double', 230, 'Under Construction');


INSERT INTO Payments(EmployeeId, AccountNumber, TotalDays, PaymentTotal)
VALUES				   (1, 1823503, 1, 70)
					   ,(2, 1780231, 1, 110)
					   ,(3, 1652992, 3, 240);

INSERT INTO Occupancies(EmployeeId, DateOccupied, AccountNumber, RoomNumber, RateApplied)
VALUES				   (1, '2023-10-09', 1823503, 205, 70)
					   ,(2, '2023-10-10', 1780231, 312, 110)
					   ,(3, '2023-10-11', 1652992, 205, 70);