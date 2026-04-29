-- 1. Overall Cancellation Rate
SELECT 
    COUNT(*) AS TotalTransactions,
    SUM(CASE WHEN IsCancellation = 1 THEN 1 ELSE 0 END) AS TotalCancellations,
    CAST(
        100.0 * SUM(CASE WHEN IsCancellation = 1 THEN 1 ELSE 0 END) / COUNT(*) 
        AS DECIMAL(5,2)
    ) AS CancellationRatePercent
FROM fact_sales;


-- 2. Top Customers by Cancellation Count
SELECT TOP 10
    CustomerID,
    COUNT(*) AS CancellationCount
FROM fact_sales
WHERE 
    IsCancellation = 1
    AND CustomerID IS NOT NULL
GROUP BY CustomerID
ORDER BY CancellationCount DESC;


-- 3. Customers with High Cancellation Rate
SELECT 
    CustomerID,
    COUNT(*) AS TotalOrders,
    SUM(CASE WHEN IsCancellation = 1 THEN 1 ELSE 0 END) AS TotalCancellations,
    CAST(
        100.0 * SUM(CASE WHEN IsCancellation = 1 THEN 1 ELSE 0 END) / COUNT(*) 
        AS DECIMAL(5,2)
    ) AS CancellationRate
FROM fact_sales
WHERE CustomerID IS NOT NULL
GROUP BY CustomerID
HAVING 
    COUNT(*) > 5  -- filter small/noisy customers
ORDER BY CancellationRate DESC;


-- 4. Top Products with Most Cancellations
SELECT TOP 10
    StockCode,
    Description,
    COUNT(*) AS CancellationCount
FROM fact_sales
WHERE IsCancellation = 1
GROUP BY StockCode, Description
ORDER BY CancellationCount DESC;


-- 5. Revenue Loss Due to Cancellations
SELECT 
    SUM(Revenue) AS TotalRevenueImpact
FROM fact_sales
WHERE IsCancellation = 1;


-- 6. High-Risk Customer Flagging
SELECT 
    CustomerID,
    COUNT(*) AS TotalOrders,
    SUM(CASE WHEN IsCancellation = 1 THEN 1 ELSE 0 END) AS TotalCancellations,
    CAST(
        100.0 * SUM(CASE WHEN IsCancellation = 1 THEN 1 ELSE 0 END) / COUNT(*) 
        AS DECIMAL(5,2)
    ) AS CancellationRate,
    CASE 
        WHEN 
            100.0 * SUM(CASE WHEN IsCancellation = 1 THEN 1 ELSE 0 END) / COUNT(*) > 50 
        THEN 'High Risk'
        WHEN 
            100.0 * SUM(CASE WHEN IsCancellation = 1 THEN 1 ELSE 0 END) / COUNT(*) BETWEEN 20 AND 50
        THEN 'Medium Risk'
        ELSE 'Low Risk'
    END AS RiskCategory
FROM fact_sales
WHERE CustomerID IS NOT NULL
GROUP BY CustomerID
HAVING COUNT(*) > 5
ORDER BY CancellationRate DESC;