32. High-value customers
We want to send all of our high-value customers a special VIP gift. 
We're defining high-value customers as those who've made at least 1 order with a total value (not including the discount) equal to $10,000 or more. 
We only want to consider orders made in the year 2016.

Query:

Select Customers.CustomerID ,Customers.CompanyName ,Orders.OrderID ,
TotalOrderAmount = sum(Quantity * UnitPrice) 
From Customers Join Orders on Orders.CustomerID = Customers.CustomerID Join [Order Details] on Orders.OrderID = [Order Details].OrderID 
Where OrderDate >= '19960704' and OrderDate < '19970131' 
Group By Customers.CustomerID ,Customers.CompanyName ,Orders.OrderID
Having Sum(Quantity * UnitPrice) > 10000 Order by TotalOrderAmount DESC;
