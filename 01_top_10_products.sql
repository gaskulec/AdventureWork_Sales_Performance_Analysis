use AdventureWorks2014
select top 10
	p.ProductID,
	p.Name, 
	c.Name as [CategoryName], 
	round(
		sum(
			cast(sod.LineTotal as numeric (10,0))
			),
	2) as [TotalSell]
from [Production].[ProductCategory] c
join [Production].[ProductSubcategory] sb
on c.ProductCategoryID = sb.ProductCategoryID
join [Production].[Product] p
on sb.ProductSubcategoryID = p.ProductSubcategoryID
join [Sales].[SalesOrderDetail] sod
on p.ProductID = sod.ProductID
group by p.ProductID, c.Name, p.Name
order by [TotalSell] desc;