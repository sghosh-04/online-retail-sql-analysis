-- 1. Top Customers by Revenue
SELECT TOP 10
    CustomerID,
    SUM(Revenue) AS TotalRevenue
FROM fact_sales
WHERE 
    IsCancellation = 0
    AND CustomerID IS NOT NULL
GROUP BY CustomerID
ORDER BY TotalRevenue DESC;


-- 2. Customer Order Frequency
SELECT 
    CustomerID,
    COUNT(DISTINCT InvoiceNo) AS TotalOrders
FROM fact_sales
WHERE 
    IsCancellation = 0
    AND CustomerID IS NOT NULL
GROUP BY CustomerID
ORDER BY TotalOrders DESC;


-- 3. Average Order Value per Customer
SELECT 
    CustomerID,
    SUM(Revenue) / COUNT(DISTINCT InvoiceNo) AS AvgOrderValue
FROM fact_sales
WHERE 
    IsCancellation = 0
    AND CustomerID IS NOT NULL
GROUP BY CustomerID
ORDER BY AvgOrderValue DESC;


-- 4. Customer Purchase Volume (Total Quantity)
SELECT 
    CustomerID,
    SUM(Quantity) AS TotalItemsPurchased
FROM fact_sales
WHERE 
    IsCancellation = 0
    AND CustomerID IS NOT NULL
GROUP BY CustomerID
ORDER BY TotalItemsPurchased DESC;


-- 5. Customer Segmentation (Simple High/Medium/Low Spenders)
SELECT 
    CustomerID,
    SUM(Revenue) AS TotalRevenue,
    CASE 
        WHEN SUM(Revenue) > 10000 THEN 'High Value'
        WHEN SUM(Revenue) BETWEEN 5000 AND 10000 THEN 'Medium Value'
        ELSE 'Low Value'
    END AS CustomerSegment
FROM fact_sales
WHERE 
    IsCancellation = 0
    AND CustomerID IS NOT NULL
GROUP BY CustomerID
ORDER BY TotalRevenue DESC;