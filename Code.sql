/*
-- Key constraint - domain constraints - referential integrity
-- 1-11, 1-M, m-m relationships

- Candidate key: Any attribute that contains a unique value in each row table
- Composite key: Composed of two or more attributes to form a unique value in each row
- Alternate key: A candidate key not selected as the primary key
- Foreign key

*/
-- Create the database ---
CREATE DATABASE college;

-- Create the table ---
CREATE TABLE Address (id int NOT NULL,  street VARCHAR(255), postcode VARCHAR(10) DEFAULT "HA97DE", town VARCHAR(30) DEFAULT "Harrow");


-- Insert some data---
INSERT INTO Student(column_ID, first_name, last_name)
       VALUES ('Levis', "Strauss");

-- Update the database---
UPDATE Student
       SET first_name= "Lass"
       WHERE column_ID='2';

-- DELETE data ---
DELETE FROM Student
       WHERE Icolumn_ID = '03';

---- DROP Table ---------
DROP TABLE table_name;

--- ALTER TAble------------
ALTER TABLE table_name ADD primary key (column_name);


--- TRUNCATE Command---
-- Purpose: To remove all records from a table, which will empty the table
 --      but not delete the table itself.
TRUNCATE TABLE table_name;

--====================== DQL ===================
SELECT first_name, last_name
      FROM Student;

SELECT first_name, last_name
    FROM Student
    WHERE ID = ?

-- GRANT,REVOKE (DCL) COMMIT - ROLLBACK (TCL)

-- Lab1
CREATE DATABASE cm_devices;
USE cm_devices;
CREATE TABLE devices( deviceID int, deviceName varchar(50), price decimal);
SHOW DATABASE;
show columns from devices;
SHOW TABLES;
CREATE TABLE feedback(feedbackID CHAR(8), feedbackType VARCHAR(100), comment TEXT(500));
CREATE TABLE customers( username CHAR(9), fullName VARCHAR(100), email VARCHAR(255));
-- Postgres---
-- Show: \dt
-- sql server:SELECT * FROM INFORMATION_SCHEMA.TABLES;
-- SQLite:SELECT name FROM sqlite_master WHERE type='table';
CREATE TABLE Address (id int NOT NULL,  street VARCHAR(255), postcode VARCHAR(10) DEFAULT "HA97DE", town VARCHAR(30) DEFAULT "Harrow");
DROP TABLE Address;
City VARCHAR(30) DEFAULT "London";
City VARCHAR(30) DEFAULT "London";
CREATE TABLE invoice(customerID VARCHAR(50), orderDate DATE, quantity INT, price DECIMAL);
Show tables;
Show columns from invoice;

--- Altering the table
ALTER TABLE students ADD (age INT, country VARCHAR(50));
ALTER TABLE students DROP column nationality;
ALTER TABLE students MODIFY country VARCHAR(100);

