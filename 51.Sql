51. Customer grouping - flexible
Andrew, the VP of Sales is still thinking about how best to group customers, and define low, medium, high, and very high value customers. 
He now wants complete flexibility in grouping the customers, based on the dollar amount they've ordered. 
He doesn’t want to have to edit SQL in order to change the boundaries of the customer groups.
How would you write the SQL?
There's a table called CustomerGroupThreshold that you will need to use. Use only orders from 2016.

Query:
;with Orders2016 as ( Select Customers.CustomerID ,Customers.CompanyName ,TotalOrderAmount = SUM(Quantity * UnitPrice) 
From Customers 
Join Orders on Orders.CustomerID = Customers.CustomerID 
Join OrderDetails on Orders.OrderID = OrderDetails.OrderID 
Where OrderDate >= '20160101' and OrderDate < '20170101' 
Group by Customers.CustomerID ,Customers.CompanyName ) 
Select CustomerID
,CompanyName ,TotalOrderAmount ,CustomerGroupName 
from Orders2016 
Join CustomerGroupThresholds on Orders2016.TotalOrderAmount between CustomerGroupThresholds.RangeBottom 
and CustomerGroupThresholds.RangeTop Order by CustomerID
