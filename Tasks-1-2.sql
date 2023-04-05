USE master;
GO
DROP DATABASE IF EXISTS Online_Store;
GO
CREATE DATABASE Online_Store;
GO
USE Online_Store;
GO


CREATE TABLE dbo.Customers (
	customer_id int NOT NULL,
	first_name varchar(255) NOT NULL,
	last_name varchar(255) NOT NULL,
	gender varchar(255),
	email varchar(255) NOT NULL UNIQUE,
	phone_number varchar(20),
	address_line_1 varchar(255),
	address_line_2 varchar(255),
	city varchar(100) NOT NULL,
	state varchar(100) NOT NULL,
	postal_code varchar(20) NOT NULL,
	country varchar(100) NOT NULL,
	startDate DATETIME2 GENERATED ALWAYS AS ROW START HIDDEN NOT NULL,
	endDate DATETIME2 GENERATED ALWAYS AS ROW END HIDDEN NOT NULL,
	PERIOD FOR SYSTEM_TIME (startDate, endDate),
  CONSTRAINT [PK_CUSTOMERS] PRIMARY KEY CLUSTERED
  (
  [customer_id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)
)
WITH(SYSTEM_VERSIONING = ON (HISTORY_TABLE = dbo.Customers_History));
GO

CREATE TABLE dbo.Products (
	product_id int NOT NULL UNIQUE,
	name varchar(255) NOT NULL,
	price decimal(10,2) NOT NULL CHECK (price > 0),
	unit_of_measurement_id int NOT NULL,
	startDate DATETIME2 GENERATED ALWAYS AS ROW START HIDDEN NOT NULL,
	endDate DATETIME2 GENERATED ALWAYS AS ROW END HIDDEN NOT NULL,
	PERIOD FOR SYSTEM_TIME (startDate, endDate),
  CONSTRAINT [PK_PRODUCTS] PRIMARY KEY CLUSTERED
  (
  [product_id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
WITH(SYSTEM_VERSIONING = ON (HISTORY_TABLE = dbo.Products_History));
GO


CREATE TABLE dbo.Regular_Customers (
	regular_id int NOT NULL UNIQUE,
	customer_id int NOT NULL,
	join_date datetime NOT NULL,
	startDate DATETIME2 GENERATED ALWAYS AS ROW START HIDDEN NOT NULL,
	endDate DATETIME2 GENERATED ALWAYS AS ROW END HIDDEN NOT NULL,
	PERIOD FOR SYSTEM_TIME (startDate, endDate),
  CONSTRAINT [PK_REGULAR_CUSTOMERS] PRIMARY KEY CLUSTERED
  (
  [regular_id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
WITH(SYSTEM_VERSIONING = ON (HISTORY_TABLE = dbo.Regular_Customers_History));
GO

CREATE TABLE dbo.Payments (
	payment_id int NOT NULL UNIQUE,
	order_id int NOT NULL,
	payment_date datetime NOT NULL,
	payment_method varchar(255) CHECK (payment_method IN ('cash', 'card', 'coupon')) NOT NULL DEFAULT 'cash',
	startDate DATETIME2 GENERATED ALWAYS AS ROW START HIDDEN NOT NULL,
	endDate DATETIME2 GENERATED ALWAYS AS ROW END HIDDEN NOT NULL,
	PERIOD FOR SYSTEM_TIME (startDate, endDate),
  CONSTRAINT [PK_PAYMENTS] PRIMARY KEY CLUSTERED
  (
  [payment_id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)
)
WITH(SYSTEM_VERSIONING = ON (HISTORY_TABLE = dbo.Payments_History));
GO

CREATE TABLE dbo.Categories (
	category_id int NOT NULL UNIQUE,
	name varchar(100) NOT NULL UNIQUE,
	startDate DATETIME2 GENERATED ALWAYS AS ROW START HIDDEN NOT NULL,
	endDate DATETIME2 GENERATED ALWAYS AS ROW END HIDDEN NOT NULL,
	PERIOD FOR SYSTEM_TIME (startDate, endDate),
  CONSTRAINT [PK_CATEGORIES] PRIMARY KEY CLUSTERED
  (
  [category_id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)
)
WITH(SYSTEM_VERSIONING = ON (HISTORY_TABLE = dbo.Categories_History));
GO

CREATE TABLE dbo.Product_Categories (
	product_id int NOT NULL,
	category_id int NOT NULL,
)
GO

CREATE TABLE dbo.Orders (
	order_id int NOT NULL UNIQUE,
	customer_id int NOT NULL,
	order_date datetime NOT NULL,
	regular_customer_discount INT CHECK (regular_customer_discount IN (0,2)) NOT NULL DEFAULT 0,
	startDate DATETIME2 GENERATED ALWAYS AS ROW START HIDDEN NOT NULL,
	endDate DATETIME2 GENERATED ALWAYS AS ROW END HIDDEN NOT NULL,
	PERIOD FOR SYSTEM_TIME (startDate, endDate),
  CONSTRAINT [PK_ORDERS] PRIMARY KEY CLUSTERED
  (
  [order_id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)
)
WITH(SYSTEM_VERSIONING = ON (HISTORY_TABLE = dbo.Orders_History));
GO

CREATE TABLE dbo.Order_Items (
	order_item_id int NOT NULL UNIQUE,
	order_id int NOT NULL,
	product_id int NOT NULL,
	quantity int NOT NULL,
	price decimal(10,2) NOT NULL CHECK (price > 0),
	startDate DATETIME2 GENERATED ALWAYS AS ROW START HIDDEN NOT NULL,
	endDate DATETIME2 GENERATED ALWAYS AS ROW END HIDDEN NOT NULL,
	PERIOD FOR SYSTEM_TIME (startDate, endDate),
  CONSTRAINT [PK_ORDER_ITEMS] PRIMARY KEY CLUSTERED
  (
  [order_item_id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)
)
WITH(SYSTEM_VERSIONING = ON (HISTORY_TABLE = dbo.Order_Items_History));
GO

CREATE TABLE dbo.Units_of_Measurement (
	unit_of_measurement_id int NOT NULL UNIQUE,
	name varchar(50) NOT NULL UNIQUE,
	startDate DATETIME2 GENERATED ALWAYS AS ROW START HIDDEN NOT NULL,
	endDate DATETIME2 GENERATED ALWAYS AS ROW END HIDDEN NOT NULL,
	PERIOD FOR SYSTEM_TIME (startDate, endDate),
  CONSTRAINT [PK_UNITS_OF_MEASUREMENT] PRIMARY KEY CLUSTERED
  (
  [unit_of_measurement_id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)
)
WITH(SYSTEM_VERSIONING = ON (HISTORY_TABLE = dbo.Units_of_Measurement_History));
GO

CREATE TABLE dbo.Sales (
	sale_id int NOT NULL UNIQUE,
	customer_id int NOT NULL,
	product_id int NOT NULL,
	quantity int NOT NULL,
	sale_date date NOT NULL,
	delivery_date date NOT NULL,
	startDate DATETIME2 GENERATED ALWAYS AS ROW START HIDDEN NOT NULL,
	endDate DATETIME2 GENERATED ALWAYS AS ROW END HIDDEN NOT NULL,
	PERIOD FOR SYSTEM_TIME (startDate, endDate),
  CONSTRAINT [PK_SALES] PRIMARY KEY CLUSTERED
  (
  [sale_id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)
)
WITH(SYSTEM_VERSIONING = ON (HISTORY_TABLE = dbo.Sales_History));
GO

ALTER TABLE [Products] WITH CHECK ADD CONSTRAINT [Products_fk0] FOREIGN KEY ([unit_of_measurement_id]) REFERENCES [Units_of_Measurement]([unit_of_measurement_id])
ON UPDATE CASCADE
GO
ALTER TABLE [Products] CHECK CONSTRAINT [Products_fk0]
GO

ALTER TABLE [Regular_Customers] WITH CHECK ADD CONSTRAINT [Regular_Customers_fk0] FOREIGN KEY ([customer_id]) REFERENCES [Customers]([customer_id])
ON UPDATE CASCADE
GO
ALTER TABLE [Regular_Customers] CHECK CONSTRAINT [Regular_Customers_fk0]
GO

ALTER TABLE [Payments] WITH CHECK ADD CONSTRAINT [Payments_fk0] FOREIGN KEY ([order_id]) REFERENCES [Orders]([order_id])
ON UPDATE CASCADE
GO
ALTER TABLE [Payments] CHECK CONSTRAINT [Payments_fk0]
GO


ALTER TABLE [Product_Categories] WITH CHECK ADD CONSTRAINT [Product_Categories_fk0] FOREIGN KEY ([product_id]) REFERENCES [Products]([product_id])
ON UPDATE CASCADE
GO
ALTER TABLE [Product_Categories] CHECK CONSTRAINT [Product_Categories_fk0]
GO
ALTER TABLE [Product_Categories] WITH CHECK ADD CONSTRAINT [Product_Categories_fk1] FOREIGN KEY ([category_id]) REFERENCES [Categories]([category_id])
ON UPDATE CASCADE
GO
ALTER TABLE [Product_Categories] CHECK CONSTRAINT [Product_Categories_fk1]
GO

ALTER TABLE [Orders] WITH CHECK ADD CONSTRAINT [Orders_fk0] FOREIGN KEY ([customer_id]) REFERENCES [Customers]([customer_id])
ON UPDATE CASCADE
GO
ALTER TABLE [Orders] CHECK CONSTRAINT [Orders_fk0]
GO

ALTER TABLE [Order_Items] WITH CHECK ADD CONSTRAINT [Order_Items_fk0] FOREIGN KEY ([order_id]) REFERENCES [Orders]([order_id])
ON UPDATE CASCADE
GO
ALTER TABLE [Order_Items] CHECK CONSTRAINT [Order_Items_fk0]
GO
ALTER TABLE [Order_Items] WITH CHECK ADD CONSTRAINT [Order_Items_fk1] FOREIGN KEY ([product_id]) REFERENCES [Products]([product_id])
ON UPDATE CASCADE
GO
ALTER TABLE [Order_Items] CHECK CONSTRAINT [Order_Items_fk1]
GO


ALTER TABLE [Sales] WITH CHECK ADD CONSTRAINT [Sales_fk0] FOREIGN KEY ([customer_id]) REFERENCES [Customers]([customer_id])
ON UPDATE CASCADE
GO
ALTER TABLE [Sales] CHECK CONSTRAINT [Sales_fk0]
GO
ALTER TABLE [Sales] WITH CHECK ADD CONSTRAINT [Sales_fk1] FOREIGN KEY ([product_id]) REFERENCES [Products]([product_id])
ON UPDATE CASCADE
GO
ALTER TABLE [Sales] CHECK CONSTRAINT [Sales_fk1]
GO




-- Filling tables, 01.01.2022

INSERT INTO [Customers] (customer_id, first_name, last_name, gender, email, phone_number, address_line_1, address_line_2, city, state, postal_code, country)
VALUES (1, 'John', 'Doe', 'Male', 'john.doe@gmail.com', '555-1234', '123 Main St', 'Apt 2B', 'New York', 'NY', '10001', 'USA'),
       (2, 'Jane', 'Doe', 'Female', 'jane.doe@mail.ru', '555-5678', '456 Elm St', NULL, 'Los Angeles', 'CA', '90001', 'USA'),
       (3, 'Bob', 'Smith', 'Male', 'bob.smith@gmail.com', '555-2468', '789 Oak St', NULL, 'San Francisco', 'CA', '94101', 'USA'),
       (4, 'Alice', 'Johnson', 'Female', 'alice.johnson@gmail.com', '555-3691', '321 Pine St', NULL, 'Chicago', 'IL', '60601', 'USA'),
       (5, 'Tom', 'Brown', 'Male', 'tom.brown@mail.ru', '162-74-73', '55 Lenina St', NULL, 'Homel', 'HR', '331051', 'Belarus'),
	   (6, 'Valery', 'Brown', 'Chair', 'valery.brown@mail.ru', '771-81-75', '55 Lenina St', NULL, 'Homel', 'HR', '331051', 'Belarus'),
       (7, 'Borya', 'Bandit', 'Female', 'borya2007.bn@gmail.com', '583-3213', '89 National St', NULL, 'Gdynia', 'GV', '781031', 'Poland'),
       (8, 'John', 'Rogus', 'Male', 'john.rod@gmail.com', '545-1898', '789 Valenca St', NULL, 'San Francisco', 'CA', '42323', 'USA'),
	   (9, 'David', 'Johnson', 'Male', 'david.johnson@yahoo.com', '555-9876', '789 Oak St', NULL, 'San Francisco', 'CA', '94102', 'USA'),
	   (10, 'Sarah', 'Garcia', 'Female', 'sarah.garcia@hotmail.com', '555-4321', '1010 Pine St', 'Unit 5D', 'Seattle', 'WA', '98101', 'USA'),
	   (11, 'Michael', 'Brown', 'Male', 'michael.brown@gmail.com', '555-5555', '555 Elm St', NULL, 'Boston', 'MA', '02110', 'USA'),
	   (12, 'Emily', 'Davis', 'Female', 'emily.davis@gmail.com', '555-6789', '222 Maple St', 'Apt 10', 'Los Angeles', 'CA', '90001', 'USA'),
	   (13, 'William', 'Wilson', 'Male', 'william.wilson@yahoo.com', '555-2468', '333 Oak St', NULL, 'Atlanta', 'GA', '30303', 'USA'),
	   (14, 'Elizabeth', 'Anderson', 'Female', 'elizabeth.anderson@hotmail.com', '555-3698', '444 Park Ave', 'Suite 2B', 'Houston', 'TX', '77002', 'USA'),
	   (15, 'James', 'Jackson', 'Male', 'james.jackson@gmail.com', '555-7539', '555 Main St', NULL, 'Philadelphia', 'PA', '19102', 'USA'),
	   (16, 'Emma', 'Lee', 'Female', 'emma.lee@gmail.com', '555-8642', '666 Maple St', 'Apt 12', 'Dallas', 'TX', '75201', 'USA'),
	   (17, 'Christopher', 'Perez', 'Male', 'christopher.perez@yahoo.com', '555-3210', '777 Oak St', NULL, 'Miami', 'FL', '33101', 'USA'),
	   (18, 'Ava', 'Taylor', 'Female', 'ava.taylor@gmail.com', '555-9876', '888 Pine St', 'Unit 3C', 'Phoenix', 'AZ', '85001', 'USA'),
	   (19, 'Daniel', 'Thomas-More', 'Male', 'daniel.thomasM@hotmail.com', '555-5555', '999 Elm St', NULL, 'Denver', 'CO', '80202', 'USA'),
	   (20, 'Sophia', 'Moore', 'Female', 'sophia.moore@gmail.com', '555-6789', '111 Maple St', 'Apt 7', 'Portland', 'OR', '97201', 'USA'),
	   (21, 'Daniel', 'Thomas', 'Male', 'daniel.thomas@hotmail.com', '555-5555', '999 Elm St', NULL, 'Denver', 'CO', '80202', 'USA'),
	   (22, 'Sophia', 'Moon', 'Female', 'sophia.moon@gmail.com', '555-6789', '111 Maple St', 'Apt 7', 'Portland', 'OR', '97201', 'USA'),
	   (23, 'Benjamin', 'Martin', 'Male', 'benjamin.martin@yahoo.com', '555-2468', '222 Oak St', NULL, 'New Orleans', 'LA', '70112', 'USA'),
	   (24, 'Isabella', 'Hernandez', 'Female', 'isabella.hernandez@gmail.com', '555-3698', '333 Park Ave', 'Suite 10A', 'San Diego', 'CA', '92101', 'USA'),
	   (25, 'Mason', 'Lopez', 'Male', 'mason.lopez@hotmail.com', '555-7539', '444 Elm St', NULL, 'Las Vegas', 'NV', '89101', 'USA'),
	   (26, 'Mia', 'Gonzalez', 'Female', 'mia.gonzalez@gmail.com', '555-8642', '555 Maple St', 'Apt 9', 'Austin', 'TX', '78701', 'USA'),
	   (27, 'Ethan', 'Rodriguez', 'Male', 'ethan.rodriguez@yahoo.com', '555-3210', '666 Oak St', NULL, 'Charlotte', 'NC', '28202', 'USA'),
	   (28, 'Chloe', 'Parker', 'Female', 'chloe.parker@hotmail.com', '555-9876', '777 Pine St', 'Unit 4D', 'Nashville', 'TN', '37201', 'USA');


INSERT INTO [Units_of_Measurement] (unit_of_measurement_id, name) 
VALUES (1, 'Each'),
	   (2, 'Pound'),
	   (3, 'Ounce'),
	   (4, 'Gallon'),
	   (5, 'Quart'),
	   (6, 'Liter'),
	   (7, 'Dozen');

INSERT INTO [Categories] (category_id, name) 
VALUES (1, 'Fruit'),
	   (2, 'Vegetables'),
	   (3, 'Meat'),
	   (4, 'Dairy'),
	   (5, 'Bakery'),
	   (6, 'Snacks'),
	   (7, 'Beverages'),
	   (8, 'Frozen Foods'),
	   (9, 'Canned Goods'),
	   (10, 'Seafood'),
	   (11, 'Pasta'),
	   (12, 'Condiments'),
	   (13, 'Candy'),
	   (14, 'Nuts'),
	   (15, 'Produce'),
	   (16, 'Spices');

INSERT INTO [Products] (product_id, name, price, unit_of_measurement_id)
VALUES (1, 'Apple', 0.50, 1),
	   (2, 'Banana', 0.25, 1),
	   (3, 'Carrot', 1.00, 2),
	   (4, 'Milk', 2.50, 4),
	   (5, 'Bread', 1.50, 1),
	   (6, 'Chips', 3.00, 1),
	   (7, 'Soda', 1.00, 6),
	   (8, 'Potato', 5.00, 2),
	   (9, 'Yogurt', 1.20, 3),
	   (10, 'Cookie', 9.00, 7),
	   (11, 'Frozen Pizza', 4.99, 7),
	   (12, 'Canned Tuna', 1.75, 2),
	   (13, 'Salmon Fillet', 10.99, 7),
	   (14, 'Spaghetti', 2.49, 5),
	   (15, 'Ketchup', 1.29, 3),
	   (16, 'Bagels', 3.50, 1),
	   (17, 'Almonds', 6.99, 4),
	   (18, 'Oranges', 0.75, 1),
	   (19, 'Steak', 12.99, 2),
	   (20, 'Water', 0.50, 6);

INSERT INTO [Product_Categories] (product_id, category_id)
VALUES (1, 1),
	   (2, 1),
	   (3, 2),
	   (4, 4),
	   (5, 5),
	   (6, 6),
	   (7, 7),
	   (8, 2),
	   (9, 4),
	   (10, 5),
	   (11, 10),
	   (12, 16),
	   (13, 4),
	   (14, 11),
	   (15, 2),
	   (16, 5),
	   (17, 13),
	   (18, 1),
	   (19, 3),
	   (20, 14);

INSERT INTO [Regular_Customers] (regular_id, customer_id, join_date)
VALUES (1, 1, '2021-01-01'),
       (2, 6, '2021-01-01'),
       (3, 4, '2021-01-01'),
       (4, 12, '2021-01-01'),
       (5, 7, '2021-01-01'),
       (6, 9, '2021-01-01');

INSERT INTO [Orders] (order_id, customer_id, order_date, regular_customer_discount)
VALUES (1, 1, '2022-01-01', (SELECT CASE WHEN EXISTS(SELECT 1 FROM [Regular_Customers] WHERE customer_id = 1) THEN 2 ELSE 0 END)),
	   (2, 6, '2023-02-01', (SELECT CASE WHEN EXISTS(SELECT 1 FROM [Regular_Customers] WHERE customer_id = 6) THEN 2 ELSE 0 END)),
	   (3, 3, '2022-03-01', (SELECT CASE WHEN EXISTS(SELECT 1 FROM [Regular_Customers] WHERE customer_id = 3) THEN 2 ELSE 0 END)),
	   (4, 4, '2022-04-01', (SELECT CASE WHEN EXISTS(SELECT 1 FROM [Regular_Customers] WHERE customer_id = 4) THEN 2 ELSE 0 END));

INSERT INTO [Order_Items] (order_item_id, order_id, product_id, quantity, price)
VALUES (1, 2, 1, 500, (SELECT price FROM [Products] WHERE product_id = 1) * 500),
       (2, 1, 7, 6, (SELECT price FROM [Products] WHERE product_id = 7) * 6),
       (3, 1, 3, 1, (SELECT price FROM [Products] WHERE product_id = 3) * 1),
       (4, 1, 4, 5, (SELECT price FROM [Products] WHERE product_id = 4) * 5),
       (5, 3, 1, 1, (SELECT price FROM [Products] WHERE product_id = 1) * 1),
       (6, 3, 2, 8, (SELECT price FROM [Products] WHERE product_id = 2) * 8),
       (7, 4, 6, 3, (SELECT price FROM [Products] WHERE product_id = 6) * 3),
       (8, 4, 5, 10, (SELECT price FROM [Products] WHERE product_id = 5) * 10),
       (9, 4, 9, 56, (SELECT price FROM [Products] WHERE product_id = 9) * 56);

INSERT INTO [Payments] (payment_id, order_id, payment_date, payment_method)
VALUES (1, 1, (SELECT order_date FROM [Orders] WHERE order_id = 1), 'cash'),
       (2, 2, (SELECT order_date FROM [Orders] WHERE order_id = 2), 'card'),
       (3, 3, (SELECT order_date FROM [Orders] WHERE order_id = 3), 'coupon'),
       (4, 4, (SELECT order_date FROM [Orders] WHERE order_id = 4), 'cash');

INSERT INTO [Sales] (sale_id, customer_id, product_id, quantity, sale_date, delivery_date)
VALUES (1, 6, 1, 500, (SELECT order_date FROM [Orders] WHERE customer_id = 6), '2023-02-01'),
       (2, 1, 7, 6, (SELECT order_date FROM [Orders] WHERE customer_id = 1), '2022-01-02'),
       (3, 1, 3, 1, (SELECT order_date FROM [Orders] WHERE customer_id = 1), '2022-01-02'),
       (4, 1, 4, 5, (SELECT order_date FROM [Orders] WHERE customer_id = 1), '2022-01-02'),
       (5, 3, 1, 1, (SELECT order_date FROM [Orders] WHERE customer_id = 3), '2022-03-06'),
       (6, 3, 2, 8, (SELECT order_date FROM [Orders] WHERE customer_id = 3), '2022-03-06'),
       (7, 4, 6, 3, (SELECT order_date FROM [Orders] WHERE customer_id = 4), '2022-04-01'),
       (8, 4, 5, 10, (SELECT order_date FROM [Orders] WHERE customer_id = 4), '2022-04-01'),
       (9, 4, 9, 56, (SELECT order_date FROM [Orders] WHERE customer_id = 4), '2022-04-01');