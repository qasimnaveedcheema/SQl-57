
6. Suppliers and ContactTitles
In the Suppliers table, show the SupplierID, ContactName, and ContactTitle for those Suppliers whose ContactTitle is not Marketing Manager.

Query:
SELECT SupplierID, ContactName, ContactTitle FROM Suppliers
WHERE ContactTitle NOT IN ('Marketing Manager');
