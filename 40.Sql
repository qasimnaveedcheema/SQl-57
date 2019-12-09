40. Orders - accidental double-entry details, derived table
Here's another way of getting the same results as in the previous problem, 
using a derived table instead of a CTE. However, there's a bug in this SQL. It returns 20 rows instead of 16. Correct the SQL.

Query:
Select [Order Details].OrderID ,ProductID ,UnitPrice ,Quantity ,Discount 
From [Order Details]
Join 
( Select OrderID From [Order Details] 
Where Quantity >= 60 
Group By OrderID, Quantity Having Count(*) > 1 ) PotentialProblemOrders 
on PotentialProblemOrders.OrderID = [Order Details].OrderID 
Order by OrderID, Quantity DESC
