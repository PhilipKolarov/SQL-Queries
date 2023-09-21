CREATE TABLE Users(
	Id BIGINT PRIMARY KEY IDENTITY(1,1),
	Username VARCHAR(30) UNIQUE NOT NULL,
	Password NVARCHAR(26) NOT NULL,
	ProfilePicture VARBINARY(8000),
	LastLoginTime TIME,
	isDeleted BIT
);

INSERT INTO Users(Username, Password, LastLoginTime, isDeleted)
VALUES			  ('Phil99', 'puppywerg!', '21:21:20', 'false'),
				  ('Mary89', '3m304050', '20:55:19', 'false'),
				  ('Ivo98', 'anybodygotapassword1', '20:54:03', 'false'),
				  ('Todd76', 'terrynation321', '19:39:51', 'false'),
				  ('Eve06', '0000', '20:10:25', 'false');

ALTER TABLE Users
	DROP CONSTRAINT PK_Users_3214EC074D311AAC;

ALTER TABLE Users
	ADD CONSTRAINT PK_Users_Complex
		PRIMARY KEY(Id, Username)

SELECT * FROM Users