CREATE TABLE customers
(CustomerI INT,
 FirstName VARCHAR(40),
 LastName VARCHAR(20),
 Company VARCHAR(80),
 Address VARCHAR(70),
 City VARCHAR(40),
 State VARCHAR(40),
 Country VARCHAR(40),
 PostalCode VARCHAR(10),
 Phone VARCHAR(24),
 Fax VARCHAR(24),
 Email VARCHAR(60),
 SupportRapid INT;

INSERT INTO customers(customerID, customerName, customerAddress)
VALUES (1, "Jack", "115 Old street Belfast");
INSERT INTO customers(customerID, customerName, customerAddress)
VALUES (2, "James", "24 Carlson Rd London")

-- We can combine both together

insert into country (countryName) select country FROM players;

--     UPDATING THE DATABASE--------
set

Delete from Student  where last_name = '?'

-------------------------- Sql Operators ---------------------
select 10 + 10;
SELECT column_name1 + column_name2 FROM table_name;
SELECT salary + allowance FROM employee;

SELECT *
FROM employee
WHERE salary + allowance = 25000;

SELECT salary - tax FROM employee;

SELECT *
FROM employee
WHERE salary - tax = 50000;

SELECT *
FROM employee
WHERE tax * 2 = 4000;

SELECT allowance / salary * 100 FROM employee;



SELECT *
FROM employee
WHERE allowance / salary * 100 >= 5;


SELECT hours % 2 FROM employee;

SELECT *
FROM employee
WHERE hours % 2 = 0;

/*
 Operator

What it does

=

Checks for equality

<>  or !=

Checks for not inequality

>

Check if something is greater than

>=

Check if something is greater than or equal

<

Check if something is less than

<=

Check if something is less than or equal


 */
SELECT * FROM employee WHERE employee_id = 1;
SELECT * FROM employee WHERE employee_name = 'James';

SELECT *
FROM employee
WHERE salary <> 24000;

SELECT *
FROM employee
WHERE salary > 50000;


SELECT *
FROM employee
WHERE tax >= 1000;

SELECT *
FROM employee
WHERE allowance < 2500;


SELECT *
FROM employee
WHERE hours <= 10;


SELECT Total + 0.25 FROM invoices;
SELECT Total * 2 FROM invoices;
SELECT Total - 0.15 FROM invoices;
SELECT Total / 2 FROM invoices;
SELECT Total % 2 FROM invoices;

/*------------------------- Sorting Data ----------------------- */
select ID, first_name From student order by name ASC;

SELECT *
FROM customers
ORDER BY CustomerId DESC;


SELECT *
FROM customers
ORDER BY City;

SELECT *
FROM customers
ORDER BY City DESC;

SELECT *
FROM invoices
ORDER BY InvoiceDate;

SELECT *
FROM invoices
ORDER BY InvoiceDate DESC;

SELECT *
FROM invoices
ORDER BY BillingCity ASC, InvoiceDate DESC;

/*-------------- WHERE clause---------------
  BETWEEN
  LIKE
  IN
  AND
 */

 Select * from student where LIKE 's%' -- start with s

Select * from country IN('USA', 'UK');

/*
 Comparison operators
Operator

Description

=

Checks if the values of two operands are equal or not. If yes, then condition becomes true.

!=

Checks if the values of two operands are equal or not. If values are not equal, then condition becomes true.

<>

Checks if the values of two operands are equal or not. If values are not equal, then condition becomes true.

>

Checks if the value of the left operand is greater than the value of the right operand. If yes, then condition becomes true.

<

Checks if the value of left operand is less than the value of right operand. If yes, then condition becomes true.

>=

Checks if the value of the left operand is greater than or equal to the value of right operand. If yes, then condition becomes true.

<=

Check if the value of the left operand is less than or equal to the value of the right operand. If yes then condition becomes true.

!<

Checks if the value of the left operand is not less than the value of the right operand. If yes, then condition becomes true.

!>

Checks if the value of the left operand is not greater than the value of the right operand. If yes, then condition becomes true.


Logical operators
Operator

Description

ALL

Used to compare a single value to all the values in another value set.

AND

Allows for the existence of multiple conditions in an SQL statement's WHERE clause.

ANY

Used to compare a value to any applicable value in the list as per the condition.

BETWEEN

Used to search for values that are within a set of values, given the minimum value and the maximum value.

EXISTS

Used to search for the presence of a row in a specified table that meets a certain criterion.

IN

Used to compare a value to a list of literal values that have been specified.

LIKE

Used to compare a value to similar values using wildcard operators.

NOT

Reverses the meaning of the logical operator with which it is used. For example: NOT EXISTS, NOT BETWEEN, NOT IN, etc. This is a negate operator.

OR

Used to combine multiple conditions in an SQL statement's WHERE clause.

IS NULL

Used to compare a value with a NULL value.

UNIQUE

Searches every row of a specified table for uniqueness (no duplicates).
 */
SELECT *
FROM invoices
WHERE Total > 2;


SELECT *
FROM invoices
WHERE Total > 2 AND BillingCountry = 'USA';


SELECT *
FROM invoices
WHERE BillingCountry = 'USA' OR BillingCountry='France';


SELECT *
FROM invoices
WHERE Total > 2 AND (BillingCountry = 'USA' OR BillingCountry = 'France');

-- Exercise
CREATE DATABASE Chinook
USE Chinook;

CREATE TABLE Customer ( CustomerId INT NOT NULL, FirstName VARCHAR(40) NOT NULL,
                        LastName VARCHAR(20) NOT NULL,
                        Company VARCHAR(80),
                        Address VARCHAR(70),
                        City VARCHAR(40),
                        State VARCHAR(40),
                        Country VARCHAR(40),
                        PostalCode VARCHAR(10),
                        Phone VARCHAR(24),
                        Fax VARCHAR(24),
                        Email VARCHAR(60) NOT NULL,
                        SupportRepId INT, CONSTRAINT PK_Customer PRIMARY KEY  (CustomerId) );


INSERT INTO Customer (CustomerId, FirstName, LastName, Company, Address, City, State, Country, PostalCode, Phone, Fax, Email, SupportRepId) VALUES (1, 'Luís', 'Gonçalves', 'Embraer - Empresa Brasileira de Aeronáutica S.A.', 'Av. Brigadeiro Faria Lima, 2170', 'São José dos Campos', 'SP', 'Brazil', '12227-000', '+55 (12) 3923-5555', '+55 (12) 3923-5566', 'luisg@embraer.com.br', 3);
INSERT INTO Customer (CustomerId, FirstName, LastName, Company, Address, City, State, Country, PostalCode, Phone, Fax, Email, SupportRepId) VALUES (2, 'Eduardo', 'Martins', 'Woodstock Discos', 'Rua Dr. Falcão Filho, 155', 'São Paulo', 'SP', 'Brazil', '01007-010', '+55 (11) 3033-5446', '+55 (11) 3033-4564', 'eduardo@woodstock.com.br', 4);

INSERT INTO Customer (CustomerId, FirstName, LastName, Company, Address, City, State, Country, PostalCode, Phone, Fax, Email, SupportRepId) VALUES
    (3, 'Alexandre', 'Rocha', 'Banco do Brasil S.A.', 'Av. Paulista, 2022', 'São Paulo', 'SP', 'Brazil', '01310-200', '+55 (11) 3055-3278', '+55 (11) 3055-8131', 'alero@uol.com.br', 5);

INSERT INTO Customer (CustomerId, FirstName, LastName, Company, Address, City, State, Country, PostalCode, Phone, Fax, Email, SupportRepId) VALUES
    (4, 'Roberto', 'Almeida', 'Riotur', 'Praça Pio X, 119', 'Rio de Janeiro', 'RJ', 'Brazil', '20040-020', '+55 (21) 2271-7000', '+55 (21) 2271-7070', 'roberto.almeida@riotur.gov.br', 3);

INSERT INTO Customer (CustomerId, FirstName, LastName, Company, Address, City, State, Country, PostalCode, Phone, Fax, Email, SupportRepId) VALUES (5, 'Mark', 'Philips', 'Telus', '8210 111 ST NW', 'Edmonton', 'AB', 'Canada', 'T6G 2C7', '+1 (780) 434-4554', '+1 (780) 434-5565', 'mphilips12@shaw.ca', 5);

INSERT INTO Customer (CustomerId, FirstName, LastName, Company, Address, City, State, Country, PostalCode, Phone, Fax, Email, SupportRepId) VALUES (6, 'Jennifer', 'Peterson', 'Rogers Canada', '700 W Pender Street', 'Vancouver', 'BC', 'Canada', 'V6C 1G8', '+1 (604) 688-2255', '+1 (604) 688-8756', 'jenniferp@rogers.ca', 3);

-- Queries-------

select CustomerID, FirstName, LastName, City, State, Country from Customer;
select CustomerID, FirstName, LastName, City, State, Country from Customer ORDER BY FirstName;
select CustomerID, FirstName, LastName, City, State, Country from Customer WHERE Country = "Brazil" ORDER BY FirstName;
SELECT FirstName, Country FROM Customer WHERE Country = "Canada" ORDER BY FirstName;


/*------------------- Select distinct ---------*/

select distinct country from student;

SELECT BillingCountry
FROM invoices
ORDER BY BillingCountry;

SELECT DISTINCT BillingCountry
FROM invoices
ORDER BY BillingCountry;

SELECT BillingCountry, BillingCity
FROM invoices;


SELECT DISTINCT BillingCountry, BillingCity
FROM invoices
ORDER BY BillingCountry, BillingCity;

SELECT DISTINCT BillingCountry, BillingCit
FROM invoices
ORDER BY BillingCountry, BillingCity;


SELECT COUNT(DISTINCT country)
FROM customers;


/*----------------- Schemas  ---------*/
create table customer(
    customer_id INT,
    name VARCHAR(100),
    address VARCHAR(255),
    email VARCHAR(100),
    phone VARCHAR(10),
    PRIMARY KEY (cutomer_id)
);

create table product(
     product_id INT,
     name VARCHAR(100),
     price NUMERIC(8, 2),
     description VARCHAR(100),
     phone VARCHAR(10),
     PRIMARY KEY (product_id)
);

create table cart_order(
    order_id INT,
    customer_id INT,
    product_id INT,
    quantity INT,
    order_date DATE,
    status VARCHAR(100),
    PRIMARY KEY (order_id),
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    FOREIGN KEY (product_id) REFERENCES product(product_id)
);

-----------------------
CREATE TABLE tbl(
    table_id INT,
    location VARCHAR(255),
    PRIMARY KEY (table_id)
);

CREATE TABLE waiter(
   waiter_id INT,
   name VARCHAR(150),
   contact_no VARCHAR(10),
   shift VARCHAR(10),
   PRIMARY KEY (waiter_id)
);

CREATE TABLE table_order(
    order_id INT,
    date_time DATETIME,
    table_id INT,
    waiter_id INT,
    PRIMARY KEY (order_id),
    FOREIGN KEY (table_id) REFERENCES tbl(table_id),
    FOREIGN KEY (waiter_id) REFERENCES waiter(waiter_id)
);

CREATE TABLE customer(
     customer_id INT,
     name VARCHAR(100),
     NIC_no VARCHAR(12),
     contact_no VARCHAR(10),
     PRIMARY KEY (customer_id)
);
CREATE TABLE reservation(
    reservation_id INT,
    date_time DATETIME,
    no_of_pax INT,
    order_id INT,
    table_id INT,
    customer_id INT,
    PRIMARY KEY (reservation_id),
    FOREIGN KEY (order_id) REFERENCES table_order(table_id),
    FOREIGN KEY (table_id) REFERENCES tbl(table_id),
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
);

CREATE TABLE menu(
     menu_id INT,
     description VARCHAR(255),
     availability INT,
     PRIMARY KEY (menu_id)
);

CREATE TABLE menu_item(
      menu_item_id INT,
      description VARCHAR(255),
      price FLOAT,
      availability INT,
      menu_id INT,
      PRIMARY KEY (menu_item_id),
      FOREIGN KEY (menu_id) REFERENCES menu(menu_id)
);

CREATE TABLE order_menu_item(
    order_id INT,
    menu_item_id INT,
    quantity INT,
    PRIMARY KEY (order_id,menu_item_id),
    FOREIGN KEY (order_id) REFERENCES table_order(order_id),
    FOREIGN KEY (menu_item_id) REFERENCES menu_item(menu_item_id)
);
-- =====================================================================
CREATE TABLE Staff(
  Email VARCHAR(200) NOT NULL,
  Name VARCHAR(255) NOT NULL,
  CONSTRAINT PK_Email PRIMARY KEY (Email)
);

CREATE TABLE Surgery
    (DoctorID VARCHAR(10),
     DoctorName VARCHAR(50),
     Region VARCHAR(20),
     PatientID VARCHAR(10),
     PatientName VARCHAR(50),
     SurgeryNumber INT, Council VARCHAR(20),
     Postcode VARCHAR(10),
     SlotID VARCHAR(5),
     TotalCost Decimal);


CREATE TABLE Patient
    (PatientID VARCHAR(10) NOT NULL,
     PatientName VARCHAR(50),
     SlotID VARCHAR(10) NOT NULL,
     TotalCost Decimal,
     CONSTRAINT PK_Patient
         PRIMARY KEY (PatientID, SlotID));

CREATE TABLE Doctor
(DoctorID VARCHAR(10),
 DoctorName VARCHAR(50), PRIMARY KEY (DoctorID)
);

CREATE TABLE Surgery
(SurgeryNumber INT NOT NULL,
 Region VARCHAR(20), Council VARCHAR(20),
 Postcode VARCHAR(10), PRIMARY KEY (SurgeryNumber)
);

CREATE TABLE Patient
(PatientID VARCHAR(10) NOT NULL,
 PatientName, VARCHAR(50), PRIMARY KEY (PatientID)
);

CREATE TABLE Appointments
(AppointmentID INT NOT NULL,
 SlotID, VARCHAR(10),
 TotalCost Decimal, PRIMARY KEY (AppointmentID)
);

CREATE TABLE Location
(SurgeryNumber INT NOT NULL,
 Postcode VARCHAR(10), PRIMARY KEY (SurgeryNumber)
);

CREATE TABLE Council
(Council VARCHAR(20) NOT NULL,
 Region VARCHAR(20), PRIMARY KEY (Council)
);
