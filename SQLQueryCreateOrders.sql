CREATE TABLE Orders (
	id INT PRIMARY KEY IDENTITY(1,1),
	create_date VARCHAR(100),
	user_id INT,
	cost INT,
	discount INT,
	fee INT,
	total INT,
	payment NVARCHAR(100),
	delivery NVARCHAR(100),
	note NVARCHAR(max)
);
