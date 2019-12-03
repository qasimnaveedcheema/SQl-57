29. Inventory list
We re doing inventory, and need to show information like the below, for all orders. Sort by OrderID and Product ID.

Query:
select Employees.EmployeeID ,Employees.LastName, Orders.OrderID, Products.ProductName,[Order Details].Quantity
from Orders
join Employees ON Employees.EmployeeID = Orders.EmployeeID
join [Order Details] ON Orders.OrderID = [Order Details].OrderID
join Products ON Products.ProductID = [Order Details].ProductID
order by Orders.OrderID,Products.ProductID;
