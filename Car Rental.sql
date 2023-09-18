CREATE TABLE Categories(
	Id INT PRIMARY KEY IDENTITY NOT NULL
	,CategoryName VARCHAR(63) NOT NULL
	,DailyRate SMALLINT
	,WeeklyRate SMALLINT
	,MonthlyRate BIGINT
	,WeekendRate SMALLINT
);

CREATE TABLE Cars(
	Id INT PRIMARY KEY IDENTITY NOT NULL
	,PlateNumber VARCHAR(8) NOT NULL
	,Manufacturer VARCHAR(63) NOT NULL
	,Model VARCHAR(63) NOT NULL
	,CarYear SMALLINT
	,CategoryId INT FOREIGN KEY REFERENCES Categories(Id) NOT NULL
	,Doors SMALLINT
	,Picture VARBINARY(8000)
	,Condition VARCHAR(15)
	,Available BIT
);

CREATE TABLE Employees(
	Id INT PRIMARY KEY IDENTITY NOT NULL
	,FirstName VARCHAR(31) NOT NULL
	,LastName VARCHAR(31) NOT NULL
	,Title VARCHAR(31) NOT NULL
	,Notes VARCHAR(MAX)
);

CREATE TABLE Customers(
	Id INT PRIMARY KEY IDENTITY NOT NULL
	,DriverLicenseNumber BIGINT NOT NULL
	,FullName VARCHAR(63) NOT NULL
	,[Address] VARCHAR(127)
	,City VARCHAR(31)
	,ZIPCode VARCHAR(15)
	,Notes VARCHAR(MAX)
)

CREATE TABLE RentalOrders(
	Id INT PRIMARY KEY IDENTITY NOT NULL
	,EmployeeId INT FOREIGN KEY REFERENCES Employees(Id) NOT NULL
	,CustomerId INT FOREIGN KEY REFERENCES Employees(Id) NOT NULL
	,CarId INT FOREIGN KEY REFERENCES Employees(Id) NOT NULL
	,TankLevel SMALLINT
	,KilometrageStart BIGINT
	,KilometrageEnd BIGINT
	,TotalKilometrage SMALLINT NOT NULL
	,StartDate DATE
	,EndDate DATE
	,TotalDays SMALLINT NOT NULL
	,RateApplied VARCHAR(15) NOT NULL
	,TaxRate SMALLINT
	,OrderStatus VARCHAR(31) NOT NULL
);

INSERT INTO Categories(CategoryName, DailyRate)
VALUES				  ('Mid', 50)
					  ,('Expensive', 70)
					  ,('Cheap', 40);

INSERT INTO Cars(PlateNumber, Manufacturer, Model, CategoryId)
VALUES			('CB1454KK', 'Opel', 'Zafira', 1)
				,('PB0904TB', 'Wolkswagen', 'Touran', 2)
				,('TX8912AC', 'Ford', 'Focus', 3);

INSERT INTO Employees(FirstName, LastName, Title)
VALUES			('Daniel', 'Radcliffe', 'Supervisor')
				,('Rupert', 'Grint', 'Sales Rep')
				,('Emma', 'Watson', 'Sales Manager');

INSERT INTO Customers(DriverLicenseNumber, FullName)
VALUES			(1823503, 'Tom Felton')
				,(1780231, 'Helena Bonham-Carter')
				,(1652992, 'Ralph Fines');

INSERT INTO RentalOrders(EmployeeId, CarId, CustomerId, TotalKilometrage, TotalDays, RateApplied, OrderStatus)
VALUES					(1, 1, 1, 2000, 14, 'Weekly Rate', 'Confirmed')
						,(2, 2, 2, 550, 5, 'Daily Rate', 'Unconfirmed')
						,(3, 3, 3, 140, 30, 'Monthly Rate', 'Processing');