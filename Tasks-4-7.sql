
USE Online_Store;
GO

-- 4

-- Q1

SELECT '1 квартал' as [Quarter], *, startDate, endDate
FROM Customers
FOR SYSTEM_TIME AS OF '2022-03-31 23:59:59.9999999'

SELECT '1 квартал' as [Quarter], *, startDate, endDate
FROM dbo.Products
FOR SYSTEM_TIME AS OF '2022-03-31 23:59:59.9999999'

SELECT '1 квартал' as [Quarter], *, startDate, endDate
FROM dbo.Regular_Customers
FOR SYSTEM_TIME AS OF '2022-03-31 23:59:59.9999999'

SELECT '1 квартал' as [Quarter], *, startDate, endDate
FROM dbo.Payments
FOR SYSTEM_TIME AS OF '2022-03-31 23:59:59.9999999'

SELECT '1 квартал' as [Quarter], *, startDate, endDate
FROM dbo.Categories
FOR SYSTEM_TIME AS OF '2022-03-31 23:59:59.9999999'

SELECT '1 квартал' as [Quarter], *, startDate, endDate
FROM dbo.Orders
FOR SYSTEM_TIME AS OF '2022-03-31 23:59:59.9999999'


SELECT '1 квартал' as [Quarter], *, startDate, endDate
FROM dbo.Order_Items
FOR SYSTEM_TIME AS OF '2022-03-31 23:59:59.9999999'


SELECT '1 квартал' as [Quarter], *, startDate, endDate
FROM dbo.Units_of_Measurement
FOR SYSTEM_TIME AS OF '2022-03-31 23:59:59.9999999'


SELECT '1 квартал' as [Quarter], *, startDate, endDate
FROM dbo.Sales
FOR SYSTEM_TIME AS OF '2022-03-31 23:59:59.9999999'

-- Q2

SELECT '2 квартал' as [Quarter], *, startDate, endDate
FROM Customers
FOR SYSTEM_TIME AS OF '2022-06-30 23:59:59.9999999'

SELECT '2 квартал' as [Quarter], *, startDate, endDate
FROM dbo.Products
FOR SYSTEM_TIME AS OF '2022-06-30 23:59:59.9999999'

SELECT '2 квартал' as [Quarter], *, startDate, endDate
FROM dbo.Regular_Customers
FOR SYSTEM_TIME AS OF '2022-06-30 23:59:59.9999999'

SELECT '2 квартал' as [Quarter], *, startDate, endDate
FROM dbo.Payments
FOR SYSTEM_TIME AS OF '2022-06-30 23:59:59.9999999'

SELECT '2 квартал' as [Quarter], *, startDate, endDate
FROM dbo.Categories
FOR SYSTEM_TIME AS OF '2022-06-30 23:59:59.9999999'

SELECT '2 квартал' as [Quarter], *, startDate, endDate
FROM dbo.Orders
FOR SYSTEM_TIME AS OF '2022-06-30 23:59:59.9999999'


SELECT '2 квартал' as [Quarter], *, startDate, endDate
FROM dbo.Order_Items
FOR SYSTEM_TIME AS OF '2022-06-30 23:59:59.9999999'


SELECT '2 квартал' as [Quarter], *, startDate, endDate
FROM dbo.Units_of_Measurement
FOR SYSTEM_TIME AS OF '2022-06-30 23:59:59.9999999'


SELECT '2 квартал' as [Quarter], *, startDate, endDate
FROM dbo.Sales
FOR SYSTEM_TIME AS OF '2022-06-30 23:59:59.9999999'

-- Q3

SELECT '3 квартал' as [Quarter], *, startDate, endDate
FROM Customers
FOR SYSTEM_TIME AS OF '2022-09-30 23:59:59.9999999'

SELECT '3 квартал' as [Quarter], *, startDate, endDate
FROM dbo.Products
FOR SYSTEM_TIME AS OF '2022-09-30 23:59:59.9999999'

SELECT '3 квартал' as [Quarter], *, startDate, endDate
FROM dbo.Regular_Customers
FOR SYSTEM_TIME AS OF '2022-09-30 23:59:59.9999999'

