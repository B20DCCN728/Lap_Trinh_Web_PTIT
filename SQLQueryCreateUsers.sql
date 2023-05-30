CREATE TABLE Users (
	id INT IDENTITY PRIMARY KEY,
	fullname NVARCHAR(50),
	dob DATE,
	phone VARCHAR(50),
	email VARCHAR(50),
	password VARCHAR(50),
	address NVARCHAR(max),
	is_admin INT,
	note NVARCHAR(max)
);