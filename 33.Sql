
33. High-value customers - total orders
The manager has changed his mind. Instead of requiring that customers have at least one individual orders totaling $10,000 or more, 
he wants to define high-value customers as those who have orders totaling $15,000 or more in 2016. 
How would you change the answer to the problem above?

Query:
Select Customers.CustomerID ,Customers.CompanyName ,
TotalOrderAmount = sum(Quantity * UnitPrice) 
From Customers Join 
Orders on Orders.CustomerID = Customers.CustomerID Join 
[Order Details] on Orders.OrderID = [Order Details].OrderID 
Where OrderDate >= '19960704' and OrderDate < '19970131' 
Group By Customers.CustomerID ,Customers.CompanyName
Having Sum(Quantity * UnitPrice) > 15000 Order by TotalOrderAmount DESC;
