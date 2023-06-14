CREATE TABLE Products (
	id INT IDENTITY(1,1) PRIMARY KEY,
	name NVARCHAR(MAX),
	title NVARCHAR(MAX),
	category_id INT,
	image1 NVARCHAR(MAX),
	image2 NVARCHAR(MAX),
	des NVARCHAR(MAX),
	price INT,
	quantity_sold INT,
	quantity_remain INT
);