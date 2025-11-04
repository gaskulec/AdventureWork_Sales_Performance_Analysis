use AdventureWorks2014
select YEAR([OrderDate]) as [Year], 
	cast (round (sum (sod.LineTotal),0) as numeric(18,2)) as [RoundedTotal],
	pc.Name as [CategoryName],
	ps.Name as [SubcategoryName]
from [Sales].[SalesOrderHeader] soh
join [Sales].[SalesOrderDetail] sod
on soh.SalesOrderID = sod.SalesOrderID
join [Production].[Product] pp
on sod.[ProductID] = pp.ProductID
join [Production].[ProductSubcategory] ps
on pp.ProductSubcategoryID = ps.ProductSubcategoryID
join [Production].[ProductCategory] pc
on ps.ProductCategoryID = pc.ProductCategoryID
group by pc.Name, YEAR([OrderDate]), ps.Name
order by YEAR([OrderDate]) desc;
