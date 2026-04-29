SELECT 
    FORMAT(InvoiceDate, 'yyyy-MM') AS YearMonth,
    SUM(Revenue) AS TotalRevenue
FROM fact_sales
WHERE IsCancellation = 0
GROUP BY FORMAT(InvoiceDate, 'yyyy-MM')
ORDER BY YearMonth;

SELECT 
    Country,
    SUM(Revenue) AS TotalRevenue
FROM fact_sales
WHERE IsCancellation = 0
GROUP BY Country
ORDER BY TotalRevenue DESC;

SELECT TOP 5
    Country,
    SUM(Revenue) AS TotalRevenue
FROM fact_sales
WHERE IsCancellation = 0
GROUP BY Country
ORDER BY TotalRevenue DESC;