-- ===============================================================================
-- == Author: Onkar Sharma (VATSA), C# Corner MVP (Most Valuable Professional) ===
-- == Created Date: November, 2021 - ---- --- ---- ---- ---- ---- ---- ---- -- ===
-- == Description: DDL Triggers In SQL Server ---- ---- ---- ---- ---- ---- -- ===
-- ===============================================================================

-->>----Execute the following query to create the database...
IF (DB_ID('OnkarSharma_DDLTriggers') IS NOT NULL)
BEGIN
	USE master
	PRINT 'Database exists'
	DROP DATABASE OnkarSharma_DDLTriggers
	PRINT 'Database Dropped...'
END
GO

CREATE DATABASE OnkarSharma_DDLTriggers
PRINT 'New Database ''OnkarSharma_DDLTriggers'' Created'
GO

USE [OnkarSharma_DDLTriggers]
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

SELECT * FROM OnkarSharma_DDLTriggers..Employee
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

SELECT * FROM OnkarSharma_DDLTriggers..Restaurant
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

SELECT * FROM OnkarSharma_DDLTriggers..tbl_Orders
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

SELECT * FROM OnkarSharma_DDLTriggers..tbl_OrderItems
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

SELECT * FROM OnkarSharma_DDLTriggers..tbl_Menu
-->>----tbl_Menu Table ------------------->>--



PRINT '--*----------------------------------------*--'
PRINT 'Now, enjoy the following examples...'
PRINT 'Regards, Onkar Sharma'
PRINT '--*----------------------------------------*--'

--Some useful queries:
----SELECT * FROM sys.triggers
----SELECT * FROM sys.server_triggers  
----SELECT * FROM SYS.TRIGGER_EVENT_TYPES

-->>------------*---------------------------***---------------------------*------------>>--
-->>------------*---------------------------***---------------------------*------------>>--
-->>------------*---------------------------***---------------------------*------------>>--
-->>------------*---------------------------***---------------------------*------------>>--

PRINT 'Now, Uncomment the line From A to B to proceed...'
------From A:

------>> Respond to changes in the database schema...
--PRINT 'Respond to changes in the database schema..'

----Step 1) Execute the following trigger statement to create a DDL Trigger
--IF EXISTS (SELECT * FROM sys.server_triggers WHERE NAME = 'Tr_RespondChanges')  
--DROP TRIGGER Tr_RespondChanges  
--ON ALL SERVER 
--GO

--CREATE TRIGGER Tr_RespondChanges   
--ON ALL SERVER   
--FOR CREATE_DATABASE   
--AS   
--BEGIN
--    SELECT 'New Database Created Successfully...' AS [Welcome Message]
--    PRINT '--*----- New Database Created Successfully -----*--'
--	PRINT '--*-------------- Have a good day --------------*--'
--	PRINT '--*-------- Warm Regards, Onkar Sharma ---------*--'
--END
--GO 

----Step 2) Now, execute the following query to create the database
--CREATE DATABASE TestingRC_Trigger

----And, you will get a custom message on the screen in response to the "Create Database" event...



---->>------------*---------------------------***---------------------------*------------>>--
---->>------------*---------------------------***---------------------------*------------>>--
---->>------------*---------------------------***---------------------------*------------>>--



------>> Record changes or events (Audit) in the database schema....
--PRINT 'Record changes or events (Audit) in the database schema...'

----Step 1) First, create a new table named AuditTable to log table schema changes
--CREATE TABLE AuditTable (
--    LogId INT IDENTITY PRIMARY KEY,
--    Event_Data XML NOT NULL,
--    ChangedBy SYSNAME NOT NULL,
--	ChangedOn DATETIME NOT NULL
--);
--GO

----Step 2) Now, create a DDL trigger to track table schema changes and insert event data in the AuditTable table
--IF EXISTS (SELECT * FROM sys.triggers WHERE NAME = N'Tr_AuditTables' AND PARENT_CLASS_DESC = N'DATABASE')
--BEGIN
--	DROP TRIGGER Tr_AuditTables
--	ON DATABASE
--END
--GO

