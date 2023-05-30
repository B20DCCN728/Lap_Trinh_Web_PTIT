--tblUsers--
CREATE TABLE Users (
	id INT IDENTITY PRIMARY KEY,
	fullname NVARCHAR(50) NOT NULL,
	email VARCHAR(50) NOT NULL,
	phone VARCHAR(50) NOT NULL,
	address NVARCHAR(max) NOT NULL,
	password VARCHAR(50) NOT NULL,
	is_admin INT
);
