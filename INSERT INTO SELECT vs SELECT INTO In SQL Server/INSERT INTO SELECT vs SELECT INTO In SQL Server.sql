-- ===============================================================================
-- == Author: Onkar Sharma (VATSA), C# Corner MVP (Most Valuable Professional) ===
-- == Created Date: December, 2021 - ---- --- ---- ---- ---- ---- ---- ---- -- ===
-- == Description: INSERT INTO SELECT vs SELECT INTO In SQL Server --- ---- -- ===
-- ===============================================================================

-->>----Execute the following query to create the database...
IF (DB_ID('OnkarSharma_Vatsa') IS NOT NULL)
BEGIN
	USE master
	PRINT 'Database exists'
	DROP DATABASE OnkarSharma_Vatsa
	PRINT 'Database Dropped...'
END
GO

CREATE DATABASE OnkarSharma_Vatsa
PRINT 'New Database ''OnkarSharma_Vatsa'' Created'
GO

USE [OnkarSharma_Vatsa]
GO

-->>----Employee Table ------------------->>--
CREATE TABLE [dbo].[Employee] (
	EmployeeID INT IDENTITY (31100,1),
	EmployerID BIGINT NOT NULL DEFAULT 228866,
	FirstName VARCHAR(50) NOT NULL,
	LastName VARCHAR(50) NOT NULL,
	Email VARCHAR(255) NOT NULL UNIQUE,
	DepartmentID VARCHAR(100) NOT NULL,
	Age INT  NOT NULL,
	GrossSalary BIGINT NOT NULL,
	PerformanceBonus BIGINT,
	ContactNo VARCHAR(25),
	PRIMARY KEY (EmployeeID)
);

INSERT INTO Employee VALUES
(DEFAULT, 'Shikha', 'Tiwari', 'Stiwari@vatsa.com', 'V_IT', 21, 2300000, 20000, '741258963'),
(DEFAULT, 'John', 'Sinha', 'Jsinha@vatsa.com', 'V_IT', 32, 2600000, 20000, '123654789'),
(DEFAULT, 'Jasmine', 'Basin', 'Jbasin@vatsa.com', 'V_HR', 25, 2750000, 30000, NULL),
(DEFAULT, 'Shraddhajali', 'Kappor', 'Skappor@vatsa.com', 'V_Accounts', 32, 2700000, 35000, NULL),
(DEFAULT, 'Varun', 'Setia', 'Vsetia@vatsa.com', 'V_Support', 28, 2100000, 30000, '6547989231'),
(DEFAULT, 'Abhishek', 'Benerjey', 'Abenerjey@vatsa.com', 'V_MGR', 35, 3200000, 20000, '589741236'),
(DEFAULT, 'Aastha', 'Gili', 'Agili@vatsa.com', 'V_MGR', 24, 3200000, 20000, NULL),
(DEFAULT, 'Parneeti', 'Sharma', 'Psharma@vatsa.com', 'V_HR', 25, 2750000, 20000, NULL),
(DEFAULT, 'Rohit', 'Sharma', 'Rsharma@vatsa.com', 'V_IT', 21, 2300000, 20000, NULL),
(DEFAULT, 'Aastha', 'Lali', 'Jlal@vatsa.com', 'V_Support', 23, 1800000, 75000, NULL),
(DEFAULT, 'Shikha', 'Dwivedi', 'Manu@vatsa.com', 'V_IT', 21, 2300000, 30000, NULL),
(DEFAULT, 'Neeraj', 'Khopra', 'Nkhopra@vatsa.com', 'V_IT', 18, 2300000, 27000, NULL)

SELECT * FROM OnkarSharma_Vatsa..Employee
-->>----Employee Table End ------------------->>--



-->>----Restaurant Table ------------------->>--
CREATE TABLE [dbo].[Restaurant](
	RestaurantId INT IDENTITY (51, 1),
	RestaurantName VARCHAR(MAX) NOT NULL,
	Email VARCHAR(100),
	City VARCHAR(100),
	Zipcode VARCHAR(6) NOT NULL,
	State VARCHAR(100) NOT NULL,
	Country VARCHAR(100) NOT NULL,
	PRIMARY KEY(RestaurantId)
);

