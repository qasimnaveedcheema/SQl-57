49. Customer grouping - fix null
There's a bug with the answer for the previous question. The CustomerGroup value for one of the rows is null.
Fix the SQL so that there are no nulls in the CustomerGroup field.

Query:
select Customers.CustomerID,CompanyName,TotoalOrderAmount = SUM(Quantity*UnitPrice),
	CustomerGroup = 
		Case
		when SUM(Quantity*UnitPrice) >= 0 and SUM(Quantity*UnitPrice)< 1000 then 'low'
		when SUM(Quantity*UnitPrice) > =  1000 and SUM(Quantity*UnitPrice) <5000 then 'Medium'
		when SUM(Quantity*UnitPrice) >= 5000 and SUM(Quantity*UnitPrice)<10000 then 'High'
		when SUM(Quantity*UnitPrice)>= 10000  then 'Very High'
		End
	from
	Customers
	join Orders on Orders.CustomerID = Customers.CustomerID
	join [Order Details] on Orders.OrderID = [Order Details].OrderID
	where 
	OrderDate >= '19970101' 
	and OrderDate < '19980101'
	group by 
		Customers.CustomerID,Customers.CompanyName;
