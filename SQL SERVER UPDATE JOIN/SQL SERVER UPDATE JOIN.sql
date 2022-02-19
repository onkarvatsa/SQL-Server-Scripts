-- ===============================================================================
-- == Author: Onkar Sharma (VATSA), C# Corner MVP (Most Valuable Professional) ===
-- == Created Date: December, 2021 - ---- --- ---- ---- ---- ---- ---- ---- -- ===
-- == Description: SQL Server UPDATE JOIN --- ---- ---- ---- ---- ---- ---- -- ===
-- ===============================================================================

-->>----Execute the following query to create the database...
IF (DB_ID('OnkarSharma_UPDATE_JOIN') IS NOT NULL)
BEGIN
	USE master
	PRINT 'Database exists'
	DROP DATABASE OnkarSharma_UPDATE_JOIN
	PRINT 'Database Dropped...'
END
GO

CREATE DATABASE OnkarSharma_UPDATE_JOIN
PRINT 'New Database ''OnkarSharma_UPDATE_JOIN'' Created'
GO

USE [OnkarSharma_UPDATE_JOIN]
GO

-->>----Employee Table ------------------->>--
CREATE TABLE [dbo].[Employee] (
	EmployeeID INT IDENTITY (31100,1),
	EmployerID BIGINT NOT NULL DEFAULT 228866,
	FirstName VARCHAR(50) NOT NULL,
	LastName VARCHAR(50) NOT NULL,
	Email VARCHAR(255) NOT NULL,
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

SELECT * FROM OnkarSharma_UPDATE_JOIN..Employee
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

SELECT * FROM OnkarSharma_UPDATE_JOIN..Restaurant
-->>----Restaurant Table End ------------------->>--



-->>----tbl_Orders Table ------------------->>--
CREATE TABLE [dbo].[tbl_Orders] (
	OrderId INT IDENTITY (108, 1) PRIMARY KEY,
	FoodieID INT,
	OrderStatus TINYINT NOT NULL, -- ==>> OrderStatus: 4: Cancelled; 3: Pending; 2: Processing; 1: Completed
	OrderDate DATETIME NOT NULL,
	ShippedDate DATETIME,
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

SELECT * FROM OnkarSharma_UPDATE_JOIN..tbl_Orders
-->>----Store Table End ------------------->>--



-->>----tbl_OrderItems Table ------------------->>--
CREATE TABLE [dbo].[tbl_OrderItems](
	OrderId INT NOT NULL,
	ItemId INT,
	MenuId INT NOT NULL,
	Quantity INT NOT NULL,
	Price DECIMAL(6, 2) NOT NULL,
	BillAmount DECIMAL(5, 2) NULL,
	PRIMARY KEY (ItemId)
);

INSERT INTO tbl_OrderItems VALUES
(108, 1, 81, 4, 100.50, NULL),
(108, 2, 82, 8, 30.00, NULL),
(108, 3, 83, 25, 25.00, NULL),
(109, 4, 81, 4, 100.50, NULL),
(109, 5, 84, 1, 25.00, NULL),
(109, 6, 87, 1, 580.50, NULL),
(110, 7, 88, 1, 620.00, NULL),
(110, 8, 89, 1, 560.00, NULL),
(111, 9, 82, 8, 30.00, NULL),
(112, 10, 81, 4, 100.50, NULL),
(112, 11, 82, 8, 30.00, NULL),
(112, 12, 83, 25, 25.00, NULL),
(113, 13, 84, 4, 25.00, NULL),
(114, 14, 85, 1, 300.50, NULL),
(114, 15, 86, 2, 120.00, NULL),
(114, 16, 87, 1, 580.50, NULL),
(115, 17, 88, 1, 620.00, NULL),
(116, 18, 89, 1, 560.00, NULL),
(116, 19, 81, 4, 100.50, NULL),
(116, 20, 84, 4, 25.00, NULL)

SELECT * FROM OnkarSharma_UPDATE_JOIN..tbl_OrderItems
-->>----tbl_OrderItems Table ------------------->>--



-->>----tbl_Menu Table ------------------->>--
CREATE TABLE [dbo].[tbl_Menu] (
	MenuId INT IDENTITY (81, 1) PRIMARY KEY,
	FoodCategoryID INT NOT NULL,
	FoodName VARCHAR (255) NOT NULL,
	TypeofFood VARCHAR (100) NOT NULL,
	Price DECIMAL(6, 2) NOT NULL,
	Discount DECIMAL(5, 2) NOT NULL DEFAULT 0,
);

INSERT INTO tbl_Menu VALUES
(1, 'Chhole Bhature', 'Indian Food', 100.50, 10.50),
(1, 'Samosa', 'Indian Food', 30.00, 3.00),
(2, 'Panipuri/Golgappe', 'Indian Food', 25.00, 2.50),
(2, 'Masala Chai', 'Indian Food', 25.00, 2.50),
(3, 'Jalebi', 'Indian Food', 300.50, 30.50),
(4, 'Aloo Parantha', 'Indian Food', 120.00, 12.00),
(4, 'Panjiri', 'Indian Food', 580.50, 58.50),
(5, 'Coconut Ladoo', 'Indian Food', 620.00, 62.00),
(6, 'Khakhra', 'Indian Food', 560.00, 56.00)

SELECT * FROM OnkarSharma_UPDATE_JOIN..tbl_Menu
-->>----tbl_Menu Table ------------------->>--



PRINT '--*----------------------------------------*--'
PRINT 'Now, enjoy the following examples...'
PRINT 'Regards, Onkar Sharma'
PRINT '--*----------------------------------------*--'

-->>------------*---------------------------***---------------------------*------------>>--
-->>------------*---------------------------***---------------------------*------------>>--
-->>------------*---------------------------***---------------------------*------------>>--
-->>------------*---------------------------***---------------------------*------------>>--

IF (1=2) --Comment to proceed...		--> 'Examples of "UPDATE JOIN" Statement...'
BEGIN
PRINT 'Examples of "UPDATE JOIN"...'

--Example: 1) To get the correct data back

--Let’s create an audit table named "[dbo].[tbl_EmployeeAudit]" for demonstration.
	SELECT * INTO [dbo].[tbl_EmployeeAudit]
	FROM [dbo].[Employee]

--Suppose, the DBA wants to update the email of an employee in the Employees table, but unfortunately the DBA executed the update query without the WHERE clause.
	UPDATE [dbo].[Employee]
	SET Email = 'Sdwivedi@vatsa.com'

	--UPDATE EA
	--SET Email = 'SDwivedi@vatsa.com'
	--FROM [dbo].[Employee] EA

--Now, DBA can restore all correct emails using the audit table with the help of the UPDATE JOIN to get back the correct data.
	UPDATE Employee
	SET Employee.Email = tbl_EmployeeAudit.Email
	FROM Employee
	INNER JOIN tbl_EmployeeAudit on Employee.EmployeeID = tbl_EmployeeAudit.EmployeeID

	--UPDATE E
	--SET E.Email = BE.Email
	--FROM Employee E
	--INNER JOIN tbl_EmployeeAudit BE on E.EmployeeID = BE.EmployeeID

--Use the following query to see the result.
	SELECT * FROM [dbo].[Employee]

--Example: 2) To calculate bill amount using multiple tables

