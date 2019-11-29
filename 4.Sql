4. Sales Representatives in the United States
Now we’d like to see the same columns as above, but only for those employees that both have the title of Sales Representative, 
and also are in the United States.

Query:
select FirstName,LastName,HireDate from Employees where Title = 'Sales Representative' and Country = 'USA';
