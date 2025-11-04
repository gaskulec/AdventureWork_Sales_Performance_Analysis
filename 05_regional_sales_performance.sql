select st.[Group] as [Region], st.[CountryRegionCode], st.[Name] as [SalesTerritory],
	round (sum(soh.TotalDue),2) as [TotalAmount],
	count (soh.[SalesOrderID]) as [NumberOfOrders],
	sum ([OrderQty]) as [NumberOfSoldProducts]
from [Sales].[SalesOrderDetail] sod 
join [Sales].[SalesOrderHeader] soh
on sod.SalesOrderID = soh.SalesOrderID
join [Sales].[SalesTerritory] st
on soh.TerritoryID = st.TerritoryID
group by st.[Group], st.[CountryRegionCode], st.[Name]
order by [TotalAmount] desc;