INSERT INTO Restaurant VALUES
('BSR Vatsa', NULL, 'Bulandshahr', '203001', 'UP', 'IND'),
('Noida Vatsa', NULL, 'Noida', '203111', 'UP', 'IND'),
('Delhi Vatsa', NULL, NULL, '110001', 'Delhi', 'IND'),
('Ind Vatsa', NULL, 'Indore', '987654', 'MP', 'IND'),
('Himadri Vatsa', NULL, NULL, '172001', 'HP', 'IND'),
('MRT Vatsa', NULL, 'Meerut', '250001', 'UP', 'IND'),
('Noida Vatsa', NULL, 'Noida', '201001', 'UP', 'IND'),
('GZB Vatsa', NULL, 'Ghaziabad', '201003', 'UP', 'IND'),
('GN Vatsa', NULL, 'Greater Noida', '203081', 'UP', 'IND'),
('Lucknow Vatsa', NULL, 'Lucknow', '503001', 'UP', 'IND'),
('BSR Vatsa', NULL, 'Bulandshahr', '203001', 'UP', 'IND'),
('Patiala Vatsa', NULL, 'Amritsar', '143502', 'PB', 'IND'),
('Goa Vatsa', NULL, NULL, '312465', 'Goa', 'IND')

SELECT * FROM OnkarSharma_Vatsa..Restaurant
-->>----Restaurant Table End ------------------->>--



-->>----tbl_Orders Table ------------------->>--
CREATE TABLE [dbo].[tbl_Orders] (
	OrderId INT IDENTITY (108, 1) PRIMARY KEY,
	FoodieID INT,
	OrderStatus TINYINT NOT NULL, -- ==>> OrderStatus: 4: Cancelled; 3: Pending; 2: Processing; 1: Completed
	OrderDate DATE NOT NULL,
	ShippedDate DATE,
	RestaurantId INT NOT NULL,
);

INSERT INTO tbl_Orders VALUES
(210, 1, '2021-06-28 20:37:31.970', '2021-06-30 20:42:14.583', 51),
(210, 3, '2021-06-29 20:37:31.970', '2021-07-01 20:42:14.583', 51),
(211, 2, '2021-06-29 20:37:31.970', '2021-07-01 20:42:14.583', 51),
(211, 1, '2021-06-30 20:37:31.970', '2021-07-03 20:42:14.583', 51),
(211, 3, '2021-08-30 20:37:31.970', '2021-09-02 20:42:14.583', 51),
(212, 3, '2021-06-30 20:37:31.970', '2021-07-02 20:42:14.583', 52),
(213, 4, '2021-07-04 20:37:31.970', NULL, 51),
(214, 1, '2021-07-07 20:37:31.970', '2021-07-09 20:42:14.583', 53),
(215, 2, '2021-07-09 20:37:31.970', '2021-07-11 20:42:14.583', 54),
(216, 3, '2021-08-21 20:37:31.970', '2021-08-23 20:42:14.583', 55),
(216, 2, '2021-08-22 20:37:31.970', '2021-08-24 20:42:14.583', 55),
(216, 4, '2021-08-21 20:37:31.970', NULL, 55),
(216, 3, '2021-08-21 20:37:31.970', '2021-08-23 20:42:14.583', 55),
(217, 1, '2021-08-22 20:37:31.970', '2021-08-24 20:42:14.583', 53),
(218, 2, '2021-08-23 20:37:31.970', '2021-08-25 20:42:14.583', 56),
(219, 3, '2021-08-24 20:37:31.970', '2021-08-26 20:42:14.583', 57),
(220, 1, '2021-08-27 20:37:31.970', '2021-08-29 20:42:14.583', 52)

SELECT * FROM OnkarSharma_Vatsa..tbl_Orders
-->>----Store Table End ------------------->>--



-->>----tbl_OrderItems Table ------------------->>--
CREATE TABLE [dbo].[tbl_OrderItems](
	OrderId INT NOT NULL,
	ItemId INT,
	MenuId INT NOT NULL,
	Quantity INT NOT NULL,
	Price DECIMAL(6, 2) NOT NULL,
	Discount DECIMAL(5, 2) NOT NULL DEFAULT 0,
	PRIMARY KEY (ItemId)
);

