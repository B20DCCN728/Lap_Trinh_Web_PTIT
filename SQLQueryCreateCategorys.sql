CREATE TABLE Categorys (
	id INT IDENTITY(1,1) PRIMARY KEY,
	parent INT,
	name NVARCHAR(max),
	parent_name NVARCHAR(max)
);