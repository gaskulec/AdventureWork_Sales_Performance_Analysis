use AdventureWorks2014
select 
	cast (round (sum (sod.LineTotal),0) as numeric(18,2)) as [RoundedTotal],
	pc.Name as [CategoryName]
from [Sales].[SalesOrderDetail] sod
join [Production].[Product] pp
on sod.[ProductID] = pp.ProductID
join [Production].[ProductSubcategory] ps
on pp.ProductSubcategoryID = ps.ProductSubcategoryID
join [Production].[ProductCategory] pc
on ps.ProductCategoryID = pc.ProductCategoryID
group by pc.Name
order by [RoundedTotal] desc;
