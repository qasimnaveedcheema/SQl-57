34. High-value customers - with discount
Change the above query to use the discount when calculating high-value customers. Order by the total amount which includes the discount.

Query:
Select Customers.CustomerID ,Customers.CompanyName ,
TotalwithDiscount = sum(Quantity * UnitPrice), 
TotalwithoutDiscount = sum(Quantity * UnitPrice * (1-Discount))
From Customers Join 
Orders on Orders.CustomerID = Customers.CustomerID Join 
[Order Details] on Orders.OrderID = [Order Details].OrderID 
Where OrderDate >= '19960704' and OrderDate < '19970131' 
Group By Customers.CustomerID ,Customers.CompanyName
Having sum(Quantity * UnitPrice * (1-Discount)) > 15000 
Order by TotalwithDiscount DESC;
