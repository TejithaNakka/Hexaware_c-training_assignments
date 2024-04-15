create table Customers( CustomerID int primary key, FirstName varchar(10), LastName varchar(10), Email varchar(20), Phone bigint, Address varchar(20))
Insert into Customers values(101, 'John', 'david', 'david@gmail.com', 9683742987, 'A.p')
Insert into Customers values(102, 'Sai', 'Reddy', 'sai@gmail.com', 9683742978, 'Delhi')
Insert into Customers values(103, 'Devil', 'Raj', 'raj@gmail.com', 9683742999, 'UP')
Insert into Customers values(104, 'Viraj', 'goutham', 'virat@gmail.com', 9683745987, 'KA')
Insert into Customers values(105, 'Sigh', 'Dhoni', 'dhoni@gmail.com', 9683742947, 'TN')
Insert into Customers values(106, 'Ramu', 'Kumar', 'kumar@gmail.com', 9683742237, 'OD')


select *from Customers

create table Products( ProductID int primary key, ProductName varchar(10), Descriptionn varchar(10), Price int)
alter table Products alter column ProductName varchar(222)
alter table Products alter column Descriptionn varchar(222)
Insert into Products values(11, 'Mouse', 'Wireless mouse', 5000)
Insert into Products values(12, 'Joy stick', 'for gaming', 10000)
Insert into Products values(13, 'CPU', 'With high processor', 1000)
Insert into Products values(14, 'Speakers', 'Speaker with 30W output', 9000)
Insert into Products values(15, 'Routers', 'High speed internet', 10000)
Insert into Products values(16, 'Printers', 'Portable printer', 3000)


select * from Products

create table Orders (OrderID int primary key, CustomerID int , Orderdate date, TotalAmount int , foreign key(CustomerID) references Customers(CustomerID))
Insert into Orders values(0001, 101, '09-02-2023', 5000)
Insert into Orders values(0002, 102, '10-05-2023', 2000)
Insert into Orders values(0003, 103, '09-07-2024', 4000)
Insert into Orders values(0004, 104, '05-09-2024', 2000)
Insert into Orders values(0005, 105, '02-01-2023', 1000)
Insert into Orders values(0006, 106, '09-12-2024', 5000)

select * from Orders

Create table OrderDetails (
OrderDetailID int primary key,
OrderID int,
ProductID int,
Quantity int, 
foreign key(OrderID) references Orders(OrderID), 
foreign key (ProductID) references Products(ProductID))
Insert into OrderDetails values(1000,0001, 01, 2)
Insert into OrderDetails values(1001,0002, 02, 3)
Insert into OrderDetails values(1002,0003, 03, 4)
Insert into OrderDetails values(1003,0004, 04, 2)
Insert into OrderDetails values(1004,0005, 05, 4)
Insert into OrderDetails values(1005,0006, 06, 5)
Insert into OrderDetails values(1006,0007, 07, 7)


select * from OrderDetails

Create Table Inventory(
InventoryID  int primary key,
ProductID int,
QuantityInStock int,
LastStockUpdate int,
foreign key(ProductID) references Products(ProductID))

Insert into Inventory values(001,11,15,20)
Insert into Inventory values(002,12,23,57)
Insert into Inventory values(003,13,53,65)
Insert into Inventory values(004,14,32,53)
Insert into Inventory values(005,15,65,75)
Insert into Inventory values(006,16,11,64)
Insert into Inventory values(007,17,13,42)


select * from Inventory

--Tasks 2: Select, Where, Between, AND, LIKE:

--1.Write an SQL query to retrieve the names and emails of all customers. 
select FirstName, LastName, Email from Customers 

--2.Write an SQL query to list all orders with their order dates and corresponding customer names
SELECT 
    OrderID,
    Orderdate,
    (SELECT FirstName FROM customers WHERE customers.CustomerID = orders.CustomerID) AS customer_name
FROM 
    orders;

--3.Write an SQL query to insert a new customer record into the "Customers" table. Include customer information such as name, email, and address.
Insert into Customers(CustomerID, FirstName, Email, Address) values (111, 'Mercy', 'mercy@gmail.com', 'MP') 


--4.Write an SQL query to update the prices of all electronic gadgets in the "Products" table by increasing them by 10%
update products set price=price*1.10 where productName in('keyboard','printer','tablet','router')

--5.Write an SQL query to delete a specific order and its associated order details from the "Orders" and "OrderDetails" tables. Allow users to input the order ID as a parameter
declare @Orderid int;
set @orderid=101
delete from orderdetails where orderid=@orderid
delete from orders where orderid=@orderid
select *from orders,orderdetails

