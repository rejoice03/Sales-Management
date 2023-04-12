--Clened Dim_Date table--

SELECT 
  [DateKey], 
  [FullDateAlternateKey] as Date 
  --,[DayNumberOfWeek]
  , 
  [EnglishDayNameOfWeek] as Day 
  --,[SpanishDayNameOfWeek]
  --,[FrenchDayNameOfWeek]
  --,[DayNumberOfMonth]
  --,[DayNumberOfYear]
  --,[WeekNumberOfYear]
  , 
  [EnglishMonthName] as Month, 
  LEFT([EnglishMonthName], 3) as MonthShort -- Useful for front end date navigation and front end graphs.
  --,[SpanishMonthName]
  --,[FrenchMonthName]
  , 
  [MonthNumberOfYear] as MonthonNo, 
  [CalendarQuarter] as Quarter, 
  [CalendarYear] as Year 
  --,[CalendarSemester]
  --,[FiscalQuarter]
  --,[FiscalYear]
  --,[FiscalSemester]
FROM 
  [AdventureWorksDW2019].[dbo].[DimDate] 
WHERE 
  CalendarYear in (2019, 2020, 2021)


-- Leansed Dim_Customers Table --

SELECT 
  c.CustomerKey AS CustomerKey, 
  --,[GeographyKey]
  --,[CustomerAlternateKey]
  --,[Title]
  c.FirstName AS [FirstName], 
  --,[MiddleName]
  c.LastName AS [LastName], 
  c.FirstName + ' ' + LastName AS [Full Name], -- Combined First and Last Name.
  --,[NameStyle]
  --,[BirthDate]
  --,[MaritalStatus]
  --,[Suffix]
  CASE c.Gender WHEN 'M' THEN 'Male' WHEN 'F' THEN 'Female' END AS Gender, 
  --,[Gender]
  --,[EmailAddress]
  --,[YearlyIncome]
  --,[TotalChildren]
  --,[NumberChildrenAtHome]
  --,[EnglishEducation]
  --,[SpanishEducation]
  --,[FrenchEducation]
  --,[EnglishOccupation]
  --,[SpanishOccupation]
  --,[FrenchOccupation]
  --,[HouseOwnerFlag]
  --,[NumberCarsOwned]
  --,[AddressLine1]
  --,[AddressLine2]
  --,[Phone]
  c.DateFirstPurchase AS DateFirstPurchase, 
  --,[CommuteDistance]
  g.City as [Customer City] -- Joined in Customer City from Geography Table.
FROM 
  [AdventureWorksDW2019].[dbo].[DimCustomer] as c 
  LEFT JOIN dbo.DimGeography as g ON g.GeographyKey = c.GeographyKey 
ORDER BY 
  CustomerKey ASC


-- Cleansed Dim_products tables --

SELECT 
  p.[ProductKey], 
  p.[ProductAlternateKey],
  --,[ProductSubcategoryKey]
  --,[WeightUnitMeasureCode]
  --,[SizeUnitMeasureCode] 
  p.[EnglishProductName] as [Product Name], 
  ps.EnglishProductSubcategoryName as [Sub Category], --Joined in from Sub Category Table.
  pc.EnglishProductCategoryName as [Product Category], --Joined in from Category Table.
  --,[SpanishProductName]
  --,[FrenchProductName]
  --,[StandardCost]
  --,[FinishedGoodsFlag]
  p.[Color] as [Product Color], 
  --,[SafetyStockLevel]
  --,[ReorderPoint]
  --,[ListPrice] 
  p.[Size] as [Product Size],
  --,[Weight]
  --,[DaysToManufacture] 
  p.[ProductLine] as [Product Line], 
  --,[DealerPrice]
  --,[Class]
  --,[Style]
  p.[ModelName] as [Product Model Name], 
  --,[LargePhoto]
  p.[EnglishDescription] as [Product Description], 
  --,[FrenchDescription]
  --,[ChineseDescription]
  --,[ArabicDescription]
  --,[HebrewDescription]
  --,[ThaiDescription]
  --,[GermanDescription]
  --,[JapaneseDescription]
  --,[TurkishDescription]
  --,[StartDate]
  --,[EndDate]
  ISNULL (p.Status, 'Outdated') as [Product Status] 
FROM 
  [AdventureWorksDW2019].[dbo].[DimProduct] AS p 
  left join DimProductSubcategory as ps on ps.ProductSubcategoryKey = p.ProductSubcategoryKey 
  left join DimProductCategory as pc on ps.ProductCategoryKey = pc.ProductCategoryKey 
ORDER BY 
  p.ProductKey asc


-- Cleansed FACT_InternetSales Table --

SELECT 
  [ProductKey], 
  [OrderDateKey], 
  [DueDateKey], 
  [ShipDateKey], 
  [CustomerKey], 
  --,[PromotionKey]
  --,[CurrencyKey]
  --,[SalesTerritoryKey]
  [SalesOrderNumber], 
  --,[SalesOrderLineNumber]
  --,[RevisionNumber]
  --,[OrderQuantity]
  --,[UnitPrice]
  --,[ExtendedAmount]
  --,[UnitPriceDiscountPct]
  --,[DiscountAmount]
  --,[ProductStandardCost]
  --,[TotalProductCost]
  [SalesAmount] 
  --,[TaxAmt]
  --,[Freight]
  --,[CarrierTrackingNumber]
  --,[CustomerPONumber]
  --,[OrderDate]
  --,[DueDate]
  --,[ShipDate]
FROM 
  [AdventureWorksDW2019].[dbo].[FactInternetSales] 
WHERE 
  LEFT (OrderDateKey, 4) in (2019, 2020, 2021) --Ensures we always only bring two yeaes of date fron=m extration.
ORDER BY 
  OrderDateKey ASC
