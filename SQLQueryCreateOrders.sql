CREATE TABLE Orders (
	id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
	create_date DATE NOT NULL,
	user_id INT NOT NULL,
	product_id INT NOT NULL,
	delivery NVARCHAR(100) NOT NULL,
	quantity INT NOT NULL,
	price INT NOT NULL,
	discount INT,
	total INT NOT NULL,
	payment NVARCHAR(100) NOT NULL,
	note NVARCHAR(max)
);