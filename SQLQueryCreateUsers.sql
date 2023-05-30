--tblUsers--
CREATE TABLE Users (
	id INT IDENTITY PRIMARY KEY,
	fullname NVARCHAR(50) NOT NULL,
	dob DATE NOT NULL,
	phone VARCHAR(50) NOT NULL,
	email VARCHAR(50) NOT NULL,
	password VARCHAR(50) NOT NULL,
<<<<<<< HEAD
	address NVARCHAR(max) NOT NULL,
	is_admin INT NOT NULL,
	note NVARCHAR(max) NOT NULL,
);
=======
	is_admin INT
);
>>>>>>> 944d653e56391a5e6706cc2b4766d819951d98ac
