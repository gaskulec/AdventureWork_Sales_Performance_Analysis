use AdventureWorks2014
select top 10
	soh.CustomerID, pp.FirstName, pp.LastName,
	round(
		sum([TotalDue]),
	2) as [TotalExpences]
from [Sales].[SalesOrderHeader] soh
join [Sales].[Customer] sc
on soh.CustomerID = sc.CustomerID
join [Person].[Person] pp
on sc.PersonID = pp.BusinessEntityID
group by soh.CustomerID, pp.FirstName, pp.LastName
order by [TotalExpences] desc;