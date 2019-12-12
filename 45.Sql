45. Late orders vs. total orders - fix null
Continuing on the answer for above query, let's fix the results for row 5 - Buchanan. He should have a 0 instead of a Null in LateOrders.

Query:


;With LateOrders as ( Select EmployeeID ,TotalOrders = Count(*) 
From Orders Where RequiredDate <= ShippedDate Group By EmployeeID ) , 
AllOrders as ( Select EmployeeID ,TotalOrders = Count(*) 
From Orders 
Group By EmployeeID ) 
Select Employees.EmployeeID ,LastName ,AllOrders = AllOrders.TotalOrders ,LateOrders = IsNull(LateOrders.TotalOrders, 0) 
From Employees 
Join 
AllOrders on AllOrders.EmployeeID = Employees.EmployeeID Left Join LateOrders on LateOrders.EmployeeID = Employees.EmployeeID;