INSERT INTO tbl_OrderItems VALUES
(108, 1, 81, 4, 100.50, DEFAULT),
(108, 2, 82, 8, 30.00, 5.00),
(108, 3, 83, 25, 25.00, DEFAULT),
(109, 4, 81, 4, 100.50, DEFAULT),
(109, 5, 84, 1, 25.00, DEFAULT),
(109, 6, 87, 1, 580.50, 100.50),
(110, 7, 88, 1, 620.00, 120.00),
(110, 8, 89, 1, 560.00, DEFAULT),
(111, 9, 82, 8, 30.00, 5.00),
(112, 10, 81, 4, 100.50, DEFAULT),
(112, 11, 82, 8, 30.00, 5.00),
(112, 12, 83, 25, 25.00, DEFAULT),
(113, 13, 84, 4, 25.00, DEFAULT),
(114, 14, 85, 1, 300.50, DEFAULT),
(114, 15, 86, 2, 120.00, DEFAULT),
(114, 16, 87, 1, 580.50, 100.50),
(115, 17, 88, 1, 620.00, 120.00),
(116, 18, 89, 1, 560.00, DEFAULT),
(116, 19, 81, 4, 100.50, DEFAULT),
(116, 20, 84, 4, 25.00, DEFAULT)

SELECT * FROM OnkarSharma_Vatsa..tbl_OrderItems
-->>----tbl_OrderItems Table ------------------->>--



-->>----tbl_Menu Table ------------------->>--
CREATE TABLE [dbo].[tbl_Menu] (
	MenuId INT IDENTITY (81, 1) PRIMARY KEY,
	FoodCategoryID INT NOT NULL,
	FoodName VARCHAR (255) NOT NULL,
	TypeofFood VARCHAR (100) NOT NULL,
	Price DECIMAL(6, 2) NOT NULL
);

INSERT INTO tbl_Menu VALUES
(1, 'Chhole Bhature', 'Indian Food', 100.50),
(1, 'Samosa', 'Indian Food', 30.00),
(2, 'Panipuri/Golgappe', 'Indian Food', 25.00),
(2, 'Masala Chai', 'Indian Food', 25.00),
(3, 'Jalebi', 'Indian Food', 300.50),
(4, 'Aloo Parantha', 'Indian Food', 120.00),
(4, 'Panjiri', 'Indian Food', 580.50),
(5, 'Coconut Ladoo', 'Indian Food', 620.00),
(6, 'Khakhra', 'Indian Food', 560.00)

SELECT * FROM OnkarSharma_Vatsa..tbl_Menu
-->>----tbl_Menu Table ------------------->>--



PRINT '--*----------------------------------------*--'
PRINT 'Now, enjoy the following examples...'
PRINT 'Regards, Onkar Sharma'
PRINT '--*----------------------------------------*--'

-->>------------*---------------------------***---------------------------*------------>>--
-->>------------*---------------------------***---------------------------*------------>>--
-->>------------*---------------------------***---------------------------*------------>>--
-->>------------*---------------------------***---------------------------*------------>>--

IF (1=2) --Comment to proceed...		--> 'Examples of "INSERT INTO SELECT" Statement...'
BEGIN
PRINT 'Examples of "INSERT INTO SELECT" Statement...'

--Example: 1) Insert all data [all columns] from the source table to the destination table

--Let's create a table named "[dbo].[Restaurant_backup_12112021]" for demonstration.
	CREATE TABLE [dbo].[Restaurant_backup_12112021](
		RestaurantId INT,
		RestaurantName VARCHAR(MAX) NOT NULL,
		Email VARCHAR(100),
		City VARCHAR(100),
		Zipcode VARCHAR(6) NOT NULL,
		State VARCHAR(100) NOT NULL,
		Country VARCHAR(100) NOT NULL,
	);

--The following query will insert all the addresses from [dbo].[Restaurant] table into the [dbo].[Restaurant_backup_12112021] table.
	INSERT INTO [dbo].[Restaurant_backup_12112021]
	SELECT * 
	FROM [dbo].[Restaurant]

--To verify the insertion, use the following query.
	SELECT * FROM [dbo].[Restaurant_backup_12112021]


---Example: 2) Insert data of specific columns from the source table to the destination table

--Let’s create a table named "tbl_Restaurant_Address" for demonstration
	IF OBJECT_ID(N'[dbo].[tbl_Restaurant_Address]', N'U') IS NOT NULL
	BEGIN
		DROP TABLE [dbo].[tbl_Restaurant_Address]
	END

	CREATE TABLE [dbo].[tbl_Restaurant_Address](
		AddressId INT IDENTITY (51, 1) PRIMARY KEY,
		RestaurantName VARCHAR(MAX) NOT NULL,
		Zipcode VARCHAR(6) NOT NULL,
		State VARCHAR(100) NOT NULL,
		Country VARCHAR(100) NOT NULL
	);

