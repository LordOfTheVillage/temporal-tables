SELECT * 
FROM dbo.Regular_Customers;

-- 01.02.2022

INSERT INTO [Customers] (customer_id, first_name, last_name, gender, email, phone_number, address_line_1, address_line_2, city, state, postal_code, country)
VALUES (34, 'John1', 'Doe', 'Male', 'john2.doe@gmail.com', '535-1227', '123 Main St', 'Apt 2B', 'Los Angeles', 'NY', '10001', 'USA'),
       (35, 'Jane1', 'Doe', 'Female', 'jane2.doe@mail.ru', '53-5633', '456 Elm St', NULL, 'San Francisco', 'CA', '90001', 'USA'),
       (36, 'Bob1', 'Smith', 'Male', 'bob2.smith@gmail.com', '554-2468', '789 Oak St', NULL, 'New York', 'CA', '94101', 'USA'),
	   (37, 'Alice1', 'Johnson', 'Female', 'alice2.johnson@gmail.com', '555-3691', '321 Pine St', NULL, 'Chicago', 'IL', '60601', 'USA'),
       (38, 'Tom1', 'Brown', 'Male', 'tom2.brown@mail.ru', '162-74-73', '55 Lenina St', NULL, 'Homel', 'HR', '331051', 'Belarus');

UPDATE Customers
SET last_name = N'Smith-Doe'
WHERE customer_id = 3;
GO

UPDATE Customers
SET last_name = N'Brown-Smith'
WHERE customer_id = 4;
GO

UPDATE Customers
SET last_name = N'Doe-Wilson'
WHERE customer_id = 5;
GO

UPDATE Customers
SET last_name = N'Smith-Doe'
WHERE customer_id = 1;
GO

UPDATE Customers
SET last_name = N'Johnson-Doe'
WHERE customer_id = 2;
GO

DELETE FROM  dbo.Regular_Customers
WHERE  regular_id = 1

DELETE FROM  dbo.Regular_Customers
WHERE  regular_id = 2

DELETE FROM  dbo.Regular_Customers
WHERE  regular_id = 3

--05.03.2022

INSERT INTO [Orders] (order_id, customer_id, order_date, regular_customer_discount)
VALUES (5, 7, '2022-03-05', (SELECT CASE WHEN EXISTS(SELECT 1 FROM [Regular_Customers] WHERE customer_id = 7) THEN 2 ELSE 0 END)),
	   (6, 9, '2022-03-05', (SELECT CASE WHEN EXISTS(SELECT 1 FROM [Regular_Customers] WHERE customer_id = 9) THEN 2 ELSE 0 END)),
	   (7, 14, '2022-03-05', (SELECT CASE WHEN EXISTS(SELECT 1 FROM [Regular_Customers] WHERE customer_id = 14) THEN 2 ELSE 0 END)),
	   (8, 10, '2022-03-05', (SELECT CASE WHEN EXISTS(SELECT 1 FROM [Regular_Customers] WHERE customer_id = 10) THEN 2 ELSE 0 END)),
	   (9, 15, '2022-03-05', (SELECT CASE WHEN EXISTS(SELECT 1 FROM [Regular_Customers] WHERE customer_id = 15) THEN 2 ELSE 0 END));

UPDATE Products
SET price = 5.70
WHERE product_id = 3;
GO

UPDATE Products
SET price = 1.12
WHERE product_id = 4;
GO

UPDATE Products
SET price = 4.40
WHERE product_id = 5;
GO

UPDATE Products
SET price = 5.05
WHERE product_id = 1;
GO

UPDATE Products
SET price = 2.50
WHERE product_id = 2;
GO

DELETE FROM Product_Categories
WHERE category_id = (SELECT category_id FROM Categories WHERE name =  'Fruit')

DELETE FROM Categories WHERE name = 'Fruit'

--10.04.2022

INSERT INTO [Products] (product_id, name, price, unit_of_measurement_id)
VALUES (21, 'Apple1', 0.45, 1),
	   (22, 'Banana1', 0.65, 2),
	   (23, 'Carrot1', 3.00, 3),
	   (24, 'Milk1', 2.40, 4),
	   (25, 'Bread1', 3.50, 1);

