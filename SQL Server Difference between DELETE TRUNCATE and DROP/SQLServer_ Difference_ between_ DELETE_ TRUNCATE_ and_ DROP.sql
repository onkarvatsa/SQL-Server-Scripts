/* ----- CREATED BY: Onkar Sharma (VATSA), C# Corner MVP ----- */
/* ------------- Happy Journey ----------------------------- */

-->>----Execute the following query to create a database...
IF (DB_ID('VENTERPRISE') IS NOT NULL)
BEGIN
	USE master
	PRINT 'Database exists'
	DROP DATABASE VENTERPRISE
	PRINT 'Database Dropped...'
END
GO

CREATE DATABASE VENTERPRISE
PRINT 'New Database VENTERPRISE Created'
GO

USE VENTERPRISE
GO

-->>----Employee Table
CREATE TABLE Employee (
	EmployeeID INT IDENTITY (100, 1) PRIMARY KEY,
	Name VARCHAR (100) NOT NULL,
	Email_ID VARCHAR (50) UNIQUE,
	ContactNumber VARCHAR (10),
	ManagerID VARCHAR(50)
);

INSERT INTO Employee VALUES 
('Muskan', 'muskan@dummymail.com', NULL, 'M011'),  
('Vishesh', 'vishesh@dummymail.com', NULL, 'M011'),  
('Jasmine', 'jasmine@dummymail.com', NULL, 'M111'),  
('Apar', 'apar@dummymail.com', NULL, 'M121'),  
('Riya', 'riya@dummymail.com', NULL, 'M121'),
('Mohan', 'mohan@dummymail.com', NULL, 'M111'),  
('Shikha', 'shikha@dummymail.com', NULL, 'M011');

SELECT * FROM VENTERPRISE..Employee
-->>----Employee Table End

-->>----PRODUCTS Table
CREATE TABLE PRODUCT (
	DefaultID INT IDENTITY (3100,1),
	ProductID VARCHAR(50),
	Product_Name VARCHAR (100) NOT NULL,
	Brand VARCHAR(50) DEFAULT 'VATSA',
	Model_year SMALLINT NOT NULL,
	PRIMARY KEY (DefaultID)
);

INSERT INTO PRODUCT VALUES 
('V855', 'Laptop', DEFAULT, 2021),
('V856', 'Printer', DEFAULT, 2021),
('V857', 'Webcam', DEFAULT, 2021),
('V858', 'Mic', DEFAULT, 2021),
('V859', 'Router', DEFAULT, 2021);

SELECT * FROM VENTERPRISE..PRODUCT
-->>----PRODUCT Table END

-->>----CLIENT Table
CREATE TABLE CLIENT (
	ClientID INT IDENTITY (500,1) PRIMARY KEY,
	ClientIDforExternalUse VARCHAR(50) UNIQUE,
	Name VARCHAR (100) NOT NULL,
	ContactNumber VARCHAR (10),
	Email_ID VARCHAR (50),
	Country VARCHAR (50)
);

INSERT INTO CLIENT VALUES 
('C121CV', 'Andy', NULL, NULL, 'United State'),
('C122CV', 'Jason', NULL, NULL, 'United Kingdom'),
('C123CV', 'Smith', NULL, NULL, 'Ukrain'),
('C124CV', 'Kumud', NULL, NULL, 'India'),
('C125CV', 'User', NULL, NULL, 'Germany');

SELECT * FROM VENTERPRISE..CLIENT
-->>----CLIENT Table END

PRINT 'Now, enjoy the following example...'







-->>---------*---------------------***--------------------*------------->>--
-->>---------*---------------------***--------------------*------------->>--
IF (1=2)
BEGIN
-------------------------------------------------------------------
-------------------------------------------------------------------
---->>>> DELETE Statement Examples

--Query 1) Execute the following query to delete all the employees whose “ManagerID” is “M011”
	DELETE FROM Employee
	WHERE ManagerID = 'M011'

	SELECT * FROM Employee

--Query 2) Execute the following query to delete all the rows from the Employee table
	DELETE FROM Employee;
	Print 'Mr/Mrs, all your rows have been deleted from this table'

--Query 3) Execute the following statement(s) to begin the TRANSACTION
	BEGIN TRANSACTION
	SELECT * FROM Employee	----to check the records
	DELETE FROM Employee
	WHERE ManagerID = 'M011'
	SELECT * FROM Employee  

	----Execute the following statement(s) to rollback the TRANSACTION
	ROLLBACK TRANSACTION    
	SELECT * FROM Employee  

-------------------------------------------------------------------
-------------------------------------------------------------------



-------------------------------------------------------------------
-------------------------------------------------------------------
---->>>> TRUNCATE Statement Examples

--Query 1) Execute the following query to truncate the table
	TRUNCATE TABLE PRODUCT

	SELECT * FROM PRODUCT

--Query 2) Execute the following statement(s) to begin the TRANSACTION
	BEGIN TRANSACTION
	SELECT * FROM PRODUCT
	TRUNCATE TABLE PRODUCT    
	SELECT * FROM PRODUCT  

	----Execute the following statement(s) to rollback the TRANSACTION
	ROLLBACK TRANSACTION    
	SELECT * FROM PRODUCT  
-------------------------------------------------------------------
-------------------------------------------------------------------



-------------------------------------------------------------------
-------------------------------------------------------------------
---->>>> DROP Statement Examples

--Query 1) Execute the following query to drop the table
	DROP TABLE CLIENT
	Print 'Hey, you have dropped your table...'

--Query 2) Execute the following statement(s) to begin the TRANSACTION
	BEGIN TRANSACTION
	SELECT * FROM CLIENT
	DROP TABLE CLIENT
	SELECT * FROM CLIENT  

	----Execute the following statement(s) to rollback the TRANSACTION
	ROLLBACK TRANSACTION    
	SELECT * FROM CLIENT  
-------------------------------------------------------------------
-------------------------------------------------------------------
END



-->>---------*---------------------***--------------------*------------->>--
-->>---------*---------------------***--------------------*------------->>--
					-->>-- Onkar Sharma (Vatsa) --<<--
-->>---------*---------------------***--------------------*------------->>--
-->>---------*---------------------***--------------------*------------->>--