--The following query will insert all addresses from [dbo].[Restaurant] table into the [dbo].[tbl_Restaurant_Address] table.
	INSERT INTO [dbo].[tbl_Restaurant_Address] (RestaurantName, Zipcode, State, Country) 
	SELECT RestaurantName, Zipcode, State, Country
	FROM [dbo].[Restaurant]

--To verify the insertion, use the following query.
	SELECT * FROM [dbo].[tbl_Restaurant_Address]


--Example: 3) Insert rows with WHERE condition

--Let’s create a table named "tbl_Restaurant_Address" for demonstration.
	IF OBJECT_ID(N'[dbo].[tbl_Restaurant_Address]', N'U') IS NOT NULL
	BEGIN
		DROP TABLE [dbo].[tbl_Restaurant_Address]
	END

	CREATE TABLE [dbo].[tbl_Restaurant_Address](
		AddressId INT IDENTITY (51, 1) PRIMARY KEY,
		RestaurantName VARCHAR(MAX) NOT NULL,
		Zipcode VARCHAR(6) NOT NULL,
		State VARCHAR(100) NOT NULL,
		Country VARCHAR(100) NOT NULL
	);

--The following query will insert specific addresses from the "[dbo].[Restaurant]" table into the "[dbo].[tbl_Restaurant_Address]" table.
	INSERT INTO [dbo].[tbl_Restaurant_Address] (RestaurantName, Zipcode, State, Country) 
	SELECT RestaurantName, Zipcode, State, Country
	FROM [dbo].[Restaurant]
	WHERE State IN ('UP', 'Delhi')

--To verify the insertion, use the following query.
	SELECT * FROM [dbo].[tbl_Restaurant_Address]


---Example: 4) Insert top N of rows

--A) Top N of rows

--Let’s create a table named "tbl_Restaurant_Address" for demonstration.
	IF OBJECT_ID(N'[dbo].[tbl_Restaurant_Address]', N'U') IS NOT NULL
	BEGIN
		DROP TABLE [dbo].[tbl_Restaurant_Address]
	END

	CREATE TABLE [dbo].[tbl_Restaurant_Address](
		AddressId INT IDENTITY (51, 1) PRIMARY KEY,
		RestaurantName VARCHAR(MAX) NOT NULL,
		Zipcode VARCHAR(6) NOT NULL,
		State VARCHAR(100) NOT NULL,
		Country VARCHAR(100) NOT NULL
	);

--The following query will insert top 10 addresses from the "[dbo].[Restaurant]" table into the "[dbo].[tbl_Restaurant_Address]" table.
	INSERT TOP (10) 
	INTO [dbo].[tbl_Restaurant_Address] (RestaurantName, Zipcode, State, Country) 
	SELECT RestaurantName, Zipcode, State, Country
	FROM [dbo].[Restaurant]

--To verify the insertion, use the following query.
	SELECT * FROM [dbo].[tbl_Restaurant_Address]


--B) Top N PERCENT of rows

--Let’s create a table named "[dbo].[tbl_Restaurant_Address]" for demonstration.
	IF OBJECT_ID(N'[dbo].[tbl_Restaurant_Address]', N'U') IS NOT NULL
	BEGIN
		DROP TABLE [dbo].[tbl_Restaurant_Address]
	END

	CREATE TABLE [dbo].[tbl_Restaurant_Address](
		AddressId INT IDENTITY (51, 1) PRIMARY KEY,
		RestaurantName VARCHAR(MAX) NOT NULL,
		Zipcode VARCHAR(6) NOT NULL,
		State VARCHAR(100) NOT NULL,
		Country VARCHAR(100) NOT NULL
	);

--The following query will insert top 10 PERCENT addresses from the "[dbo].[Restaurant]" table into the "[dbo].[tbl_Restaurant_Address]" table.
	INSERT TOP (10) PERCENT
	INTO [dbo].[tbl_Restaurant_Address] (RestaurantName, Zipcode, State, Country) 
	SELECT RestaurantName, Zipcode, State, Country
	FROM [dbo].[Restaurant]

