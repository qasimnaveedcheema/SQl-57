48. Customer grouping
Andrew Fuller, the VP of sales at Northwind, would like to do a sales campaign for existing customers. He'd like to categorize customers into groups, based on how much they ordered in 2016. Then, depending on which group the customer is in, he will target the customer with different sales materials.
The customer grouping categories are 0 to 1,000, 1,000 to 5,000, 5,000 to 10,000, and over 10,000.
A good starting point for this query is the answer from the problem “High-value customers - total orders. We don’t want to show customers who don’t have any orders in 2016.
Order the results by CustomerID.

Query:

select Customers.CustomerID,CompanyName,TotoalOrderAmount = SUM(Quantity*UnitPrice),
	CustomerGroup = 
		Case
		when SUM(Quantity*UnitPrice) between 0 and 1000 then 'low'
		when SUM(Quantity*UnitPrice) between 1001 and 5000 then 'Medium'
		when SUM(Quantity*UnitPrice) between 5001 and 10000 then 'High'
		when SUM(Quantity*UnitPrice) > 10001  then 'Very High'
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
