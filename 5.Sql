5. Orders placed by specific EmployeeID
Show all the orders placed by a specific employee. The EmployeeID for this Employee (Steven Buchanan) is 5.

Queries with two Approaches with joins methods:

joins methods:
select OrderID,OrderDate from Orders
inner join Employees  ON Orders.EmployeeID = Employees.EmployeeID where Orders.EmployeeID = 5;

Simple Method:
select OrderID,OrderDate from Orders where EmployeeID = 5;
