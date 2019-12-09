35. Month-end orders
At the end of the month, salespeople are likely to try much harder to get orders, to meet their month-end quotas. 
Show all orders made on the last day of the month. Order by EmployeeID and OrderID

Query:
select Orders.EmployeeID,Orders.OrderID,Orders.OrderDate
from Orders
where OrderDate = EOMONTH(OrderDate)
order by EmployeeID,OrderID;
