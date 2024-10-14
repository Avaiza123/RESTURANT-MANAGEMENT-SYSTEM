CREATE DATABASE RESTAURANT1; 
 
USE RESTAURANT1; 
---------------------
 --1. Resturant
---------------------
CREATE TABLE Resturnt
( 
RID INT PRIMARY KEY, 
RNAME VARCHAR(20),  
CONTACTNO INT 
); 

-----------------
--2. Customer
-----------------
CREATE TABLE CUSTOMR
( 
CUSID INT  PRIMARY KEY, 
CUSNAME VARCHAR (30),CUSTNO INT, 
RID INT, foreign key(RID) references Resturnt(RID) 
); 

----------------
 --3. Order
----------------
CREATE TABLE ORDERR
( 
ORDER_NO int NOT NULL PRIMARY KEY, 
NO_OF_ITEM INT 
);  

------------------------
--4. Order Information
------------------------
CREATE TABLE ORDER_INFO 
( 
NO_OF_ITEM INT NOT NULL PRIMARY KEY, 
ORDER_TIME VARCHAR(20) 
); 
-----------------------------
 --5. Resturant Information
-----------------------------
CREATE TABLE RESTAURANT_INFO 
( 
RNAME varchar(20) NOT NULL PRIMARY KEY, 
ADDRESS VARCHAR(20) 
); 

-------------
--6. Waiter
-------------
CREATE TABLE WAITER 
( 
WID int NOT NULL PRIMARY KEY, 
WNAME varchar(30), 
CUSID INT , ORDER_NO INT , foreign key(CUSID) references CUSTOMR(CUSID), 
foreign key(ORDER_NO) references ORDERR(ORDER_NO) 
); 

---------------
 --7. Food
---------------
CREATE TABLE FOOD 
( 
FOOD_NO INT NOT NULL PRIMARY KEY, 
QUANTITY INT , 
DESCRIPTIONN VARCHAR(60), ORDER_NO INT, foreign key(ORDER_NO) references ORDERR(ORDER_NO) 
); 

-------------------
--8. Food Details
-------------------
CREATE TABLE FOOD_DETAILS 
( 
FOOD_NO INT, 
QUANTITY INT, PRICE INT, foreign key(FOOD_NO) references FOOD(FOOD_NO) 
); 

----------
--9. Chef
----------
CREATE TABLE CHEF 
( 
CHEFID INT NOT NULL , 
CHEFNAME VARCHAR(30), ORDER_NO INT, foreign key(ORDER_NO) references ORDERR(ORDER_NO) ); 

------------
--10. Bill
------------
CREATE TABLE BILL 
( 
BILLNO INT NOT NULL PRIMARY KEY, 
ORDER_DTL VARCHAR(30), 
PRICE INT, CUS_ID INT, foreign key(CUS_ID) references CUSTOMR(CUSID) 
); 

--------------------
--11. Bill Details
-------------------
CREATE TABLE BILL_DTLS 
( 
PRICE VARCHAR(10) PRIMARY KEY, 
VAT VARCHAR(15) 
); 


----------------------------
--1. Insert into Resturant
----------------------------
INSERT INTO Resturnt(RID , RNAME , CONTACTNO)  
VALUES 
(1076,'RADHUNI',81522), 
(3026, 'FOOD CLUB',71552), 
(1157, 'LA BAMBA' ,73582), 
(8413, 'TAKEOUT' ,85832), 
(1102,'MAMA-VAGNE',55079);

---------------------------
 --2. Insert into Customer
---------------------------
 INSERT INTO CUSTOMR(CUSID , CUSNAME , CUSTNO , RID) 
VALUES 
(221019, 'SAIF' , 70512 , 1157), 
(221020, 'SHARIF' , 75510 , 1157), 
(221021, 'HASAN' , 16518 , 1157), 
(221022, 'SAYED' , 17519 , 1157), 
(221023, 'ANIQ', 11519 , 1157), 
(221024, 'ROKON' , 16441 , 1102), 
(221025, 'SADIA' , 15851 , 1102); 

----------------------------------------
 --3. Insert into Resturant information
----------------------------------------
INSERT INTO RESTAURANT_INFO(RNAME , ADDRESS) 
VALUES 
('MAMA-VAGNE' , 'ISLAMABAD'), 
('RADHUNI' , 'NAWABGANJ'), 
('FOOD CLUB' , 'NAWABGANJ'), 
('LA BAMBA' , 'LAHORE'), 
('TAKEOUT' , 'BANANI'); 

------------------------
 --5. Insert into Order
------------------------
INSERT INTO ORDERR(ORDER_NO , NO_OF_ITEM)  
VALUES 
(01,03), 
(02,01), 
(03,05), 
(04,01), 
(05,01), 
(06,10);

---------------------------------
--4. Insert into Waiter
-- Insert data into WAITER table
---------------------------------
INSERT INTO WAITER (WID, WNAME, CUSID, ORDER_NO)
VALUES 
(101, 'PAUL', 221023, 06),  
(102, 'SAKIL', 221019, 06), 
(103, 'GOPAUL', 221020, 01), 
(104, 'SAKILA', 221021, 02), 
(110, 'JAMIL', 221022, 03), 
(111, 'PAUL', 221024, 04),  
(119, 'ASAD', 221025, 05); 

