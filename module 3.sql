

-- 1. Top Products by Revenue
SELECT TOP 10
    StockCode,
    Description,
    SUM(Revenue) AS TotalRevenue
FROM fact_sales
WHERE IsCancellation = 0
GROUP BY StockCode, Description
ORDER BY TotalRevenue DESC;


-- 2. Top Products by Quantity Sold
SELECT TOP 10
    StockCode,
    Description,
    SUM(Quantity) AS TotalQuantity
FROM fact_sales
WHERE IsCancellation = 0
GROUP BY StockCode, Description
ORDER BY TotalQuantity DESC;


-- 3. Most Frequently Purchased Products
SELECT TOP 10
    StockCode,
    Description,
    COUNT(*) AS PurchaseFrequency
FROM fact_sales
WHERE IsCancellation = 0
GROUP BY StockCode, Description
ORDER BY PurchaseFrequency DESC;


-- 4. Average Revenue per Product
SELECT 
    StockCode,
    Description,
    AVG(Revenue) AS AvgRevenuePerTransaction
FROM fact_sales
WHERE IsCancellation = 0
GROUP BY StockCode, Description
ORDER BY AvgRevenuePerTransaction DESC;


-- 5. Product Performance Segmentation
SELECT 
    StockCode,
    Description,
    SUM(Revenue) AS TotalRevenue,
    CASE 
        WHEN SUM(Revenue) > 50000 THEN 'High Performer'
        WHEN SUM(Revenue) BETWEEN 20000 AND 50000 THEN 'Medium Performer'
        ELSE 'Low Performer'
    END AS ProductCategory
FROM fact_sales
WHERE IsCancellation = 0
GROUP BY StockCode, Description
ORDER BY TotalRevenue DESC;