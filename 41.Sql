41. Late orders
Some customers are complaining about their orders arriving late. Which orders are late?


Query:
select OrderID,OrderDate=convert(date,OrderDate),RequiredDate=convert(date,RequiredDate),
ShippedDate=convert(date,ShippedDate) 
from Orders
where RequiredDate<ShippedDate;