--6.Write an SQL query to insert a new order into the "Orders" table. Include the customer ID, order date, and any other necessary information
Insert into Orders values(11, 111, '04-26-2024',2400)

--7.Write an SQL query to update the contact information (e.g., email and address) of a specific customer in the "Customers" table. Allow users to input the customer ID and new contact information.
Declare @customerid int,@email varchar(20),@address varchar(20)
set @customerid=11
set @email='johnny@gmail.com'
set @address='Delhi '
update customers set email=@email,address=@address where customerid=@customerid
select *from customers

--8.Write an SQL query to recalculate and update the total cost of each order in the "Orders" table based on the prices and quantities in the "OrderDetails" table.UPDATE Orders
UPDATE Orders
SET TotalAmount = (
    SELECT SUM(od.quantity * p.price)
    FROM OrderDetails od
    WHERE od.OrderID = Orders.OrderID
)

--9.Write an SQL query to delete all orders and their associated order details for a specific customer from the "Orders" and "OrderDetails" tables. Allow users to input the customer ID as a parameter.
Declare @customerid1 int
set @customerid1=2
delete from orderdetails where orderid in (select orderid from orders where customerid=@customerid1)
delete from orders where orderid in(select orderid from orders where customerid=@customerid1)

--10.. Write an SQL query to insert a new electronic gadget product into the "Products" table, including product name, category, price, and any other relevant details
insert into products (productId,productName,price) values(21,'Lappy',70000)

--11.. Write an SQL query to update the status of a specific order in the "Orders" table (e.g., from "Pending" to "Shipped"). Allow users to input the order ID and the new status.
alter table orders add status varchar(20) default 'pending'
select *from orders

Declare @orderid1 int,@status varchar(10)
set @orderid1=103
set @status='shipped'
update orders set status=@status where orderid=@orderid1
--12.Write an SQL query to calculate and update the number of orders placed by each customer in the "Customers" table based on the data in the "Orders" table.
select *from customers
UPDATE Customers
SET NoOfOrders = (
    SELECT COUNT(customerid)
    FROM Orders
    WHERE Orders.CustomerID = Customers.CustomerID
)

--task-3
--Task 3. Aggregate functions, Having, Order By, GroupBy and Joins:
--1.Write an SQL query to retrieve a list of all orders along with customer information (e.g., customer name) for each order.

SELECT OrderID, OrderDate, FirstName,LastName 
FROM 
    Orders
INNER JOIN 
    Customers ON Orders.CustomerID = Customers.CustomerID;

--2.Write an SQL query to find the total revenue generated by each electronic gadget product. Include the product name and the total revenue

SELECT ProductName, SUM(OrderDetails.Quantity * Products.Price) AS TotalRevenue
FROM 
    OrderDetails, Products
WHERE 
    OrderDetails.ProductID = Products.ProductID
GROUP BY 
    Products.ProductName;

--3.Write an SQL query to list all customers who have made at least one purchase. Include their names and contact information.
SELECT FirstName, LastName, Email, Phone FROM Customers
WHERE CustomerID IN (SELECT DISTINCT CustomerID FROM Orders);

--4.Write an SQL query to find the most popular electronic gadget, which is the one with the highest total quantity ordered. Include the product name and the total quantity ordered.

SELECT p.ProductName,SUM(od.Quantity) AS TotalQuantityOrdered
FROM OrderDetails od INNER JOIN Products p ON od.ProductID = p.ProductID
GROUP BY p.ProductName ORDER BY TotalQuantityOrdered DESC

--5.Write an SQL query to retrieve a list of electronic gadgets along with their corresponding categories.
select productname,category_name from products,category where products.categoryid=category.categoryid

--6.Write an SQL query to calculate the average order value for each customer. Include the customer's name and their average order value
SELECT c.FirstName, c.LastName, AVG(o.TotalAmount) AS AverageOrderValue
FROM Customers c INNER JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.FirstName, c.LastName;

--7.Write an SQL query to find the order with the highest total revenue. Include the order ID, customer information, and the total revenue.
SELECT o.OrderID, c.FirstName, c.LastName, o.TotalAmount AS TotalRevenue
FROM Orders o INNER JOIN Customers c ON o.CustomerID = c.CustomerID
ORDER BY o.TotalAmount DESC

--8.Write an SQL query to list electronic gadgets and the number of times each product has been ordered.
SELECT p.ProductName, COUNT(od.OrderID) AS NumberOfOrders
FROM Products p LEFT JOIN OrderDetails od ON p.ProductID = od.ProductID
GROUP BY p.ProductName;

