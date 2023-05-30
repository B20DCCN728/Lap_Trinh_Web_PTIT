--tblOrders--
CREATE TABLE Orders (
	id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
	create_date DATE NOT NULL,
	complete_date DATE,
	user_id INT NOT NULL,
	product_id INT NOT NULL,
	quantity INT NOT NULL,
	price INT NOT NULL,
	discount INT,
	total INT,
	note NVARCHAR(max)
);
