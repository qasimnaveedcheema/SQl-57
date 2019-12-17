53. Countries with suppliers or customers, version 2
The employees going on the business trip don’t want just a raw list of countries, 
they want more details. We’d like to see output like the below, in the Expected Results.

Query:
;With SupplierCountries as 
(Select Distinct Country from Suppliers) ,
CustomerCountries as 
(Select Distinct Country from Customers) 
Select 
SupplierCountry = SupplierCountries .Country ,
CustomerCountry = CustomerCountries .Country 
From SupplierCountries 
Full Outer Join CustomerCountries on CustomerCountries.Country = SupplierCountries.Country
