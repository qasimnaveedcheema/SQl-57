
Based on the previous question, we now want to show details of the order, for orders that match the above criteria.

Query:

;with PotentialDuplicates as ( Select OrderID From [Order Details] 
Where Quantity >= 60 
Group By OrderID, Quantity 
Having Count(*) > 1 ) 
Select OrderID ,ProductID ,UnitPrice ,Quantity ,Discount 
From [Order Details] 
Where OrderID in (Select OrderID from PotentialDuplicates) 
Order by OrderID ,Quantity DESC