--CREATE TRIGGER Tr_AuditTables
--ON DATABASE
--FOR	
--    CREATE_TABLE,
--    ALTER_TABLE, 
--    DROP_TABLE
--AS
--BEGIN
--    SET NOCOUNT ON;

--    INSERT INTO AuditTable (
--        Event_Data,
--        ChangedBy,
--		ChangedOn
--    )
--    VALUES (
--        EVENTDATA(),
--        USER,
--		GETDATE()
--    );
--END
--GO

--ENABLE TRIGGER Tr_AuditTables
--ON DATABASE
--GO

----Note: 
------The "EVENTDATA()" function captures information about the event that fires the DDL trigger and the following changes caused by the trigger.
------The function is only available inside the DDL trigger.

----Step 3) Now, create a table in the database "onkarsharma_ddltriggers"
--CREATE TABLE [dbo].[tbl_Clients] (
--	ClientId INT IDENTITY (504, 1),
--	ClientFullName VARCHAR(100) NOT NULL,
--	ClientAddress VARCHAR(250) NOT NULL,
--	EmailId VARCHAR(50) UNIQUE,
--	ContactNo BIGINT NOT NULL,
--	PRIMARY KEY (ClientId)
--);

----Step 4) Now, query the data from the AuditTable table to check whether the table creation event was properly captured by the trigger.
--SELECT * FROM AuditTable

----Note: If you click on a cell in the "Event_Data" column, you can see the XML data for the event.



---->>------------*---------------------------***---------------------------*------------>>--
---->>------------*---------------------------***---------------------------*------------>>--
---->>------------*---------------------------***---------------------------*------------>>--



----->> Prevent certain changes to the database schema...
--PRINT 'Prevent certain changes to the database schema...'

----Step 1) Execute the following trigger statement to create a DDL Trigger
--IF EXISTS (SELECT * FROM sys.triggers WHERE NAME = N'Tr_TablesSecurity' AND PARENT_CLASS_DESC = N'DATABASE')
--BEGIN
--	DROP TRIGGER Tr_TablesSecurity
--	ON DATABASE
--END
--GO

--CREATE TRIGGER Tr_TablesSecurity
--ON DATABASE
--FOR CREATE_TABLE, ALTER_TABLE, DROP_TABLE
--AS
--BEGIN
--	PRINT 'You should ask your DBA or disable the trigger ''Tr_TablesSecurity'' to create, alter, or drop the table!' 
--	ROLLBACK TRANSACTION
--END
--GO

--ENABLE TRIGGER Tr_TablesSecurity
--ON DATABASE
--GO

----Step 2a) CREATE_TABLE: Now, try to create the table by executing the following statement
--CREATE TABLE [dbo].[tbl_Customer] (
--	CustomerId INT IDENTITY (504, 1),
--	CustomerFullName VARCHAR(100) NOT NULL,
--	CustomerAddress VARCHAR(250) NOT NULL,
--	EmailId VARCHAR(50) UNIQUE,
--	ContactNo BIGINT NOT NULL,
--	PRIMARY KEY (CustomerId)
--);

----Step 2b) ALTER_TABLE: Now, try adding a new column "DOB" to the table
--ALTER TABLE Employee
--ADD DOB BIGINT
--GO

----Step 2c) DROP_TABLE: Now, try to drop the table
--DROP TABLE tbl_Menu;

----Step 3)  Now, disable the trigger by executing the following query
--DISABLE TRIGGER Tr_TablesSecurity
--ON DATABASE
--GO

----Step 4) Now, execute the "Step 2a, 2b, and 2c" queries again. And, to confirm, execute the following queries

----CREATE_TABLE:
--SELECT * FROM OnkarSharma_DDLTriggers..tbl_Customer;
----ALTER_TABLE:
--SELECT * FROM OnkarSharma_DDLTriggers..Employee;
----DROP_TABLE:
--SELECT * FROM OnkarSharma_DDLTriggers..tbl_Menu;


------From B:

-->>---------*---------------------***--------------------*------------->>--
-->>---------*---------------------***--------------------*------------->>--
					-->>-- Onkar Sharma (Vatsa) --<<--
-->>---------*---------------------***--------------------*------------->>--
-->>---------*---------------------***--------------------*------------->>--