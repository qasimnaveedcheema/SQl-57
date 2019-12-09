38. Orders - accidental double-entry
Janet Leverling, one of the salespeople, has come to you with a request. 
She thinks that she accidentally double-entered a line item on an order, with a different ProductID, but the same quantity. 
She remembers that the quantity was 60 or more. Show all the OrderIDs with line items that match this, in order of OrderID.

Query:
select OrderID
from [Order Details]
where Quantity>=60
group by [Order Details].OrderID,[Order Details].Quantity
having count(*)>1;
