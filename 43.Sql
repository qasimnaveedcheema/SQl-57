43. Late orders vs. total orders
Andrew, the VP of sales, has been doing some more thinking some more about the problem of late orders. 
He realizes that just looking at the number of orders arriving late for each salesperson isn't a good idea. 
It needs to be compared against the total number of orders per salesperson. Return results like the following:

Query:
;with LateOrders as
(
	select EmployeeId,TotalOrders =count(*)
	from Orders
	where RequiredDate<ShippedDate
	group by EmployeeId
	),
AllOrders as(
	select EmployeeId,TotalOrders =count(*)
	from Orders
	group by EmployeeId
	)
	select Employees.EmployeeID,Employees.LastName,
	AllOrders=AllOrders.TotalOrders,LateOrders=LateOrders.TotalOrders
	from Employees
	join AllOrders on Employees.EmployeeID = AllOrders.EmployeeID
	join LateOrders on Employees.EmployeeID = LateOrders.EmployeeID;