SELECT '3 квартал' as [Quarter], *, startDate, endDate
FROM dbo.Payments
FOR SYSTEM_TIME AS OF '2022-09-30 23:59:59.9999999'

SELECT '3 квартал' as [Quarter], *, startDate, endDate
FROM dbo.Categories
FOR SYSTEM_TIME AS OF '2022-09-30 23:59:59.9999999'

SELECT '3 квартал' as [Quarter], *, startDate, endDate
FROM dbo.Orders
FOR SYSTEM_TIME AS OF '2022-09-30 23:59:59.9999999'


SELECT '3 квартал' as [Quarter], *, startDate, endDate
FROM dbo.Order_Items
FOR SYSTEM_TIME AS OF '2022-09-30 23:59:59.9999999'


SELECT '3 квартал' as [Quarter], *, startDate, endDate
FROM dbo.Units_of_Measurement
FOR SYSTEM_TIME AS OF '2022-09-30 23:59:59.9999999'


SELECT '3 квартал' as [Quarter], *, startDate, endDate
FROM dbo.Sales
FOR SYSTEM_TIME AS OF '2022-09-30 23:59:59.9999999'


--Q4

SELECT '4 квартал' as [Quarter], *, ValidFrom, ValidTo
FROM Diagnosis
FOR SYSTEM_TIME AS OF '2022-12-31 23:59:59.9999999'

SELECT '4 квартал' as [Quarter], *, startDate, endDate
FROM Customers
FOR SYSTEM_TIME AS OF '2022-12-31 23:59:59.9999999'

SELECT '4 квартал' as [Quarter], *, startDate, endDate
FROM dbo.Products
FOR SYSTEM_TIME AS OF '2022-12-31 23:59:59.9999999'

SELECT '4 квартал' as [Quarter], *, startDate, endDate
FROM dbo.Regular_Customers
FOR SYSTEM_TIME AS OF '2022-12-31 23:59:59.9999999'

SELECT '4 квартал' as [Quarter], *, startDate, endDate
FROM dbo.Payments
FOR SYSTEM_TIME AS OF '2022-12-31 23:59:59.9999999'

SELECT '4 квартал' as [Quarter], *, startDate, endDate
FROM dbo.Categories
FOR SYSTEM_TIME AS OF '2022-12-31 23:59:59.9999999'

SELECT '4 квартал' as [Quarter], *, startDate, endDate
FROM dbo.Orders
FOR SYSTEM_TIME AS OF '2022-12-31 23:59:59.9999999'


SELECT '4 квартал' as [Quarter], *, startDate, endDate
FROM dbo.Order_Items
FOR SYSTEM_TIME AS OF '2022-12-31 23:59:59.9999999'


SELECT '4 квартал' as [Quarter], *, startDate, endDate
FROM dbo.Units_of_Measurement
FOR SYSTEM_TIME AS OF '2022-12-31 23:59:59.9999999'


SELECT '4 квартал' as [Quarter], *, startDate, endDate
FROM dbo.Sales
FOR SYSTEM_TIME AS OF '2022-12-31 23:59:59.9999999'

GO

-- 5

SELECT 'Лето 2022' as [Date], *, startDate, endDate
FROM dbo.Customers
FOR SYSTEM_TIME
BETWEEN '2022-06-01' AND '2022-08-31 23:59:59.9999999'

SELECT 'Лето 2022' as [Date], *, startDate, endDate
FROM dbo.Products
FOR SYSTEM_TIME
BETWEEN '2022-06-01' AND '2022-08-31 23:59:59.9999999'

SELECT 'Лето 2022' as [Date], *, startDate, endDate
FROM dbo.Regular_Customers
FOR SYSTEM_TIME
BETWEEN '2022-06-01' AND '2022-08-31 23:59:59.9999999'

SELECT 'Лето 2022' as [Date], *, startDate, endDate
FROM dbo.Payments
FOR SYSTEM_TIME
BETWEEN '2022-06-01' AND '2022-08-31 23:59:59.9999999'