UPDATE Customers
SET last_name = N'Smith-Doe'
WHERE customer_id = 10;
GO

UPDATE Customers
SET last_name = N'Brown-Smith'
WHERE customer_id = 11;
GO

UPDATE Customers
SET last_name = N'Doe-Wilson'
WHERE customer_id = 12;
GO

UPDATE Customers
SET last_name = N'Smith-Doe'
WHERE customer_id = 13;
GO

UPDATE Customers
SET last_name = N'Johnson-Doe'
WHERE customer_id = 14;
GO

DELETE FROM  dbo.Orders
WHERE  order_id = 9

DELETE FROM  dbo.Orders
WHERE  order_id = 7

DELETE FROM  dbo.Orders
WHERE  order_id = 8

--13.05.2022

INSERT INTO [Payments] (payment_id, order_id, payment_date, payment_method)
VALUES (5, 5, (SELECT order_date FROM [Orders] WHERE order_id = 5), 'cash'),
       (6, 6, (SELECT order_date FROM [Orders] WHERE order_id = 6), 'card');

UPDATE Customers
SET last_name = N'Smith-Doe'
WHERE customer_id = 17;
GO

UPDATE Customers
SET last_name = N'Smith'
WHERE customer_id = 18;
GO

UPDATE Customers
SET last_name = N'Brown-Smith'
WHERE customer_id = 19;
GO

UPDATE Customers
SET last_name = N'Smith-Doe'
WHERE customer_id = 20;
GO

UPDATE Customers
SET last_name = N'Doe'
WHERE customer_id = 21;
GO

DELETE FROM  dbo.Regular_Customers
WHERE  regular_id = 4

DELETE FROM  dbo.Regular_Customers
WHERE  regular_id = 5

DELETE FROM  dbo.Regular_Customers
WHERE  regular_id = 6

--15.06.2022

INSERT INTO [Regular_Customers] (regular_id, customer_id, join_date)
VALUES (1, 1, '2021-01-01'),
       (2, 6, '2021-01-01'),
       (3, 4, '2021-01-01'),
       (4, 12, '2021-01-01'),
       (5, 7, '2021-01-01'),
       (6, 9, '2021-01-01');

UPDATE Customers
SET last_name = N'Bandit-Doe'
WHERE customer_id = 22;
GO

UPDATE Customers
SET last_name = N'Smith-Garcia'
WHERE customer_id = 23;
GO

UPDATE Customers
SET last_name = N'Brown-Anderson'
WHERE customer_id = 24;
GO

UPDATE Customers
SET last_name = N'Smith-Perez'
WHERE customer_id = 25;
GO

UPDATE Customers
SET last_name = N'Lee-Doe'
WHERE customer_id = 26;
GO

DELETE FROM Product_Categories
WHERE category_id = (SELECT category_id FROM Categories WHERE name =  'Bakery')

DELETE FROM Categories WHERE name = 'Bakery'
DELETE FROM Product_Categories
WHERE category_id = (SELECT category_id FROM Categories WHERE name =  'Beverages')

DELETE FROM Categories WHERE name = 'Beverages'

--15.07.2022

INSERT INTO [Customers] (customer_id, first_name, last_name, gender, email, phone_number, address_line_1, address_line_2, city, state, postal_code, country)
VALUES (39, 'John3', 'Doe', 'Male', 'john3.doe@gmail.com', '535-1227', '123 Main St', 'Apt 2B', 'Los Angeles', 'NY', '10001', 'USA'),
       (40, 'Jane3', 'Doe', 'Female', 'jane3.doe@mail.ru', '53-5633', '456 Elm St', NULL, 'San Francisco', 'CA', '90001', 'USA'),
       (41, 'Bob3', 'Smith', 'Male', 'bob3.smith@gmail.com', '554-2468', '789 Oak St', NULL, 'New York', 'CA', '94101', 'USA'),
	   (42, 'Alice3', 'Johnson', 'Female', 'alice3.johnson@gmail.com', '555-3691', '321 Pine St', NULL, 'Chicago', 'IL', '60601', 'USA'),
       (43, 'Tom3', 'Brown', 'Male', 'tom3.brown@mail.ru', '162-74-73', '55 Lenina St', NULL, 'Homel', 'HR', '331051', 'Belarus');

