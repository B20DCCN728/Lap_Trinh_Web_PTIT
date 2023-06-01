CREATE TABLE Products (
	id INT IDENTITY(1,1) PRIMARY KEY,
	name NVARCHAR(50),
	des NVARCHAR(50),
	supplier NVARCHAR(50),
	price INT,
	quantity_sold INT,
	quantity_remain INT,
	image NVARCHAR(max)
);