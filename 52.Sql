52. Countries with suppliers or customers
Some Northwind employees are planning a business trip, and would like to visit as many suppliers and customers as possible. 
For their planning, they’d like to see a list of all countries where suppliers and/or customers are based.

Query:
Select Country From Customers 
Union 
Select Country From Suppliers Order by Country
