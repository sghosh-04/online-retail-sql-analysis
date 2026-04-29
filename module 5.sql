

-- 1. Monthly Revenue Trend
SELECT 
    FORMAT(InvoiceDate, 'yyyy-MM') AS YearMonth,
    SUM(Revenue) AS TotalRevenue
FROM fact_sales
WHERE IsCancellation = 0
GROUP BY FORMAT(InvoiceDate, 'yyyy-MM')
ORDER BY YearMonth;


-- 2. Monthly Order Volume
SELECT 
    FORMAT(InvoiceDate, 'yyyy-MM') AS YearMonth,
    COUNT(DISTINCT InvoiceNo) AS TotalOrders
FROM fact_sales
WHERE IsCancellation = 0
GROUP BY FORMAT(InvoiceDate, 'yyyy-MM')
ORDER BY YearMonth;


-- 3. Monthly Active Customers
SELECT 
    FORMAT(InvoiceDate, 'yyyy-MM') AS YearMonth,
    COUNT(DISTINCT CustomerID) AS ActiveCustomers
FROM fact_sales
WHERE 
    IsCancellation = 0
    AND CustomerID IS NOT NULL
GROUP BY FORMAT(InvoiceDate, 'yyyy-MM')
ORDER BY YearMonth;


-- 4. First Purchase Month per Customer (Cohort Base)
WITH first_purchase AS (
    SELECT 
        CustomerID,
        MIN(InvoiceDate) AS FirstPurchaseDate
    FROM fact_sales
    WHERE 
        IsCancellation = 0
        AND CustomerID IS NOT NULL
    GROUP BY CustomerID
)

SELECT 
    CustomerID,
    FORMAT(FirstPurchaseDate, 'yyyy-MM') AS CohortMonth
FROM first_purchase;


-- 5. Cohort Retention Analysis
WITH first_purchase AS (
    SELECT 
        CustomerID,
        MIN(InvoiceDate) AS FirstPurchaseDate
    FROM fact_sales
    WHERE 
        IsCancellation = 0
        AND CustomerID IS NOT NULL
    GROUP BY CustomerID
),

cohort_data AS (
    SELECT 
        f.CustomerID,
        FORMAT(f.FirstPurchaseDate, 'yyyy-MM') AS CohortMonth,
        FORMAT(fs.InvoiceDate, 'yyyy-MM') AS ActivityMonth
    FROM first_purchase f
    JOIN fact_sales fs 
        ON f.CustomerID = fs.CustomerID
    WHERE fs.IsCancellation = 0
)

SELECT 
    CohortMonth,
    ActivityMonth,
    COUNT(DISTINCT CustomerID) AS Customers
FROM cohort_data
GROUP BY CohortMonth, ActivityMonth
ORDER BY CohortMonth, ActivityMonth;