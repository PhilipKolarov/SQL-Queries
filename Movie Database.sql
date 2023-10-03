CREATE TABLE Directors(
	Id INT PRIMARY KEY IDENTITY NOT NULL,
	DirectorName VARCHAR(255),
	Notes VARCHAR(MAX)
);

CREATE TABLE Genres(
	Id INT PRIMARY KEY IDENTITY NOT NULL,
	GenreName VARCHAR(255),
	Notes VARCHAR(MAX)
);

CREATE TABLE Categories(
	Id INT PRIMARY KEY IDENTITY NOT NULL,
	CategoryName VARCHAR(255),
	Notes VARCHAR(MAX)
);

CREATE TABLE Movies(
	Id INT PRIMARY KEY IDENTITY NOT NULL,
	Title VARCHAR(50),
	DirectorId INT FOREIGN KEY REFERENCES Directors(Id),
	CopyRightYear SMALLINT,
	Length FLOAT,
	GenreId INT FOREIGN KEY REFERENCES Genres(Id),
	CategoryId INT FOREIGN KEY REFERENCES Categories(Id),
	Rating DECIMAL(3,1),
	Notes VARCHAR(MAX)
);

INSERT INTO Directors(DirectorName, Notes)
VALUES				 ('Tarantino', '9 great movies'),
					 ('Steven Spielberg', 'Jurassic'),
					 ('George Lucas', 'Star Wars!'),
					 ('Christopher Nolan', 'He is the hero'),
					 ('Tim Burton', 'Loves Johnny Depp');

INSERT INTO Genres(GenreName, Notes)
VALUES				 ('Thriller', NULL),
					 ('Comedy', 'HAHAHA'),
					 ('Horror', 'What was that?'),
					 ('Romance', '^^'),
					 ('Sci-Fi', 'Doctor... Who?');

INSERT INTO Categories(CategoryName, Notes)
VALUES				 ('Cat 1', NULL),
					 ('Cat 2', NULL),
					 ('Cat 3', NULL),
					 ('Cat 4', NULL),
					 ('Cat 5', NULL);

INSERT INTO Movies(Title, DirectorId, CopyRightYear, [Length], GenreId, CategoryId, Rating, Notes)
VALUES				 ('Die Hard', 2, NULL, 1.87, 1, 1, 5.4, 'gagaa'),
					 ('Rocky 2', 1, 1987, 1.6, 3, 3, 5.3, 'gagaa'),
					 ('Han Asparuh', 4, 1983, 2.67, 2, 2, 5.2, '681AD'),
					 ('Toplo', 3, 1976, 1.56, 5, 4, 5.5, 'Warm'),
					 ('IT', 5, 1971, 1.47, 4, 5, 6, 'Float too!');