--9.Write an SQL query to find customers who have purchased a specific electronic gadget product. Allow users to input the product name as a parameter.
select *from orderdetails
declare @productid int
set @productid=3
select concat(firstname,' ',lastname) as Name,email,phone,address  from customers where 
customerid=(select customerid from orders where 
orderid=(select orderid from orderdetails where 
productid=(select productid from products where
productid=@productid))) 

--10.Write an SQL query to calculate the total revenue generated by all orders placed within a specific time period. Allow users to input the start and end dates as parameters.
DECLARE @STARTDATE DATE;
DECLARE @ENDDATE DATE;

SET @STARTDATE='2023-03-01';
SET @ENDDATE='2024-11-01';

SELECT sum(TotalAmount) "Total Revenue" FROM Orders WHERE OrderDate between @STARTDATE AND @ENDDATE;


--Task-4
--Task 4. Subquery and its type:
--1.Write an SQL query to find out which customers have not placed any orders.
select firstname from Customers 
where customerid not in
(select Customerid from Orders)

--2.Write an SQL query to find the total number of products available for sale.
select COUNT(*)"Products Available" FROM Inventory 
WHERE QuantityInStock!=0;

--3.Write an SQL query to calculate the total revenue generated by TechShop.
SELECT SUM(TotalAmount) "Total Revenue" FROM Orders ;

(SELECT SUM(OD.Quantity*P.Price) "Total revenue" FROM OrderDetails OD
INNER JOIN Products P
ON P.ProductID=OD.ProductID)

--4.Write an SQL query to calculate the average quantity ordered for products in a specific category. Allow users to input the category name as a parameter.
DECLARE @category_name VARCHAR(50) = 'Wireless';
SELECT AVG(Quantity) AS AverageQuantityOrdered
FROM (
    SELECT od.Quantity
    FROM OrderDetails od
    JOIN Products p ON od.ProductID = p.ProductID
    JOIN Category c ON p.cid = c.cid
    WHERE c.cname = @category_name
) AS OrdersByCategory

--5.Write an SQL query to calculate the total revenue generated by a specific customer. Allow users to input the customer ID as a parameter

DECLARE @cust_id INT = 1410
SELECT SUM(TotalAmount) AS TotalRevenue
FROM (
    SELECT o.TotalAmount
    FROM Orders o
    WHERE o.CustomerID = @cust_id
) AS CustomerOrders

--6.Write an SQL query to find the customers who have placed the most orders. List their names and the number of orders they've placed

SELECT FirstName, LastName, NumOrdersPlaced
FROM ( SELECT c.FirstName, c.LastName, COUNT(o.OrderID) AS NumOrdersPlaced
    FROM Customers c
    JOIN Orders o ON c.CustomerID = o.CustomerID
    GROUP BY c.FirstName, c.LastName
) AS CustomerOrders
ORDER BY NumOrdersPlaced DESC

--7.Write an SQL query to find the most popular product category, which is the one with the highest total quantity ordered across all orders.

SELECT c.FirstName AS MostPopularCategory, TotalQuantityOrdered
FROM (
    SELECT C.FirstName, SUM(od.Quantity) AS TotalQuantityOrdered
    FROM Category c
    JOIN Products p ON c.cid = p.cid
    JOIN OrderDetails od ON p.ProductID = od.ProductID
    GROUP BY c.cname
) AS CategoryTotalQuantities
ORDER BY TotalQuantityOrdered DESC

--8.Write an SQL query to find the customer who has spent the most money (highest total revenue) on electronic gadgets. List their name and total spending.

SELECT c.FirstName, c.LastName, TotalSpending
FROM Customers c
JOIN (
    SELECT o.CustomerID, SUM(od.Quantity * p.Price) AS TotalSpending
    FROM Orders o
    JOIN OrderDetails od ON o.OrderID = od.OrderID
    JOIN Products p ON od.ProductID = p.ProductID
    JOIN Category cat ON p.cid = cat.cid
    WHERE cat.cname = 'Electronics'
    GROUP BY o.CustomerID
) AS CustomerSpending ON c.CustomerID = CustomerSpending.CustomerID
ORDER BY TotalSpending DESC

--9.Write an SQL query to calculate the average order value (total revenue divided by the number of orders) for all customers

SELECT AVG(OrderValue) AS AverageOrderValue
FROM (
    SELECT SUM(TotalAmount) AS OrderValue
    FROM Orders
    GROUP BY CustomerID
) AS CustomerOrders;

--10.Write an SQL query to find the total number of orders placed by each customer and list their names along with the order count

SELECT c.FirstName, c.LastName, OrderCount
FROM Customers c
JOIN (
    SELECT CustomerID, COUNT(*) AS OrderCount
    FROM Orders
    GROUP BY CustomerID
) AS CustomerOrderCount ON c.CustomerID = CustomerOrderCount.CustomerID;