UPDATE Order_Items
SET quantity = 400
WHERE order_item_id = 1;
GO

UPDATE Order_Items
SET quantity = 16
WHERE order_item_id = 2;
GO

UPDATE Order_Items
SET quantity = 10
WHERE order_item_id = 3;
GO

UPDATE Order_Items
SET quantity = 30
WHERE order_item_id = 4;
GO

UPDATE Order_Items
SET quantity = 40
WHERE order_item_id = 5;
GO

DELETE FROM  dbo.Customers
WHERE  customer_id = 39

DELETE FROM  dbo.Customers
WHERE  customer_id = 38

DELETE FROM  dbo.Customers
WHERE  customer_id = 37

--15.08.2022

INSERT INTO [Regular_Customers] (regular_id, customer_id, join_date)
VALUES (7, 14, '2021-01-01'),
       (8, 15, '2021-01-01'),
       (9, 16, '2021-01-01'),
       (10, 17, '2021-01-01'),
       (11, 18, '2021-01-01'),
       (12, 19, '2021-01-01');

UPDATE Order_Items
SET quantity = 17
WHERE order_item_id = 6;
GO

UPDATE Order_Items
SET quantity = 25
WHERE order_item_id = 7;
GO

UPDATE Order_Items
SET quantity = 30
WHERE order_item_id = 8;
GO

UPDATE Order_Items
SET quantity = 20
WHERE order_item_id = 9;
GO

UPDATE Order_Items
SET quantity = 15
WHERE order_item_id = 10;
GO

DELETE FROM  dbo.Customers
WHERE  customer_id = 40

DELETE FROM  dbo.Customers
WHERE  customer_id = 41

DELETE FROM  dbo.Customers
WHERE  customer_id = 42

DELETE FROM  dbo.Customers
WHERE  customer_id = 43

--20.09.2022

INSERT INTO [Orders] (order_id, customer_id, order_date, regular_customer_discount)
VALUES (7, 16, '2022-09-05', (SELECT CASE WHEN EXISTS(SELECT 1 FROM [Regular_Customers] WHERE customer_id = 16) THEN 2 ELSE 0 END)),
	   (8, 17, '2022-09-05', (SELECT CASE WHEN EXISTS(SELECT 1 FROM [Regular_Customers] WHERE customer_id = 17) THEN 2 ELSE 0 END)),
	   (9, 18, '2022-09-05', (SELECT CASE WHEN EXISTS(SELECT 1 FROM [Regular_Customers] WHERE customer_id = 18) THEN 2 ELSE 0 END)),
	   (10, 19, '2022-09-05', (SELECT CASE WHEN EXISTS(SELECT 1 FROM [Regular_Customers] WHERE customer_id = 19) THEN 2 ELSE 0 END)),
	   (11, 20, '2022-09-05', (SELECT CASE WHEN EXISTS(SELECT 1 FROM [Regular_Customers] WHERE customer_id = 20) THEN 2 ELSE 0 END));

UPDATE Products
SET price = 3.70
WHERE product_id = 6;
GO

UPDATE Products
SET price = 1.32
WHERE product_id = 7;
GO

UPDATE Products
SET price = 5.50
WHERE product_id = 8;
GO

UPDATE Products
SET price = 1.04
WHERE product_id = 9;
GO

UPDATE Products
SET price = 3.70
WHERE product_id = 10;
GO

DELETE FROM  dbo.Customers
WHERE  customer_id = 35

DELETE FROM  dbo.Customers
WHERE  customer_id = 34

DELETE FROM  dbo.Customers
WHERE  customer_id = 33

--20.10.2022

INSERT INTO [Products] (product_id, name, price, unit_of_measurement_id)
VALUES (26, 'Apple2', 0.45, 1),
	   (27, 'Banana2', 0.65, 2),
	   (28, 'Carrot2', 3.00, 3),
	   (29, 'Milk2', 2.40, 4),
	   (30, 'Bread2', 3.50, 1);