------------------------------------
 --6. Insert into Order Information
------------------------------------
INSERT INTO ORDER_INFO(NO_OF_ITEM , ORDER_TIME) 
VALUES 
(01,'10 MINS'), 
(02,'10 MINS'), 
(05,'25 MINS'), 
(03,'20 MINS'), 
(10,'35 MINS'), 
(04,'15 MINS'); 
  
-----------------------
  --7. Insert into Food
-----------------------
INSERT INTO FOOD(FOOD_NO , QUANTITY , DESCRIPTIONN , ORDER_NO) 
VALUES 
(510,1, 'NEHARI', 1), 
(600, 1,'BEEF BURGER', 2), 
(601,3,'COLD DRINKS' ,3), 
(152, 1, 'MASALA DOSA',4), 
(111,1,'CHICKEN PARM',5), 
(501,2,'SIZZLING PRAWN', 6); 

-------------------------------  
  --8. Insert into Food Details
-------------------------------
INSERT INTO FOOD_DETAILS(FOOD_NO , QUANTITY , PRICE) 
VALUES 
(601,1,20), 
(501,1,1050), 
(600, 1,400), 
(510,1,150), 
(152,1,100), 
(111,1,400); 

----------------------
 --9. Insert into Chef
----------------------
INSERT INTO CHEF(CHEFID , CHEFNAME , ORDER_NO) 
VALUES 
(201, 'TONNY',1), 
(201, 'TONNY',2),  
(205,'KHALID', 3),  
(205,'KHALID', 4), 
(205,'KHALID',5), 
(207,'BONY',6); 
 
-----------------------
 --10. Insert intoBill
-----------------------
INSERT INTO BILL(BILLNO , ORDER_DTL , PRICE  , CUS_ID) 
VALUES 
(11, 'NEHARI',150, 221020), 
(12, 'BEEF BURGER',400, 221021), 
(13, 'SIZZLING PRAWN',1050, 221023), 
(14, 'SIZZLING PRAWN',1050 , 221019), 
(15, 'MASALA DOSA',100,221024), 
(16, 'CHICKEN PARM',400 ,221025); 
 
-------------------------------
 --11. Insert into Bill Details
-------------------------------
INSERT INTO BILL_DTLS(PRICE , VAT) 
VALUES
('20PKR','3PKR'), 
('400PKR','60PKR'), 
('150PKR','22.5PKR'), 
('100PKR','15PKR'); 


--------------------------------------------------------------
--Procedure to insert a new customer into the CUSTOMR table.--
--------------------------------------------------------------
CREATE PROCEDURE InsertCustomer 
(
    @CUSID INT,
    @CUSNAME VARCHAR(30),
    @CUSTNO INT,
    @RID INT
)
AS
BEGIN
    INSERT INTO CUSTOMR (CUSID, CUSNAME, CUSTNO, RID)
    VALUES (@CUSID, @CUSNAME, @CUSTNO, @RID);
END;


----------------------------------------------------------
--Procedure to insert a new order into the ORDERR table.--
----------------------------------------------------------
CREATE PROCEDURE InsertOrder
    @OrderNo INT,
    @NoOfItem INT
AS
BEGIN
    INSERT INTO ORDERR (ORDER_NO, NO_OF_ITEM)
    VALUES (@OrderNo, @NoOfItem);
END;
GO

-----------------------------------------------------------
--Procedure to insert a new waiter into the WAITER table.--
-----------------------------------------------------------
CREATE PROCEDURE InsertWaiter
(
    @WID INT,
    @WNAME VARCHAR(30),
    @CUSID INT,
    @ORDER_NO INT
)
AS
BEGIN
    INSERT INTO WAITER (WID, WNAME, CUSID, ORDER_NO)
    VALUES (@WID, @WNAME, @CUSID, @ORDER_NO);
END;
GO

----------------------------------------------------------------
--Procedure to retrieve order details for a given customer ID.--
----------------------------------------------------------------
CREATE PROCEDURE GetOrderDetailsByCustomerID
(
    @CUSID INT
)
AS
BEGIN
    SELECT ORDERR.ORDER_NO, ORDERR.NO_OF_ITEM
    FROM ORDERR
    JOIN WAITER ON ORDERR.ORDER_NO = WAITER.ORDER_NO
    WHERE WAITER.CUSID = @CUSID;
END;
GO

-------------------------------------------------------------------------
--Procedure to calculate the total bill amount for a given customer ID.--
-------------------------------------------------------------------------
CREATE PROCEDURE CalculateBillTotal
(
    @CUSID INT
)
AS
BEGIN
    SELECT SUM(PRICE) AS TotalBill
    FROM BILL
    WHERE CUS_ID = @CUSID;
END;

---------------------------------------------------
-- Procedure to show data from the Resturnt table--
---------------------------------------------------
CREATE PROCEDURE ShowResturntData
AS
BEGIN
    SELECT * FROM Resturnt;
