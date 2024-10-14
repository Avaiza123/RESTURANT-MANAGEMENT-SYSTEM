-- Create the restaurant database
CREATE DATABASE RESTAURANT1;

USE RESTAURANT1;

---------------------
-- 1. Restaurant
---------------------
CREATE TABLE Restaurant
(
    RID INT PRIMARY KEY,
    RNAME VARCHAR(20),
    CONTACTNO INT
);

-----------------
-- 2. Customer
-----------------
CREATE TABLE Customer
(
    CUSID INT PRIMARY KEY,
    CUSNAME VARCHAR(30),
    CUSTNO INT,
    RID INT,
    FOREIGN KEY (RID) REFERENCES Restaurant(RID)
);

----------------
-- 3. Order
----------------
CREATE TABLE [Order]
(
    ORDER_NO INT NOT NULL PRIMARY KEY,
    NO_OF_ITEM INT
);

------------------------
-- 4. Order Information
------------------------
CREATE TABLE Order_Info
(
    NO_OF_ITEM INT NOT NULL PRIMARY KEY,
    ORDER_TIME VARCHAR(20)
);

-----------------------------
-- 5. Restaurant Information
-----------------------------
CREATE TABLE Restaurant_Info
(
    RNAME VARCHAR(20) NOT NULL PRIMARY KEY,
    ADDRESS VARCHAR(20)
);

-------------
-- 6. Waiter
-------------
CREATE TABLE Waiter
(
    WID INT NOT NULL PRIMARY KEY,
    WNAME VARCHAR(30),
    CUSID INT,
    ORDER_NO INT,
    FOREIGN KEY (CUSID) REFERENCES Customer(CUSID),
    FOREIGN KEY (ORDER_NO) REFERENCES [Order](ORDER_NO)
);

---------------
-- 7. Food
---------------
CREATE TABLE Food
(
    FOOD_NO INT NOT NULL PRIMARY KEY,
    QUANTITY INT,
    DESCRIPTION VARCHAR(60),
    ORDER_NO INT,
    FOREIGN KEY (ORDER_NO) REFERENCES [Order](ORDER_NO)
);

-------------------
-- 8. Food Details
-------------------
CREATE TABLE Food_Details
(
    FOOD_NO INT,
    QUANTITY INT,
    PRICE INT,
    FOREIGN KEY (FOOD_NO) REFERENCES Food(FOOD_NO)
);

----------
-- 9. Chef
----------
CREATE TABLE Chef
(
    CHEFID INT NOT NULL,
    CHEFNAME VARCHAR(30),
    ORDER_NO INT,
    FOREIGN KEY (ORDER_NO) REFERENCES [Order](ORDER_NO)
);

------------
-- 10. Bill
------------
CREATE TABLE Bill
(
    BILLNO INT NOT NULL PRIMARY KEY,
    ORDER_DTL VARCHAR(30),
    PRICE INT,
    CUS_ID INT,
    FOREIGN KEY (CUS_ID) REFERENCES Customer(CUSID)
);

--------------------
-- 11. Bill Details
--------------------
CREATE TABLE Bill_Details
(
    PRICE VARCHAR(10) PRIMARY KEY,
    VAT VARCHAR(15)
);

----------------------------
-- 1. Insert into Restaurant
----------------------------
INSERT INTO Restaurant(RID, RNAME, CONTACTNO)  
VALUES 
(1076, 'RADHUNI', 81522), 
(3026, 'FOOD CLUB', 71552), 
(1157, 'LA BAMBA', 73582), 
(8413, 'TAKEOUT', 85832), 
(1102, 'MAMA-VAGNE', 55079);

---------------------------
-- 2. Insert into Customer
---------------------------
INSERT INTO Customer(CUSID, CUSNAME, CUSTNO, RID) 
VALUES 
(221019, 'SAIF', 70512, 1157), 
(221020, 'SHARIF', 75510, 1157), 
(221021, 'HASAN', 16518, 1157), 
(221022, 'SAYED', 17519, 1157), 
(221023, 'ANIQ', 11519, 1157), 
(221024, 'ROKON', 16441, 1102), 
(221025, 'SADIA', 15851, 1102); 

----------------------------------------
-- 3. Insert into Restaurant Information
----------------------------------------
INSERT INTO Restaurant_Info(RNAME, ADDRESS) 
VALUES 
('MAMA-VAGNE', 'ISLAMABAD'), 
('RADHUNI', 'NAWABGANJ'), 
('FOOD CLUB', 'NAWABGANJ'), 
('LA BAMBA', 'LAHORE'), 
('TAKEOUT', 'BANANI'); 

------------------------
-- 5. Insert into Order
------------------------
INSERT INTO [Order](ORDER_NO, NO_OF_ITEM)  
VALUES 
(1, 3), 
(2, 1), 
(3, 5), 
(4, 1), 
(5, 1), 
(6, 10);