UPDATE Payments
SET payment_method = 'card'
WHERE payment_method = 'cash';
GO
UPDATE Payments
SET payment_method = 'cash'
WHERE payment_method = 'card';
GO

DELETE FROM  dbo.Regular_Customers
WHERE  regular_id = 12

DELETE FROM  dbo.Regular_Customers
WHERE  regular_id = 11

DELETE FROM  dbo.Regular_Customers
WHERE  regular_id = 10

--01.11.2022

INSERT INTO [Customers] (customer_id, first_name, last_name, gender, email, phone_number, address_line_1, address_line_2, city, state, postal_code, country)
VALUES (33, 'Mike', 'Doe', 'Male', 'mike.doe@gmail.com', '535-1227', '123 Main St', 'Apt 2B', 'Los Angeles', 'NY', '10001', 'USA'),
       (34, 'Bob', 'Doe', 'Female', 'boby.doe@mail.ru', '53-5633', '456 Elm St', NULL, 'San Francisco', 'CA', '90001', 'USA'),
       (37, 'Tom', 'Smith', 'Male', 'tommy.smith@gmail.com', '554-2468', '789 Oak St', NULL, 'New York', 'CA', '94101', 'USA'),
	   (35, 'Sam', 'Johnson', 'Female', 'sammy.johnson@gmail.com', '555-3691', '321 Pine St', NULL, 'Chicago', 'IL', '60601', 'USA'),
       (38, 'Timi', 'Brown', 'Male', 'timii.brown@mail.ru', '162-74-73', '55 Lenina St', NULL, 'Homel', 'HR', '331051', 'Belarus');

UPDATE Customers
SET last_name = N'Smith-Doe'
WHERE customer_id = 15;
GO

UPDATE Customers
SET last_name = N'Brown-Smith'
WHERE customer_id = 17;
GO

UPDATE Customers
SET last_name = N'Doe-Wilson'
WHERE customer_id = 21;
GO

UPDATE Customers
SET last_name = N'Smith-Doe'
WHERE customer_id = 31;
GO

UPDATE Customers
SET last_name = N'Johnson-Doe'
WHERE customer_id = 19;
GO

DELETE FROM  dbo.Products
WHERE  product_id = 30

DELETE FROM  dbo.Products
WHERE  product_id = 29

DELETE FROM  dbo.Products
WHERE  product_id = 28

DELETE FROM  dbo.Products
WHERE  product_id = 27

DELETE FROM  dbo.Products
WHERE  product_id = 26

--01.12.2022

INSERT INTO [Orders] (order_id, customer_id, order_date, regular_customer_discount)
VALUES (12, 21, '2022-12-05', (SELECT CASE WHEN EXISTS(SELECT 1 FROM [Regular_Customers] WHERE customer_id = 21) THEN 2 ELSE 0 END)),
	   (13, 22, '2022-12-05', (SELECT CASE WHEN EXISTS(SELECT 1 FROM [Regular_Customers] WHERE customer_id = 22) THEN 2 ELSE 0 END)),
	   (14, 23, '2022-12-05', (SELECT CASE WHEN EXISTS(SELECT 1 FROM [Regular_Customers] WHERE customer_id = 23) THEN 2 ELSE 0 END)),
	   (15, 24, '2022-12-05', (SELECT CASE WHEN EXISTS(SELECT 1 FROM [Regular_Customers] WHERE customer_id = 24) THEN 2 ELSE 0 END)),
	   (16, 25, '2022-12-05', (SELECT CASE WHEN EXISTS(SELECT 1 FROM [Regular_Customers] WHERE customer_id = 25) THEN 2 ELSE 0 END));

UPDATE Payments
SET payment_method = 'card'
WHERE payment_method = 'cash';
GO

DELETE FROM  dbo.Products
WHERE  product_id = 21

DELETE FROM  dbo.Products
WHERE  product_id = 22

DELETE FROM  dbo.Products
WHERE  product_id = 23

DELETE FROM  dbo.Products
WHERE  product_id = 24

DELETE FROM  dbo.Products
WHERE  product_id = 25