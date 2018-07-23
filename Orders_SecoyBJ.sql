DROP DATABASE IF EXISTS Orders_SecoyBJ;
CREATE DATABASE Orders_SecoyBJ;
 
USE Orders_SecoyBJ;
 
CREATE TABLE Customer
(
   custNum CHAR(4) PRIMARY KEY,
   name VARCHAR(10) NOT NULL,
   city VARCHAR(10),
   credLimit DECIMAL(9,2)
);
 
CREATE TABLE CustOrder
(
   orderNum CHAR(4) PRIMARY KEY,
   amount DECIMAL(9,2) NOT NULL,
   ordDate DATE,
   custNum CHAR(4),
   FOREIGN KEY (custNum) REFERENCES Customer(custNum)
);
 
CREATE TABLE Salesperson
(
   salesNum CHAR(4) PRIMARY KEY,
   name VARCHAR(20) NOT NULL,
   city VARCHAR(10)
);
 
INSERT INTO Salesperson 
    VALUES(1001,'Peel','London'),
          (1002,'Serres','San Jose'),
          (1004,'Motika','London'),
          (1007,'Rifkin','Barcelona'),
          (1003,'Alexrod','New York');
 
INSERT INTO Customer 
    VALUES(2001,'Hoffman','London',1000),
          (2002,'Gionanni','Rome',2000),
          (2003,'Liu','San Jose',2000),
          (2004,'Grass','Berlin',3000),
          (2006,'Clemens','London',16000),
          (2007,'Cisneros','San Jose',3000),
          (2008,'Pereira','Rome',1200);
 
INSERT INTO CustOrder 
    VALUES(3001,18.69,'2016-08-30',2008),
          (3002,1900.10,'2016-08-03',2007),
          (3003,5160.45,'2016-08-30',2003),
          (3004,1098.16,'2016-08-04',2008),
          (3005,75.75,'2016-08-04',2004),
          (3006,4723.00,'2016-08-05',2006),
          (3007,1390.00,'2016-08-06',2004),
          (3008,9891.00,'2016-08-06',2006);
 
ALTER TABLE Salesperson 
    ADD commission DECIMAL(3,2);
 
UPDATE Salesperson 
    SET commission=.12 
    WHERE salesNum='1001';
     
UPDATE Salesperson 
    SET commission=.10 
    WHERE salesNum='1002';
     
UPDATE Salesperson 
    SET commission=.11 
    WHERE salesNum='1003';
     
UPDATE Salesperson 
    SET commission=.10 
    WHERE salesNum='1007';
     
UPDATE Salesperson 
    SET commission=.14 
    WHERE salesNum='1004';
 
ALTER TABLE CustOrder 
    ADD salesNum CHAR(4),
    ADD FOREIGN KEY (salesNum) REFERENCES Salesperson(salesNum);
     
UPDATE CustOrder 
    SET salesNum='1007'
    WHERE orderNum='3001';
     
UPDATE CustOrder 
    SET salesNum='1004'
    WHERE orderNum='3002';
     
UPDATE CustOrder 
    SET salesNum='1001'
    WHERE orderNum='3003';
     
UPDATE CustOrder 
    SET salesNum='1007'
    WHERE orderNum='3004';
     
UPDATE CustOrder 
    SET salesNum='1002'
    WHERE orderNum='3005';
     
UPDATE CustOrder 
    SET salesNum='1007'
    WHERE orderNum='3006';
     
UPDATE CustOrder 
    SET salesNum='1002'
    WHERE orderNum='3007';
     
UPDATE CustOrder 
    SET salesNum='1001'
    WHERE orderNum='3008';
     
ALTER TABLE Customer 
    ADD salesNum CHAR(4), 
    ADD FOREIGN KEY (salesNum) REFERENCES Salesperson(salesNum);
     
UPDATE Customer 
    SET salesNum='1001'
    WHERE custNum='2001';
 
UPDATE Customer 
    SET salesNum='1003'
    WHERE custNum='2002';
 
UPDATE Customer 
    SET salesNum='1002'
    WHERE custNum='2003';
 
UPDATE Customer 
    SET salesNum='1002'
    WHERE custNum='2004';
 
UPDATE Customer 
    SET salesNum='1001'
    WHERE custNum='2006';
 
UPDATE Customer 
    SET salesNum='1007'
    WHERE custNum='2008';
 
UPDATE Customer 
    SET salesNum='1004'
    WHERE custNum='2007';
 
UPDATE Customer 
    SET salesNum='1004'
    WHERE custNum='2005';