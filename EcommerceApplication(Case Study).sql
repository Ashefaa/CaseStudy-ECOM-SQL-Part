--Create a Database for Ecommerce Application
CREATE DATABASE ECOM_APP

--1) Create a table for  Customers 
CREATE TABLE Customers(
customer_id INT IDENTITY(1,1) PRIMARY KEY ,
name VARCHAR(50) ,
email VARCHAR(50) ,
password TEXT )

--2) Create a table for Products 
CREATE TABLE Product(
product_id INT  IDENTITY(1,1)PRIMARY KEY ,
name VARCHAR(50) , 
price MONEY ,
description TEXT,
stockQuantity INT )

--3) Create a table for Cart
CREATE TABLE Cart(
cart_id INT PRIMARY KEY ,
customer_id INT ,
product_id INT ,
quantity INT ,
FOREIGN KEY(customer_id) REFERENCES Customers(customer_id),
FOREIGN KEY(product_id) REFERENCES Product(product_id)
ON DELETE CASCADE)

--4) Create a table for orders
CREATE TABLE Orders(
order_id INT IDENTITY(1,1) PRIMARY KEY ,
customer_id INT ,
order_date DATE ,
total_price MONEY ,
shipping_address TEXT,
FOREIGN KEY(customer_id) REFERENCES Customers(customer_id)
ON DELETE CASCADE )

--5) Create a table order_items
CREATE TABLE order_items(
order_item_id INT PRIMARY KEY ,
order_id INT ,
product_id INT ,
quantity INT ,
FOREIGN KEY(order_id) REFERENCES Orders(order_id)ON DELETE CASCADE,
FOREIGN KEY(product_id) REFERENCES Product(product_id)
ON DELETE CASCADE)

--Insert Values into Customers table
INSERT INTO Customers VALUES('Ann Paul','annpaul@gmail.com','abcd'),
('Ashwin','ashwin@gmail.com','1234'),
('Indira Priya','ipd@gmail.com','a1b2'),
('Neha Satya','nehas@gmail.com','ijkl'),
('Ashik','ashik@gmail.com','1q2w3e')

--Insert values into Products
INSERT INTO Product VALUES('Printed Shirts',500,'Shirts with pattern printed on it',100),
('Kurta tops',100,'Cotton Floral Design Kurta Tops',200),
('LG Smart TV',40000,'32 inches LG smart TV',20),
('One Plus Nord CE 2 LITE',25000,'Latest One Plus Nord Mobile Phone in Busta Lime Color',30),
('Table Lamp',200,'Cute table lamp for home decors',100)

--Insert values into Cart Table
Insert INTO Cart Values(1,2,1,2),
(2,1,2,1),
(3,3,4,1),
(4,1,3,1),
(5,5,1,3),
(6,4,2,2)

--Insert values into Orders Table
INSERT INTO Orders VALUES(2,'2023-07-19',1000,'Coimbatore'),
(1,'2023-09-10',100,'Chennai'),
(3,'2023-12-12',25000,'Coimbatore'),
(1,'2024-01-25',40000,'Chennai'),
(5,'2024-02-10',1500,'Coonoor'),
(4,'2023-03-29',200,'Banglore')

--Insert values into order_items table
INSERT INTO order_items VALUES(1,1,1,2),
(2,3,4,1),
(3,2,2,1),
(4,6,2,2),
(5,4,3,1),
(6,5,1,3)

--Add to cart
INSERT INTO Cart VALUES
(7,5,1,1)

--remove from cart
DELETE FROM Cart WHERE  product_id=4

--get all from cart
SELECT * FROM Cart

--get a order by customer
SELECT order_id FROM Orders
WHERE customer_id=1

--create product
INSERT INTO Product
VALUES('Laptop',60000,'Laptop for gaming and commercial use',10)

--create customer
INSERT INTO Customers
VALUES('Sri Ram','sri@gmail.com','q2w1e3')