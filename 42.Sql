42. Late orders - which employees?
Some salespeople have more orders arriving late than others.
Maybe they're not following up on the order process, and need more training. 
Which salespeople have the most orders arriving late?

Query:
select Employees.EmployeeID,Employees.LastName,
TotalLateOrders = count(*)
from Employees
join Orders 
on Employees.EmployeeID = Orders.EmployeeID
where RequiredDate<ShippedDate
group by
Employees.EmployeeID,
Employees.LastName
order by TotalLateOrders DESC;