--To verify the insertion, use the following query.
	SELECT * FROM [dbo].[tbl_Restaurant_Address]


--Example: 5) WITH JOIN Clause: To get data from multiple tables 
	
--Let’s create a table named "[dbo].[tbl_OrderDetails]" for demonstration.
	IF OBJECT_ID(N'[dbo].[tbl_OrderDetails]', N'U') IS NOT NULL
	BEGIN
		DROP TABLE [dbo].[tbl_OrderDetails]
	END

	CREATE TABLE [dbo].[tbl_OrderDetails](
		OrderDetailId INT IDENTITY (51, 1),
		RestaurantName VARCHAR(MAX) NOT NULL,
		Email VARCHAR(100),
		City VARCHAR(100),
		OrderStatus TINYINT NOT NULL, -- ==>> OrderStatus: 4: Cancelled; 3: Pending; 2: Processing; 1: Completed
		OrderDate DATE NOT NULL,
		ShippedDate DATE,
		Quantity INT NOT NULL,
		Price DECIMAL(6, 2) NOT NULL,
		FoodName VARCHAR (255) NOT NULL
	);

--The following query will insert data from multiple tables into the [dbo].[tbl_OrderDetails] table.
	INSERT INTO [tbl_OrderDetails]
	SELECT DISTINCT 
	R.RestaurantName, 
	R.Email, 
	R.City, 
	O.OrderStatus, 
	O.OrderDate, 
	O.ShippedDate, 
	OI.Quantity, 
	OI.Price, 
	M.FoodName
	FROM Restaurant R
	INNER JOIN tbl_Orders O ON R.RestaurantId = O.RestaurantId
	INNER JOIN tbl_OrderItems OI ON O.OrderId = OI.OrderId
	INNER JOIN tbl_Menu M ON OI.MenuId = M.MenuId

--To verify the insertion, use the following query.
	SELECT * FROM [dbo].[tbl_OrderDetails]


--Example: 6) WITH a table variable

--Let’s create a table named "@tbl_Restaurant_Address" for demonstration.
	DECLARE @tbl_Restaurant_Address TABLE (
		AddressId INT IDENTITY (51, 1) PRIMARY KEY,
		RestaurantName VARCHAR(MAX) NOT NULL,
		Zipcode VARCHAR(6) NOT NULL,
		State VARCHAR(100) NOT NULL,
		Country VARCHAR(100) NOT NULL
	);

--The following query will insert all addresses from the [dbo].[Restaurant] table into the @tbl_Restaurant_Address table variable.
	INSERT INTO @tbl_Restaurant_Address (RestaurantName, Zipcode, State, Country) 
	SELECT RestaurantName, Zipcode, State, Country
	FROM [dbo].[Restaurant]

--To verify the insertion, use the following query.
	SELECT * FROM @tbl_Restaurant_Address


--Example: 7) WITH a temporary table

--Let’s create a table named "#tbl_Restaurant_Address" for demonstration.
	CREATE TABLE #tbl_Restaurant_Address(
		AddressId INT IDENTITY (51, 1) PRIMARY KEY,
		RestaurantName VARCHAR(MAX) NOT NULL,
		Zipcode VARCHAR(6) NOT NULL,
		State VARCHAR(100) NOT NULL,
		Country VARCHAR(100) NOT NULL
	);

--The following query will insert all addresses from the [dbo].[Restaurant] table into the #tbl_Restaurant_Address table.
	INSERT INTO #tbl_Restaurant_Address (RestaurantName, Zipcode, State, Country) 
	SELECT RestaurantName, Zipcode, State, Country
	FROM [dbo].[Restaurant]

--To verify the insertion, use the following query.
	SELECT * FROM #tbl_Restaurant_Address

END

-->>------------*---------------------------***---------------------------*------------>>--
-->>------------*---------------------------***---------------------------*------------>>--
-->>------------*---------------------------***---------------------------*------------>>--
-->>------------*---------------------------***---------------------------*------------>>--


IF (1=2) --Comment to proceed...		'Examples of "SELECT INTO" Statement...'
BEGIN
PRINT 'Examples of "SELECT INTO" Statement...'

--Example: 1) Insert all data [all columns] from the source table into a new table

--The following query will insert all data from the [dbo].[Employee] table into the new [dbo].[Employee_bak_12132021] table.
	SELECT * INTO [dbo].[Employee_bak_12132021]
	FROM [dbo].[Employee]