---------------------------------
-- 4. Insert into Waiter
---------------------------------
INSERT INTO Waiter(WID, WNAME, CUSID, ORDER_NO)
VALUES 
(101, 'PAUL', 221023, 6),  
(102, 'SAKIL', 221019, 6), 
(103, 'GOPAUL', 221020, 1), 
(104, 'SAKILA', 221021, 2), 
(110, 'JAMIL', 221022, 3), 
(111, 'PAUL', 221024, 4),  
(119, 'ASAD', 221025, 5); 

------------------------------------
-- 6. Insert into Order Information
------------------------------------
INSERT INTO Order_Info(NO_OF_ITEM, ORDER_TIME) 
VALUES 
(1, '10 MINS'), 
(2, '10 MINS'), 
(5, '25 MINS'), 
(3, '20 MINS'), 
(10, '35 MINS'), 
(4, '15 MINS'); 
  
-----------------------
-- 7. Insert into Food
-----------------------
INSERT INTO Food(FOOD_NO, QUANTITY, DESCRIPTION, ORDER_NO) 
VALUES 
(510, 1, 'NEHARI', 1), 
(600, 1, 'BEEF BURGER', 2), 
(601, 3, 'COLD DRINKS', 3), 
(152, 1, 'MASALA DOSA', 4), 
(111, 1, 'CHICKEN PARM', 5), 
(501, 2, 'SIZZLING PRAWN', 6); 

-------------------------------  
-- 8. Insert into Food Details
-------------------------------
INSERT INTO Food_Details(FOOD_NO, QUANTITY, PRICE) 
VALUES 
(601, 1, 20), 
(501, 1, 1050), 
(600, 1, 400), 
(510, 1, 150), 
(152, 1, 100), 
(111, 1, 400); 

----------------------
-- 9. Insert into Chef
----------------------
INSERT INTO Chef(CHEFID, CHEFNAME, ORDER_NO) 
VALUES 
(201, 'TONNY', 1), 
(201, 'TONNY', 2),  
(205, 'KHALID', 3),  
(205, 'KHALID', 4), 
(205, 'KHALID', 5), 
(207, 'BONY', 6); 
 
-----------------------
-- 10. Insert into Bill
-----------------------
INSERT INTO Bill(BILLNO, ORDER_DTL, PRICE, CUS_ID) 
VALUES 
(11, 'NEHARI', 150, 221020), 
(12, 'BEEF BURGER', 400, 221021), 
(13, 'SIZZLING PRAWN', 1050, 221023), 
(14, 'SIZZLING PRAWN', 1050, 221019), 
(15, 'MASALA DOSA', 100, 221024), 
(16, 'CHICKEN PARM', 400, 221025); 
 
-------------------------------
-- 11. Insert into Bill Details
-------------------------------
INSERT INTO Bill_Details(PRICE, VAT) 
VALUES
('20PKR', '3PKR'), 
('400PKR', '60PKR'), 
('150PKR', '22.5PKR'), 
('100PKR', '15PKR'); 

--------------------------------------------------------------
-- Procedure to insert a new customer into the Customer table
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
    INSERT INTO Customer (CUSID, CUSNAME, CUSTNO, RID)
    VALUES (@CUSID, @CUSNAME, @CUSTNO, @RID);
END;
GO

----------------------------------------------------------
-- Procedure to insert a new order into the Order table
----------------------------------------------------------
CREATE PROCEDURE InsertOrder
    @OrderNo INT,
    @NoOfItem INT
AS
BEGIN
    INSERT INTO [Order] (ORDER_NO, NO_OF_ITEM)
    VALUES (@OrderNo, @NoOfItem);
END;
GO

-----------------------------------------------------------
-- Procedure to insert a new waiter into the Waiter table
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
    INSERT INTO Waiter (WID, WNAME, CUSID, ORDER_NO)
    VALUES (@WID, @WNAME, @CUSID, @ORDER_NO);
END;
GO

----------------------------------------------------------------
-- Procedure to retrieve order details for a given customer ID
----------------------------------------------------------------
CREATE PROCEDURE GetOrderDetailsByCustomerID
(
    @CUSID INT
)
AS
BEGIN
    SELECT [Order].ORDER_NO, [Order].NO_OF_ITEM
    FROM [Order]
    JOIN Waiter ON [Order].ORDER_NO = Waiter.ORDER_NO
    WHERE Waiter.CUSID = @CUSID;
END;
GO

------------------------------------------------------------------
-- Trigger to update the Order table when a new Food item is added
------------------------------------------------------------------
CREATE TRIGGER UpdateOrderAfterFoodInsert
ON Food
AFTER INSERT
AS
BEGIN
    DECLARE @OrderNo INT;
    SELECT @OrderNo = ORDER_NO FROM inserted;
    
    UPDATE [Order]
    SET NO_OF_ITEM = NO_OF_ITEM + 1
    WHERE ORDER_NO = @OrderNo;
END;
GO