END;
GO

--------------------------------------------------
-- Procedure to show data from the CUSTOMR table--
--------------------------------------------------
CREATE PROCEDURE ShowCUSTOMRData
AS
BEGIN
    SELECT * FROM CUSTOMR;
END;
GO

-------------------------------------------------
-- Procedure to show data from the ORDERR table--
-------------------------------------------------
CREATE PROCEDURE ShowORDERRData
AS
BEGIN
    SELECT * FROM ORDERR;
END;
GO

-----------------------------------------------------
-- Procedure to show data from the ORDER_INFO table--
-----------------------------------------------------
CREATE PROCEDURE ShowORDER_INFOData
AS
BEGIN
    SELECT * FROM ORDER_INFO;
END;
GO

----------------------------------------------------------
-- Procedure to show data from the RESTAURANT_INFO table--
----------------------------------------------------------
CREATE PROCEDURE ShowRESTAURANT_INFOData
AS
BEGIN
    SELECT * FROM RESTAURANT_INFO;
END;
GO

-------------------------------------------------
-- Procedure to show data from the WAITER table--
-------------------------------------------------
CREATE PROCEDURE ShowWAITERData
AS
BEGIN
    SELECT * FROM WAITER;
END;
GO

-----------------------------------------------
-- Procedure to show data from the FOOD table--
-----------------------------------------------
CREATE PROCEDURE ShowFOODData
AS
BEGIN
    SELECT * FROM FOOD;
END;
GO

-------------------------------------------------------
-- Procedure to show data from the FOOD_DETAILS table--
-------------------------------------------------------
CREATE PROCEDURE ShowFOOD_DETAILSData
AS
BEGIN
    SELECT * FROM FOOD_DETAILS;
END;
GO

-----------------------------------------------
-- Procedure to show data from the CHEF table--
-----------------------------------------------
CREATE PROCEDURE ShowCHEFData
AS
BEGIN
    SELECT * FROM CHEF;
END;
GO

-----------------------------------------------
-- Procedure to show data from the BILL table--
-----------------------------------------------
CREATE PROCEDURE ShowBILLData
AS
BEGIN
    SELECT * FROM BILL;
END;
GO

----------------------------------------------------
-- Procedure to show data from the BILL_DTLS table--
----------------------------------------------------
CREATE PROCEDURE ShowBILL_DTLSData
AS
BEGIN
    SELECT * FROM BILL_DTLS;
END;
GO

---------------------------------------------------
--------SHOWING EXECUTION OF PROCEDURES------------
---------------------------------------------------
EXEC ShowResturntData;
EXEC ShowCUSTOMRData;
EXEC InsertCustomer 221026, 'JOHN', 12345, 1076;
EXEC InsertOrder 07, 02;
EXEC InsertWaiter 120, 'JAMES', 221026, 07;
EXEC GetOrderDetailsByCustomerID 221026;
EXEC CalculateBillTotal 221026;


------------------------------------------------------------
---Trigger to Enforce Maximum Quantity Limit in FOOD Table--
------------------------------------------------------------

CREATE TRIGGER MaxFoodQuantityTrigger
ON FOOD
FOR INSERT, UPDATE
AS
BEGIN
    IF EXISTS (SELECT 1 FROM inserted WHERE QUANTITY > 10)
    BEGIN
        RAISERROR ('Maximum quantity limit exceeded.', 16, 1);
        ROLLBACK TRANSACTION;
        RETURN;
    END
END;


-----------------------------------------------------------------
------Trigger to Update NO_OF_ITEM in ORDER_INFO Table-----------
-----------------------------------------------------------------

CREATE TRIGGER UpdateOrderInfoTrigger
ON ORDERR
AFTER INSERT, UPDATE
AS
BEGIN
    UPDATE ORDER_INFO
    SET NO_OF_ITEM = (SELECT COUNT(*) FROM inserted)
    WHERE NO_OF_ITEM IS NULL; -- Assuming NO_OF_ITEM is NULL before the first order
END;

-------------------------------------------------------------------------------------------
-- Attempt to insert or update a record with a quantity greater than 10 in the FOOD table
-------------------------------------------------------------------------------------------
INSERT INTO FOOD (FOOD_NO, QUANTITY, DESCRIPTIONN, ORDER_NO) 
VALUES (701, 15, 'Example Food', 1); -- This will trigger the MaxFoodQuantityTrigger

-- Another example update statement
UPDATE FOOD
SET QUANTITY = 8
WHERE FOOD_NO = 701; -- This will not trigger the MaxFoodQuantityTrigger


--------------------------------------------------------
-- Inserting a new order with a unique ORDER_NO value
--------------------------------------------------------
INSERT INTO ORDERR (ORDER_NO, NO_OF_ITEM)
VALUES (8, 4); -- Assuming 8 is a unique ORDER_NO value

-- Updating an existing order with a unique ORDER_NO value
UPDATE ORDERR
SET NO_OF_ITEM = 6
WHERE ORDER_NO = 8; -- Assuming 8 is a unique ORDER_NO value