--To verify the insertion, use the following query.
	SELECT * FROM [dbo].[Employee_bak_12132021]


--Example: 2) Insert data of specific columns from the source table into a new table

--The following query will insert all data from the [dbo].[Restaurant] table into the new [dbo].[tbl_RestaurantAddress] table.
	SELECT 
		RestaurantName, 
		Zipcode, 
		State, 
		Country 
	INTO [dbo].[tbl_RestaurantAddress]
	FROM [dbo].[Restaurant]

--To verify the insertion, use the following query.
	SELECT * FROM [dbo].[tbl_RestaurantAddress]
	

--Example: 3) Insert rows with WHERE Condition

--The following query will insert specific addresses from the "[dbo].[Restaurant]" table into the new "[dbo].[tbl_RestaurantAddress]" table.
	IF OBJECT_ID(N'[dbo].[tbl_RestaurantAddress]', N'U') IS NOT NULL
	BEGIN
		DROP TABLE [dbo].[tbl_RestaurantAddress]
	END

	SELECT 
		RestaurantName, 
		Zipcode, 
		State, 
		Country 
	INTO [dbo].[tbl_RestaurantAddress]
	FROM [dbo].[Restaurant]
	WHERE State IN ('UP', 'Delhi')

--To verify the insertion, use the following query.
	SELECT * FROM [dbo].[tbl_RestaurantAddress]

--Example: 4) WITH JOIN Clause: To get data from multiple tables 

--The following statement inserts data from multiple tables into the new [tbl_Order_Details] table.
	SELECT DISTINCT 
	R.RestaurantName, 
	R.Email, 
	R.City, 
	O.OrderStatus, 
	O.OrderDate, 
	O.ShippedDate, 
	OI.Quantity, 
	OI.Price, 
	M.FoodName
	INTO [tbl_Order_Details]
	FROM Restaurant R
	INNER JOIN tbl_Orders O ON R.RestaurantId = O.RestaurantId
	INNER JOIN tbl_OrderItems OI ON O.OrderId = OI.OrderId
	INNER JOIN tbl_Menu M ON OI.MenuId = M.MenuId

--To verify the insertion, use the following query.
	SELECT * FROM [dbo].[tbl_Order_Details]


--Example: 5) To copy table across databases

--First, let’s create a database named "TestDatabase" for demonstration.
	IF (DB_ID('TestingDatabase') IS NOT NULL)
	BEGIN
		DROP DATABASE TestingDatabase;
	END
	CREATE DATABASE TestingDatabase;
	PRINT 'New Database ''TestingDatabase'' Created'

--The following query will insert all data from the [dbo].[Restaurant] table into the new [dbo].[tbl_RestaurantAddress] table.
	SELECT 
		RestaurantName, 
		Zipcode, 
		State, 
		Country 
	INTO TestingDatabase.[dbo].[tbl_RestaurantAddress]
	--INTO TestDatabase..tbl_RestaurantAddress
	FROM [dbo].[Restaurant]

--To verify the insertion, use the following query.
	SELECT * FROM TestingDatabase..tbl_RestaurantAddress


--Example: 6) WITH a temporary table

--The following query will insert all addresses from the [dbo].[Restaurant] table into the #tbl_Restaurant_Addresses table.
	SELECT RestaurantName, Zipcode, State, Country
	INTO #tbl_Restaurant_Addresses 
	FROM [dbo].[Restaurant]

--To verify the insertion, use the following query.
	SELECT * FROM #tbl_Restaurant_Addresses

END

If (1=2) --Comment to proceed...		'Bonus Point...'
BEGIN
PRINT 'Bonus Point'
-- :: --> "SELECT INTO" can also be used to create a new (empty) table using the schema of the source table. To do this, you just need to add a WHERE clause that will make the query return no data.

--Syntax:
	--SELECT * INTO <newtable>
	--FROM <oldtable>
	--WHERE 1 = 0;

--Example:
	SELECT * INTO New_EmployeeTable
	FROM employee
	WHERE 1 = 0;

END
-->>---------*---------------------***--------------------*------------->>--
-->>---------*---------------------***--------------------*------------->>--
					-->>-- Onkar Sharma (Vatsa) --<<--
-->>---------*---------------------***--------------------*------------->>--
-->>---------*---------------------***--------------------*------------->>--