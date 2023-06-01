CREATE TABLE Products (
	id INT IDENTITY(1,1) PRIMARY KEY,
	name NVARCHAR(50),
	image NVARCHAR(max),
	supplier NVARCHAR(50),
	des NVARCHAR(max),
	price INT,
	quantity_sold INT,
	quantity_remain INT
);