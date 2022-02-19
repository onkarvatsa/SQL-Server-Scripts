-- ===============================================================================
-- == Author: Onkar Sharma (VATSA), C# Corner MVP (Most Valuable Professional) ===
-- == Created Date: September, 2021 ---- --- ---- ---- ---- ------- ---- ----- ===
-- == Description: IIF Function In SQL Server ---- ---- ---- ---- ---- ---- -- ===
-- ===============================================================================

-->>----Execute the following query to create a database (OnlineFoodStore)...
IF (DB_ID('OnkarSharma_OFS') IS NOT NULL)
BEGIN
	USE master
	PRINT 'Database exists'
	DROP DATABASE OnkarSharma_OFS
	PRINT 'Database Dropped...'
END
GO

CREATE DATABASE OnkarSharma_OFS	--(OnlineFoodStore)
PRINT 'New Database ''OnkarSharma_OFS'' Created'
GO

USE [OnkarSharma_OFS]
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

SELECT * FROM OnkarSharma_OFS..Employee
-->>----Employee Table End ------------------->>--



-->>----Restaurant Table ------------------->>--
CREATE TABLE [dbo].[Restaurant](
	RestaurantId INT IDENTITY (51, 1),
	RestaurantName VARCHAR(MAX) NOT NULL,
	Email VARCHAR(100),
	City VARCHAR(100),
	State VARCHAR(100) NOT NULL,
	Country VARCHAR(100) NOT NULL,
	PRIMARY KEY(RestaurantId)
);

INSERT INTO Restaurant VALUES
('BSR Vatsa', NULL, 'Bulandshahr', 'UP', 'IND'),
('GZB Vatsa', NULL, 'Ghaziabad', 'UP', 'IND'),
('Delhi Vatsa', NULL, NULL, 'Delhi', 'IND'),
('Himadri Vatsa', NULL, NULL, 'HP', 'IND'),
('Patiala Vatsa', NULL, NULL, 'PB', 'IND'),
('MRT Vatsa', NULL, 'Meerut', 'UP', 'IND'),
('G_Vatsa', NULL, NULL, 'GA', 'IND')

SELECT * FROM OnkarSharma_OFS..Restaurant
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

SELECT * FROM OnkarSharma_OFS..tbl_Orders
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

SELECT * FROM OnkarSharma_OFS..tbl_OrderItems
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

SELECT * FROM OnkarSharma_OFS..tbl_Menu
-->>----tbl_Menu Table ------------------->>--



PRINT '--*----------------------------------------*--'
PRINT 'Now, enjoy the following examples...'
PRINT 'Regards, Onkar Sharma'
PRINT '--*----------------------------------------*--'


-->>---------*---------------------***--------------------*------------->>--
-->>---------*---------------------***--------------------*------------->>--
-->>---------*---------------------***--------------------*------------->>--
-->>---------*---------------------***--------------------*------------->>--
IF (1=2) ---->> IIF Function Examples...
BEGIN
PRINT 'IIF Function Examples...'

--1) IIF Function for comparing integer values
	
	SELECT IIF( 25 * 10 = 250, 'TRUE', 'FALSE' ) AS 'Result'	--The following example will return true_value because boolean_expression is true.

--2) IIF Function with variables

	DECLARE @a INT = 25, @b INT = 12;
	SELECT IIF( @a * @b = 300, 'TRUE', 'FALSE' ) AS 'Result'	--In the following example, variables are used to compare two integer values.

--3) IIF with string functions
--A) The following example accepts a string with a length greater than 10.
	
	SELECT IIF(LEN('Hello! Vatsa') > 10, 'StringAccepted', 'StringRejected') AS [Result]

--B) The following example checks the ASCII value.
	
	SELECT IIF(ASCII('A') = 65, 'ASCIIAccepted', 'ASCIIRejected') AS [Result]

--C) The following example compares string data using the IIF function.

	DECLARE @Person VARCHAR (25) = 'Onkar Sharma'
	SELECT @Person + ' likes ' + IIF(@Person = 'Onkar Sharma', 'Mercedes-Benz Maybach', 'Audi A8') AS [Result]

--4) IIF Function with data type precedence

	SELECT IIF(21 < 11, 551.50, 551) Result

--5) IIF Function with NULL
--A) IIF with NULL constants
	
	--SELECT IIF( 25 * 12 = 300, NULL, NULL ) Result	--If we specify "NULL" in true_value and false_value, this statement will result in an error.

--B) IIF with NULL parameters
	
	DECLARE @aa INT = NULL, @bb INT = NULL
	SELECT IIF( 25 * 12 = 300, @aa, @bb ) Result

--6) IIF Function With Aggregate Function
--SUM(): The following example summarizes the total orders along with the order status.

	SELECT    
	   SUM(IIF(OrderStatus = 1, 1, 0)) AS 'Completed',  
	   SUM(IIF(OrderStatus = 2, 1, 0)) AS 'Processing',  
	   SUM(IIF(OrderStatus = 3, 1, 0)) AS 'Pending',  
	   SUM(IIF(OrderStatus = 4, 1, 0)) AS 'Cancelled',  
	   COUNT(OrderId) AS 'Total Orders'
	FROM tbl_Orders
	WHERE YEAR(OrderDate) = 2021

--7) Nested IIF Function (with GROUP BY Clause): The following example summarizes the total orders along with the order status.
	
	SELECT    
	   IIF(OrderStatus = 1, 'Completed', 
			IIF(OrderStatus=2, 'Processing', 
				IIF(OrderStatus=3, 'Pending', 
					IIF(OrderStatus=4, 'Cancelled', '')
					)
				)
			) AS [Order Status],
	   COUNT(OrderId) AS 'Total Orders'
	FROM tbl_Orders
	GROUP BY OrderStatus

END

IF(1=2)	--Points to Remember
BEGIN
PRINT 'Points to Remember...'

	SELECT EmployeeID, CONCAT(FirstName , ' ' , LastName) AS [Full Name], 
		   Email, DepartmentID, GrossSalary,
		   IIF(ContactNo IS NULL, 'Not Available', ContactNo) AS [Contact Number]
	FROM OnkarSharma_OFS..Employee

END
-->>---------*---------------------***--------------------*------------->>--
-->>---------*---------------------***--------------------*------------->>--
					-->>-- Onkar Sharma (Vatsa) --<<--
-->>---------*---------------------***--------------------*------------->>--
-->>---------*---------------------***--------------------*------------->>--