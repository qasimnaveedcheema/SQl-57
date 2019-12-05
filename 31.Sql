31. Customers with no orders for EmployeeID 4
One employee (Margaret Peacock, EmployeeID 4) has placed the most orders. 
However, there are some customers who've never placed an order with her. 
Show only those customers who have never placed an order with her.

Query1:

select Customers.CustomerID,Orders.CustomerID
from Customers
left join Orders on Orders.CustomerID = Customers.CustomerID and Orders.EmployeeID = 4
where Orders.CustomerID is null ;

Query2:

Select Customers.CustomerID ,Orders.CustomerID ,Orders.EmployeeID 
From Customers left join Orders
on Orders.CustomerID = Customers.CustomerID and Orders.EmployeeID = 4
where Orders.CustomerID is null ;
