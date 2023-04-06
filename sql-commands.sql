use h_plus;

select * from `Orders`;
ALTER TABLE Orders ADD TotalDue DECIMAL(10,2) NOT NULL DEFAULT 0;

select * from `Customers`

select * from `Employees`
--  query 1
select
    Customers.CustomerID,
    Customers.FirstName,
    Customers.LastName
from
    Customers
join
    `Orders` on Customers.CustomerID = Orders.CustomerID

-- Query 2
select
    Customers.CustomerID,
    Customers.FirstName,
    Customers.Lastname,
    sum(CAST(substring(TotalDue, 2, LIMIT 10) as MONEY)) as Customer_total
from
    Customers c
join
    orders on Customers.CustomerID = orders.CustomerID
group by
    Customers.CustomerID,
    Customers.FirstName,
    Customers.LastName
group BY
    Customer_total
select CustomerID, FirstName, LastName from `Customers`
where `State` is null

select * from `Customers`

--select
--    [Orders].[OrderID],
--    Orders.[OrderDate],
--    Orders. [TotalDue],
--    Orders.[OrderStatus],
--    Orders.[SalesPersonID],
--    SUM([Quantity] * [price]) as New_Total_Due
--from
--    `Orders`
--join `Products` on `OrderID` = `Products`.OrderID
--join `Products` on `OrderID`.ProductID = `Products`.ProductID
--group by
--    Order.OrderID,
--    `OrderDate`,
--    TotalDue,
--    Orders.Status,
--    `CustomerID`,
--    `SalesPersonID`
--group by OrderID
select
    [Orders].[OrderID],
    Orders.[OrderDate],
    Orders.[OrderStatus],
    Orders.[SalesPersonID],
    SUM([Quantity] * [Price]) AS New_Total_Due
from
    [Orders]
JOIN
    [OrderDetails] ON [Orders].[OrderID] = [OrderDetails].[OrderID]
JOIN
    [Products] ON [OrderDetails].[ProductID] = [Products].[ProductID]
group by
    [Orders].[OrderID],
    [Orders].[OrderDate],
    [Orders].[New_Total_Due],
    [Orders].[OrderStatus],
    [Orders].[SalesPersonID];


select * from `Products`


ALTER TABLE Orders ADD column TotalDue DECIMAL(10,2) NOT NULL DEFAULT 0;
update Orders
join Products ON Orders.ProductID = Products.ProductID
SET Orders.TotalDue = Orders.Quantity * Products.Price;

-- Identifying duplicate data in a table
select CustomerID, count(1) as Num_Orders
from Orders
group by CustomerID

select  FirstName, LastName, count(1)
from Customers
group by FirstName, LastName
having count(1) > 1

 -- The date datatype
select year([Date]) As Order_year,
Month([Date]) as Order_Month,
Day([Date]) as Order_Day
from Orders

-- Retrieve current date on MySQL server
select current_timestamp() as Right_Now

select OrderID, [Date] as Order_date
from Orders
where
Month([Date]) = 5 Year([Date]) = '2016'

select OrderID, [Date] as Order_date
from Orders
where
[Date] Between '2016-01-01' and '2016-01-31'


-- Notice no orders have been made lately hence nothing will be returned this query
select OrderID, [Date] as Order_Date
from Orders
where
[Date] > GETDATE()


select OrderID, [Date] as Order_Date
from Orders
where
YEAR([Date]) > (YEAR(GETDATE()) - 5)

-- Working with strings(text)

select FirstName, LastName
from `Customers`
where
substring(`LastName`, 1, 3) = 'Smi'

select
    concat(FirstName, ' ', LastName) as Full_name
from
    `Customers`


select
upper(concat(FirstName, ' ', LastName) ) as Full_name
from `Customers`

select
lower(concat(FirstName, ' ', LastName) ) as Full_Name
from `Customers`

select
    replace([State], 'CA', 'California') as Full_State
from Customers

select * from `Products`

-- Aggregate functions for numbers/integers
select count(CustomerID) from `Customers`

select count(distinct CustomerID) from `Orders`

select `State`,
    count(CustomerID) as Customer_count
    from `Customers`

-- DATA MANIPULATION
-- adding columns
insert into `Customers`
(`CustomerID`, `FirstName`, `LastName`, `Email`, `Phone`, `Address`, `City`, `State`, `ZipCode`)
values('9999', 'Carol', 'Smith', 'Csmith@example.com', '(555)555-555', '123 Main Street', 'Little Rock', 'AR', '72209')


-- updating records
update `Customers` set `Phone` = '(501)343-2345'
where `CustomerID` = '9999'


-- Deleting records
delete from `Customers` where `CustomerID` = '9999'




