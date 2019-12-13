50. Customer grouping with percentage
Based on the above query, show all the defined CustomerGroups, and the percentage in each. 
Sort by the total in each group, in descending order.

Query:
;with Order1997 as (
select 
Customers.CustomerID,
CompanyName,
TotoalOrderAmount = SUM(Quantity*UnitPrice)
from
	Customers
	join Orders on Orders.CustomerID = Customers.CustomerID
	join [Order Details] on Orders.OrderID = [Order Details].OrderID
	where 
	OrderDate >= '19970101' 
	and OrderDate < '19980101'
	group by 
		Customers.CustomerID,Customers.CompanyName
		),
	customerGrouping as (
	select 
	CustomerID,
	CompanyName,
	TotoalOrderAmount,
	CustomerGroup = 
		Case
		when TotoalOrderAmount >= 0 and TotoalOrderAmount< 1000 then 'low'
		when TotoalOrderAmount> =  1000 and TotoalOrderAmount <5000 then 'Medium'
		when TotoalOrderAmount >= 5000 and TotoalOrderAmount<10000 then 'High'
		when TotoalOrderAmount>= 10000  then 'Very High'
		End
	from Order1997

	)
	select CustomerGroup,TotalInGroup= count(*),
	PercentageInGroup = count(*) * 1.0 /(select count(*) from customerGrouping)
	from customerGrouping
	group by CustomerGroup
	order by TotalInGroup desc
