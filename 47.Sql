47. Late orders vs. total orders - fix decimal
So now for the PercentageLateOrders, we get a decimal value like we should. 
But to make the output easier to read, let's cut the PercentLateOrders off at 2 digits to the right of the decimal point.

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
LateOrders = LateOrders.TotalOrders ,PercentLateOrder = convert(DECIMAL (10,2),(LateOrders.TotalOrders * 1.00 /AllOrders.TotalOrders))
From Employees 
Join AllOrders on AllOrders.EmployeeID = Employees.EmployeeID 
Left Join LateOrders on LateOrders.EmployeeID = Employees.EmployeeID;
