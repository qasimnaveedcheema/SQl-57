11. Showing only the Date with a DateTime field
In the output of the query above, showing the Employees in order of BirthDate, we see the time of the BirthDate field, which we don’t want. 
Show only the date portion of the BirthDate field.

Query:
select FirstName,LastName,Title,DateonlyBirthDate= convert(date, BirthDate) from Employees 
order by BirthDate;
