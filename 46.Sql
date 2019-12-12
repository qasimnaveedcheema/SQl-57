46. Late orders vs. total orders - percentage
Now we want to get the percentage of late orders over total orders.

Query:

;With LateOrders as 
( 
Select EmployeeID ,TotalOrders = Count(*) 
From Orders 
Where RequiredDate <= ShippedDate 
Group By EmployeeID ) , 
AllOrders as 
( 
Select EmployeeID ,TotalOrders = Count(*) 
From Orders 
Group By EmployeeID ) 
Select Employees.EmployeeID ,LastName ,AllOrders = AllOrders.TotalOrders ,
LateOrders = LateOrders.TotalOrders ,PercentLateOrder = (LateOrders.TotalOrders * 1.00 /AllOrders.TotalOrders)
From Employees 
Join AllOrders on AllOrders.EmployeeID = Employees.EmployeeID 
Left Join LateOrders on LateOrders.EmployeeID = Employees.EmployeeID;
