Late orders vs. total orders - missing employee
There's an employee missing in the answer from the problem above. Fix the SQL to show all employees who have taken orders.


Query:

;With LateOrders as ( Select EmployeeID ,TotalOrders = Count(*) 
From Orders 
Where RequiredDate <= ShippedDate Group By EmployeeID ) , 
AllOrders as ( Select EmployeeID ,TotalOrders = Count(*) From Orders Group By EmployeeID ) 
Select Employees.EmployeeID ,LastName ,AllOrders = AllOrders.TotalOrders ,LateOrders = LateOrders.TotalOrders 
From Employees Join AllOrders on AllOrders.EmployeeID = Employees.EmployeeID 
Left Join LateOrders on LateOrders.EmployeeID = Employees.EmployeeID;