--With the help of the following query, you can calculate the bill amount for the ordered items by using UPDATE INNER JOIN.
	UPDATE tbl_OrderItems
	SET tbl_OrderItems.BillAmount = (tbl_OrderItems.Price * tbl_OrderItems.Quantity) - (tbl_OrderItems.Quantity * tbl_Menu.Discount)
	FROM tbl_OrderItems
	INNER JOIN tbl_Menu ON tbl_OrderItems.MenuId = tbl_Menu.MenuId

--Use the following query to see the result.
	SELECT * FROM OnkarSharma_UPDATE_JOIN..tbl_OrderItems

--Example: 3) To update multiple columns from multiple tables

--By using SQL Server UPDATE JOIN, you cannot update multiple tables at the same time. If you try to update multiple columns from multiple tables, an error message will appear.
	UPDATE tbl_OrderItems
	SET 
	tbl_OrderItems.BillAmount = 0,
	tbl_Menu.Discount = 0
	FROM tbl_OrderItems
	INNER JOIN tbl_Menu ON tbl_OrderItems.MenuId = tbl_Menu.MenuId

--Now, to update multiple tables, you have to execute separate queries.
	UPDATE tbl_OrderItems
	SET tbl_OrderItems.BillAmount = 0
	FROM tbl_OrderItems
	INNER JOIN tbl_Menu ON tbl_OrderItems.MenuId = tbl_Menu.MenuId

	UPDATE tbl_Menu
	SET tbl_Menu.Discount = 0
	FROM tbl_Menu
	INNER JOIN tbl_OrderItems ON tbl_OrderItems.MenuId = tbl_Menu.MenuId

--Use the following query to see the result.
	SELECT * FROM OnkarSharma_UPDATE_JOIN..tbl_OrderItems
	SELECT * FROM OnkarSharma_UPDATE_JOIN..tbl_Menu

END

-->>---------*---------------------***--------------------*------------->>--
-->>---------*---------------------***--------------------*------------->>--
					-->>-- Onkar Sharma (Vatsa) --<<--
-->>---------*---------------------***--------------------*------------->>--
-->>---------*---------------------***--------------------*------------->>--