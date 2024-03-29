19. Orders and the Shipper that was used
We’d like to show a list of the Orders that were made, including the Shipper that was used. Show the OrderID, OrderDate (date only), 
and CompanyName of the Shipper, and sort by OrderID.
In order to not show all the orders (there’s more than 800), show only those rows with an OrderID of less than 10300.

Query:

select OrderID,OrderDate=convert(date,OrderDate), CompanyName AS supplier
from Orders
inner join Shippers
ON Orders.ShipVia=Shippers.ShipperID
where OrderID < 10300
order by OrderID;