SELECT 'Лето 2022' as [Date], *, startDate, endDate
FROM dbo.Categories
FOR SYSTEM_TIME
BETWEEN '2022-06-01' AND '2022-08-31 23:59:59.9999999'

SELECT 'Лето 2022' as [Date], *, startDate, endDate
FROM dbo.Orders
FOR SYSTEM_TIME
BETWEEN '2022-06-01' AND '2022-08-31 23:59:59.9999999'

SELECT 'Лето 2022' as [Date], *, startDate, endDate
FROM dbo.Order_Items
FOR SYSTEM_TIME
BETWEEN '2022-06-01' AND '2022-08-31 23:59:59.9999999'

SELECT 'Лето 2022' as [Date], *, startDate, endDate
FROM dbo.Units_of_Measurement
FOR SYSTEM_TIME
BETWEEN '2022-06-01' AND '2022-08-31 23:59:59.9999999'

SELECT 'Лето 2022' as [Date], *, startDate, endDate
FROM dbo.Sales
FOR SYSTEM_TIME
BETWEEN '2022-06-01' AND '2022-08-31 23:59:59.9999999'

-- 6

SELECT 'Inserted and deleted for the third quarter of 2022' as [Date], *, startDate, endDate
FROM dbo.Categories
FOR SYSTEM_TIME CONTAINED IN ('2022-07-01',
'2022-09-30 23:59:59.9999999');

SELECT 'Inserted and deleted for the third quarter of 2022' as [Date], *, startDate, endDate
FROM dbo.Customers
FOR SYSTEM_TIME CONTAINED IN ('2022-07-01',
'2022-09-30 23:59:59.9999999');

SELECT 'Inserted and deleted for the third quarter of 2022' as [Date], *, startDate, endDate
FROM dbo.Order_Items
FOR SYSTEM_TIME CONTAINED IN ('2022-07-01',
'2022-09-30 23:59:59.9999999');

SELECT 'Inserted and deleted for the third quarter of 2022' as [Date], *, startDate, endDate
FROM dbo.Orders
FOR SYSTEM_TIME CONTAINED IN ('2022-07-01',
'2022-09-30 23:59:59.9999999');

SELECT 'Inserted and deleted for the third quarter of 2022' as [Date], *, startDate, endDate
FROM dbo.Payments
FOR SYSTEM_TIME CONTAINED IN ('2022-07-01',
'2022-09-30 23:59:59.9999999');

SELECT 'Inserted and deleted for the third quarter of 2022' as [Date], *, startDate, endDate
FROM dbo.Products
FOR SYSTEM_TIME CONTAINED IN ('2022-07-01',
'2022-09-30 23:59:59.9999999');


SELECT 'Inserted and deleted for the third quarter of 2022' as [Date], *, startDate, endDate
FROM dbo.Regular_Customers
FOR SYSTEM_TIME CONTAINED IN ('2022-07-01',
'2022-09-30 23:59:59.9999999');


SELECT 'Inserted and deleted for the third quarter of 2022' as [Date], *, startDate, endDate
FROM dbo.Sales
FOR SYSTEM_TIME CONTAINED IN ('2022-07-01',
'2022-09-30 23:59:59.9999999');

SELECT 'Inserted and deleted for the third quarter of 2022' as [Date], *, startDate, endDate
FROM dbo.Units_of_Measurement
FOR SYSTEM_TIME CONTAINED IN ('2022-07-01',
'2022-09-30 23:59:59.9999999');

-- 7

SELECT 
	c.customer_id,
	c.first_name,
	c.last_name,
	o.order_date,
	n.name AS product,
	n.price,
	n.quantity
FROM Orders AS o
     INNER JOIN Customers AS c
          ON o.customer_id = c.customer_id
     INNER JOIN (SELECT oi.order_id, oi.price, oi.quantity, p.name 
				 FROM Order_Items AS oi 
				     INNER JOIN Products AS p 
					      ON oi.product_id = p.product_id) AS n
		  ON n.order_id = o.order_id

