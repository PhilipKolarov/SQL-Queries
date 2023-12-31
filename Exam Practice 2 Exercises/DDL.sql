-- 1 DLL
CREATE TABLE Countries (
	Id INT NOT NULL PRIMARY KEY IDENTITY,
	[Name] NVARCHAR(10) NOT NULL
);

CREATE TABLE Addresses (
	Id INT NOT NULL PRIMARY KEY IDENTITY,
	StreetName NVARCHAR(20) NOT NULL,
	StreetNumber INT NULL,
	PostCode INT NOT NULL,
	City VARCHAR(25) NOT NULL,
	CountryId INT NOT NULL FOREIGN KEY REFERENCES Countries(Id)
);

CREATE TABLE Vendors (
	Id INT NOT NULL PRIMARY KEY IDENTITY,
	[Name] NVARCHAR(25) NOT NULL,
	NumberVAT NVARCHAR(15) NOT NULL,
	AddressId INT NOT NULL FOREIGN KEY REFERENCES Addresses(Id)
);

CREATE TABLE Clients (
	Id INT NOT NULL PRIMARY KEY IDENTITY,
	[Name] NVARCHAR(25) NOT NULL,
	NumberVAT NVARCHAR(15) NOT NULL,
	AddressId INT NOT NULL FOREIGN KEY REFERENCES Addresses(Id)
);

CREATE TABLE Categories (
	Id INT NOT NULL PRIMARY KEY IDENTITY,
	[Name] VARCHAR(10) NOT NULL,
);

CREATE TABLE Products (
	Id INT NOT NULL PRIMARY KEY IDENTITY,
	[Name] NVARCHAR(35) NOT NULL,
	Price DECIMAL(18,2) NOT NULL,
	CategoryId INT NOT NULL FOREIGN KEY REFERENCES Categories(Id),
	VendorId INT NOT NULL FOREIGN KEY REFERENCES Vendors(Id)
);

CREATE TABLE Invoices (
	Id INT NOT NULL PRIMARY KEY IDENTITY,
	Number INT UNIQUE NOT NULL,
	IssueDate DateTime2 NOT NULL,
	DueDate DateTime2 NOT NULL,
	Amount DECIMAL(18,2) NOT NULL,
	Currency VARCHAR(5) NOT NULL,
	ClientId INT NOT NULL FOREIGN KEY REFERENCES Clients(Id),
);

CREATE TABLE ProductsClients (
	ProductId INT NOT NULL FOREIGN KEY REFERENCES Products(Id),
	ClientId INT NOT NULL FOREIGN KEY REFERENCES Clients(Id)
	CONSTRAINT PK_ProductsClients PRIMARY KEY (ProductId, ClientId)
);

