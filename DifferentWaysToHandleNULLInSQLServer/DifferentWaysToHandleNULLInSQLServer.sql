/* -- Author: Onkar Sharma (VATSA), C# Corner MVP ----- */
/* -- Created Date: August, 2021 ---------------------- */
/* -- Description: Different Ways To Handle NULL In SQL Server -- */

-->>----Execute the following query to create a database...
IF (DB_ID('OnkarSharma') IS NOT NULL)
BEGIN
	USE master
	PRINT 'Database exists'
	DROP DATABASE OnkarSharma
	PRINT 'Database Dropped...'
END
GO

CREATE DATABASE OnkarSharma
PRINT 'New Database ''OnkarSharma'' Created'
GO

USE OnkarSharma
GO

-->>----HandleISNULL Table
CREATE TABLE HandleISNULL(
	EmployeeID INT IDENTITY (31100,11),
	EmployerID BIGINT NOT NULL DEFAULT 228866,
	EmployeeFullName VARCHAR (100) NOT NULL,
	DefaultTask VARCHAR(100),
	Salary BIGINT,
	PrimaryContactNo BIGINT,
	SecondaryContactNo BIGINT,
	Telephone INT
	PRIMARY KEY (EmployeeID)
)

INSERT INTO HandleISNULL VALUES
(DEFAULT, 'Prabhas', 'Development', 2100000, 789654123, 741258963, NULL),
(DEFAULT, 'John Sinha', NULL, NULL, 123654789, NULL, NULL),
(DEFAULT, 'Meenu Tiwari', 'HR', 1800000, 456987132, 963258741, NULL),
(DEFAULT, 'Rolex John', NULL, NULL, 951478632, NULL, NULL),
(DEFAULT, 'Neeraj Chopra', 'Marketing', 900000, 485936217, NULL, NULL),
(DEFAULT, 'Neeraj__Chopra', 'Admin', 5200000,369147852, 326159874, NULL),
(DEFAULT, 'Bajrang Punia', 'HR', 1700000, 98653247, 784512369, NULL),
(DEFAULT, 'Satish', 'Development', 2300000, NULL, NULL, NULL),
(DEFAULT, 'Parneeti Dhoppra', 'Support', 700000, 123654789, 48963157, NULL),
(DEFAULT, 'Ananya Pandey', NULL, 300000, 547896321, NULL,NULL),
(DEFAULT, 'Shraddha Kapoor', 'Account', 1500000, NULL, NULL, 265819),
(DEFAULT, 'Akshay Sharma', NULL, NULL, 648521789, NULL,NULL)

SELECT * FROM OnkarSharma..HandleISNULL
-->>----HandleISNULL Table End

PRINT '--*----------------------------------------*--'
PRINT 'Now, enjoy the following examples...'
PRINT 'Regards, Onkar Sharma'
PRINT '--*----------------------------------------*--'




-->>---------*---------------------***--------------------*------------->>--
-->>---------*---------------------***--------------------*------------->>--
-->>---------*---------------------***--------------------*------------->>--
-->>---------*---------------------***--------------------*------------->>--
BEGIN

-- Wrong Query
SELECT * FROM OnkarSharma..HandleISNULL
WHERE DefaultTask = NULL

SELECT * FROM OnkarSharma..HandleISNULL
WHERE DefaultTask != NULL

-- Right Query
SELECT * FROM OnkarSharma..HandleISNULL
WHERE DefaultTask IS NULL

SELECT * FROM OnkarSharma..HandleISNULL
WHERE DefaultTask IS NOT NULL

END

-->>---------*---------------------***--------------------*------------->>--
-->>---------*---------------------***--------------------*------------->>--
---->> Examples for Handling ISNULL...
PRINT 'Examples for Handling ISNULL...'

--1) ISNULL Examples
--a) Simple Example
SELECT ISNULL (NULL, 108) NULL_REPLACEMENT;
SELECT ISNULL (NULL,'SQLServer') NULL_REPLACEMENT;
SELECT ISNULL ('OnkarSharma','SQLServer') NULL_REPLACEMENT;
SELECT ISNULL (NULL,GETDATE()) NULL_REPLACEMENT;

--b) Complex Example: Return the list of all employees who did not provide an alternate phone/contact number
SELECT
EmployerID,
EmployeeID,
EmployeeFullName,
ISNULL(DefaultTask, 'Trainee') AS DefaultTask, PrimaryContactNo,
ISNULL(CAST(SecondaryContactNo AS VARCHAR), 'NOT Available') AS 'Secondary Contact No'
FROM OnkarSharma..HandleISNULL
WHERE SecondaryContactNo IS NULL

-->>---------*---------------------***--------------------*------------->>--
--2) COALESCE Examples
--a) Simple Example
SELECT COALESCE (NULL,'A','B') NULL_REPLACEMENT
SELECT COALESCE (NULL,100,120,130,140) NULL_REPLACEMENT
SELECT COALESCE (NULL,NULL,521,NULL,NULL) NULL_REPLACEMENT
SELECT COALESCE (NULL,NULL,'','C-sharpcorner') NULL_REPLACEMENT
SELECT COALESCE (NULL,NULL,NULL,'Onkar Sharma') NULL_REPLACEMENT
SELECT COALESCE (NULL,NULL,NULL,1,'Onkar Sharma MVP') NULL_REPLACEMENT

--b) Complex Example:
SELECT
EmployerID,
EmployeeID,
EmployeeFullName,
COALESCE(CAST(PrimaryContactNo AS VARCHAR), CAST(SecondaryContactNo AS VARCHAR), CAST(Telephone AS VARCHAR), 'NOT Available') AS 'Available Contact Number'
FROM OnkarSharma..HandleISNULL

-->>---------*---------------------***--------------------*------------->>--
--3) CASE Example
SELECT
EmployerID,
EmployeeID,
EmployeeFullName,
CASE WHEN DefaultTask IS NULL THEN '*Trainee' ELSE DefaultTask END AS DefaultTask,
CASE WHEN Salary IS NULL THEN 360000 ELSE Salary END AS Salary
FROM OnkarSharma..HandleISNULL



-->>---------*---------------------***--------------------*------------->>--
-->>---------*---------------------***--------------------*------------->>--
					-->>-- Onkar Sharma (Vatsa) --<<--
-->>---------*---------------------***--------------------*------------->>--
-->>---------*---------------------***--------------------*------------->>--