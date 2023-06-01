CREATE TABLE OrderItems (
	id INT IDENTITY(1,1) PRIMARY KEY,
	order_id INT,
	product_id INT,
	quantity INT
);