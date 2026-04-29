# 🛒 Online Retail Analytics Dashboard (SQL + Power BI)

## 📌 Overview

This project analyzes an e-commerce dataset using **SQL Server and Power BI** to uncover business insights related to revenue, customer behavior, product performance, and cancellations.

It follows a **data engineering + analytics pipeline approach**:

* Raw data ingestion (staging layer)
* Data cleaning & transformation (fact table)
* Analytical modules (SQL)
* Interactive dashboard (Power BI)

---

## 🏗️ Architecture

```
CSV Dataset → SQL Server (Staging) → Fact Table → Analytical Queries → Power BI Dashboard
```

---

## ⚙️ Tech Stack

* **SQL Server (SSMS)** – Data ingestion, cleaning, transformations
* **SQL (T-SQL)** – Analysis (CTEs, window functions, aggregations)
* **Power BI** – Data visualization & dashboard
* **GitHub** – Version control & portfolio

---

## 🧱 Data Pipeline

### 🔹 1. Staging Layer

* Raw CSV ingested without enforcing strict data types
* All fields initially stored as `NVARCHAR` to prevent data loss

### 🔹 2. Data Cleaning

* Used `TRY_CAST` and `TRY_CONVERT` for safe transformation
* Handled:

  * Missing CustomerIDs
  * Invalid numeric values
  * Date parsing issues

### 🔹 3. Fact Table

Created `fact_sales` with:

* Cleaned data types
* Derived fields:

  * `Revenue = Quantity * UnitPrice`
  * `IsCancellation` flag (InvoiceNo starting with 'C')

---

## 📊 Analytical Modules

### 🔥 Module 01 — Revenue Analysis

* Monthly revenue trends
* Top countries by revenue
* Key insight: **UK dominates revenue contribution**

---

### 👥 Module 02 — Customer Analysis

* Top customers by revenue
* Order frequency & average order value
* Segmentation (High / Medium / Low value)

---

### 🛍️ Module 03 — Product Analysis

* Top products by revenue and quantity
* Purchase frequency analysis
* Insight: **High-volume ≠ high-revenue products**

---

### 🧠 Module 04 — RFM Analysis (Core Module)

* Recency, Frequency, Monetary calculation
* NTILE(5) segmentation
* Customer categories:

  * Champions
  * Loyal Customers
  * At Risk
  * Others

👉 Key insight:

> A small percentage of customers contributes the majority of revenue.

---

### 📅 Module 05 — Time & Cohort Analysis

* Monthly active customers
* Cohort-based retention tracking
* Insight: **Customer retention declines over time**

---

### ⚠️ Module 06 — Cancellation Analysis (Unique Feature)

* Cancellation rate calculation
* High-risk customer identification
* Revenue loss due to cancellations

👉 Key insight:

> Certain customers show unusually high cancellation behavior, indicating potential operational or behavioral issues.

---

## 📈 Power BI Dashboard

### 🔹 Page 1 — Overview

* KPIs: Revenue, Orders, Customers, Return Rate
* Revenue trend over time
* Top countries

### 🔹 Page 2 — Customer Insights (RFM)

* Customer segmentation (Donut chart)
* Revenue contribution by segment
* Customer behavior analysis

---

## 💡 Key Business Insights

* 🇬🇧 UK contributes the majority of revenue → **market concentration risk**
* 🏆 Top customers drive disproportionate revenue → **focus on retention**
* 📦 Some products sell frequently but generate low revenue → **pricing optimization opportunity**
* ⚠️ High cancellation customers → **potential fraud or dissatisfaction**
* 📉 Customer retention decreases over time → **need engagement strategies**

---

## 🧠 What This Project Demonstrates

* Data engineering fundamentals (staging → fact modeling)
* SQL proficiency (CTEs, window functions, aggregations)
* Business-oriented analysis
* Data visualization & storytelling
* End-to-end analytics pipeline design

---

## 🚀 How to Run

1. Import dataset into SQL Server
2. Create staging table
3. Build `fact_sales` table
4. Run analytical SQL modules
5. Connect Power BI to SQL Server
6. Build dashboard using `fact_sales` and `rfm_table`

---

## 📂 Repository Structure

```
   module1.sql
   module2.sql
   module3.sql
   module4.sql
   module5.sql
   module6.sql
   dashboard.pbix

README.md
```

---

## 🎯 Future Improvements

* Add real-time data pipeline (ETL automation)
* Deploy dashboard to Power BI Service
* Add predictive modeling (customer churn / demand forecasting)

---

## 🙌 Author

Built as an end-to-end analytics project demonstrating SQL + BI skills for real-world business insights.
