
-- Step 1: Base RFM metrics per customer
WITH rfm_base AS (
    SELECT 
        CustomerID,
        MAX(InvoiceDate) AS LastPurchaseDate,
        COUNT(DISTINCT InvoiceNo) AS Frequency,
        SUM(Revenue) AS Monetary
    FROM fact_sales
    WHERE 
        IsCancellation = 0
        AND CustomerID IS NOT NULL
    GROUP BY CustomerID
),

-- Step 2: Calculate Recency
rfm_calc AS (
    SELECT 
        CustomerID,
        DATEDIFF(DAY, LastPurchaseDate, (SELECT MAX(InvoiceDate) FROM fact_sales)) AS Recency,
        Frequency,
        Monetary
    FROM rfm_base
),

-- Step 3: Assign R, F, M scores using NTILE
rfm_scores AS (
    SELECT 
        CustomerID,
        Recency,
        Frequency,
        Monetary,

        NTILE(5) OVER (ORDER BY Recency DESC) AS R_Score,
        NTILE(5) OVER (ORDER BY Frequency ASC) AS F_Score,
        NTILE(5) OVER (ORDER BY Monetary ASC) AS M_Score

    FROM rfm_calc
)

-- Step 4: Final segmentation
SELECT 
    CustomerID,
    Recency,
    Frequency,
    Monetary,
    R_Score,
    F_Score,
    M_Score,

    CASE 
        WHEN R_Score >= 4 AND F_Score >= 4 AND M_Score >= 4 THEN 'Champions'
        WHEN R_Score >= 3 AND F_Score >= 3 THEN 'Loyal Customers'
        WHEN R_Score >= 4 AND F_Score <= 2 THEN 'Potential Loyalists'
        WHEN R_Score <= 2 AND F_Score >= 3 THEN 'At Risk'
        ELSE 'Others'
    END AS CustomerSegment

FROM rfm_scores
ORDER BY Monetary DESC;