
/*Q1: By Order Quantity, what were the five most popular products sold in 2014?
Include these data points in the output:
Order Date Year
Product ID
Product Name
Product Number
Product Color
Sales Order Count
Order Quantity
Sales Order Line total*/

SELECT TOP 5 YEAR(soh.OrderDate) AS OrderYear, 
             P.ProductID, 
             P.Name AS ProductName, 
             P.ProductNumber, 
             P.Color, 
             COUNT(sod.SalesOrderID) AS CountSalesOrderID, 
             SUM(sod.OrderQty) AS SumOrderQty, 
             SUM(sod.LineTotal) AS SumLineTotal
FROM Production.Product AS P
     JOIN Sales.SalesOrderDetail AS sod ON p.ProductID = SOD.ProductID
     JOIN Sales.SalesOrderHeader AS soh ON soh.SalesOrderID = sod.SalesOrderID
WHERE YEAR(soh.OrderDate) = 2014
GROUP BY YEAR(soh.OrderDate), 
         P.ProductID, 
         P.Name, 
         P.ProductNumber, 
         P.Color
ORDER BY SumOrderQty;


/*Q2: How long are the 7 longest Person names and to whom do they belong? Rank by Full Name length, Last Name Length, First Name Length
Include these data points in the output:
Business Entity ID
Full Name
Full Name Length
First Name
First Name Length
Middle Name
Last Name
Last Name Length*/

--SELECT * FROM Person.Person P;
SELECT TOP 7 pp.BusinessEntityID, 
             REPLACE(COALESCE(pp.FirstName, ' ') + ' ' + COALESCE(pp.MiddleName, ' ') + ' ' + COALESCE(pp.LastName, ' '), ' ', ' ') AS FullName, 
             LEN(REPLACE(COALESCE(pp.FirstName, ' ') + ' ' + COALESCE(pp.MiddleName, ' ') + ' ' + COALESCE(pp.LastName, ' '), ' ', ' ')) AS FullNameLength, 
             pp.FirstName, 
             LEN(pp.FirstName) AS FirstNameLenth, 
             pp.MiddleName, 
             pp.LastName, 
             LEN(pp.LastName) AS LastNameLength
FROM [Person].[Person] AS pp
ORDER BY 3 DESC, 
         8 DESC, 
         5 DESC;

		 
/*Q3: Which Department pays its female workers on average the most per year?
Include these fields:
Department ID
Department Name
Gender
Total Yearly Pay
Business Entity ID Count
Average Yearly Pay*/

WITH ex1
     AS (SELECT d.DepartmentID, 
                d.Name AS DepName, 
                e.Gender, 
                eph.Rate, 
                eph.PayFrequency, 
                e.SalariedFlag,
                CASE
                    WHEN e.SalariedFlag = 1
                    THEN rate * 1000
                    WHEN e.SalariedFlag = 0
                    THEN Rate * 2080
                    ELSE 0
                END AS YearlyPay, 
                COUNT(e.BusinessEntityID) AS CountBusinessEntityID,
                CASE
                    WHEN e.SalariedFlag = 1
                    THEN Rate * 1000
                    WHEN e.SalariedFlag = 0
                    THEN Rate * 2080
                    ELSE 0
                END * COUNT(e.BusinessEntityID) AS TotalYearPay
         FROM HumanResources.Employee AS e
              JOIN HumanResources.EmployeeDepartmentHistory AS edh ON e.BusinessEntityID = edh.BusinessEntityID
              JOIN HumanResources.EmployeePayHistory AS eph ON edh.BusinessEntityID = eph.BusinessEntityID
              JOIN HumanResources.Department AS d ON edh.DepartmentID = d.DepartmentID
         WHERE e.Gender = 'F'
         GROUP BY d.DepartmentID, 
                  d.Name, 
                  e.Gender, 
                  eph.Rate, 
                  eph.PayFrequency, 
                  e.SalariedFlag,
                  CASE
                      WHEN e.SalariedFlag = 1
                      THEN Rate * 1000
                      WHEN e.SalariedFlag = 0
                      THEN Rate * 2080
                      ELSE 0
                  END)
     SELECT TOP 8 ex1.DepartmentID, 
                  ex1.DepName, 
                  ex1.Gender, 
                  SUM(ex1.TotalYearPay) AS TotalYearPay, 
                  SUM(ex1.CountBusinessEntityID) AS CountBusinessEntityID,
                  SUM(ex1.TotalYearPay) / SUM(ex1.CountBusinessEntityID) AS AverageYearlyPay
     FROM ex1
     GROUP BY ex1.DepartmentID, 
              ex1.DepName, 
              ex1.Gender
     ORDER BY AverageYearlyPay DESC;
