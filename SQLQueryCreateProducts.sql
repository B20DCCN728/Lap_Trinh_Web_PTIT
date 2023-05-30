CREATE TABLE Products (
	id INT IDENTITY PRIMARY KEY,
	name NVARCHAR(50),
	des NVARCHAR(50),
	supplier NVARCHAR(50),
	price INT,
	quantity_remain INT,
	image NVARCHAR(max)
);