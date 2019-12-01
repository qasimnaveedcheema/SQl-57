21. Total customers per country/city
In the Customers table, show the total number of customers per Country and City.

Query:
select Country,City,TotalCustomer =count(*)
from Customers
GROUP BY Country,City order by TotalCustomer DESC;
