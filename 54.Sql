54. Countries with suppliers or customers - version 3
The output of the above is improved, but it’s still not ideal
What we’d really like to see is the country name, the total suppliers, and the total customers.

Query:
;With SupplierCountries as 
(Select Country , Total = Count(*) from Suppliers group by Country) ,
CustomerCountries as 
(Select Country , Total = Count(*) from Customers group by Country) 
Select 
Country = isnull( SupplierCountries.Country, CustomerCountries.Country) ,
TotalSuppliers= isnull(SupplierCountries.Total,0) ,
TotalCustomers= isnull(CustomerCountries.Total,0) 
From SupplierCountries 
Full Outer Join CustomerCountries on CustomerCountries.Country = SupplierCountries.Country
