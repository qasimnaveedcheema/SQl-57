20. Categories, and the total products in each category
For this problem, we’d like to see the total number of products in each category. 
Sort the results by the total number of products, in descending order.

Query:

select CategoryName,
	TotalProduct = count(*)
	from Products join Categories ON Categories.CategoryID = Products.CategoryID
	GROUP BY CategoryName order by TotalProduct DESC;
