# 🌍 Global Financial Inclusion Analytics Dashboard

An end-to-end Business Intelligence solution built using **SQL Server** and **Power BI** to analyze global financial inclusion trends using the **World Bank Global Findex Database**.

The project transforms raw survey data into a dimensional data warehouse and interactive executive dashboards, enabling analysis of banking access, digital finance adoption, savings behavior, borrowing patterns, and demographic disparities across countries and years.

---

## 📌 Project Overview

Financial inclusion is a key driver of economic growth and sustainable development. Despite significant progress, millions of adults worldwide still lack access to formal financial services.

This project provides an analytical platform to answer questions such as:

- How has financial inclusion evolved over time?
- Which countries and regions have the highest account ownership?
- How does digital finance vary across income groups?
- Which demographic groups remain underserved?
- How do savings and borrowing behaviors differ globally?

The solution follows a complete Business Intelligence workflow from raw data to executive dashboards.

---

### Database Summary

| Metric | Value |
|---------|------:|
| Dataset | World Bank Global Findex Database |
| Total Records | **8,577** |
| Total Features | **438** |
| Memory Usage | **28.7 MB** |
| Numeric Features | **432** (431 Float64, 1 Int64) |
| Categorical Features | **6** |
| File Format | CSV |

```

# 🏗️ Architecture

```
                World Bank Global Findex Dataset
                            │
                            ▼
                    Data Cleaning & Transformation
                            │
                            ▼
                 SQL Server Data Warehouse
        ┌─────────────────────────────────────┐
        │ Dimension Tables                    │
        │ • DimCountry                        │
        │ • DimDate                           │
        │ • DimDemographic                    │
        └─────────────────────────────────────┘
                    │
                    ▼
              FactFinancialIndicators
                    │
                    ▼
             Reporting SQL Views
                    │
                    ▼
                  Power BI
                    │
                    ▼
          Interactive Executive Dashboards
```

---

# 📂 Project Structure

```
Financial-Inclusion-Analytics/
│
├── data/
│   └── processed/
│    │── DimCountry.csv
│    ├── DimDate.csv
│    ├── DimDemographic.csv
│    └── FactFinancialIndicators.csv
│   └── raw/
│    └── Global_Findex.csv
|
|── docs/
│   └── business_requirements.md
│   └── star_schema.md
│
├── SQL/
│   ├── database_creation.sql
│   ├── load_data.sql
│   ├── reporting_views.sql
|
│── python/
│   ├── data_profiling.ipynb
│   ├── etl.ipynb
|   |── load_server.ipynb
│
├── PowerBI/
│   ├── EnterpriseBI.pbix
│   ├── Financial Dashboard.pbix
│
|── reports/
│   ├── column_summary.csv
│   ├── descriptive_statistics.csv
|   |── missing_summary.csv
|   |── missing_value_report.csv
|
└── README.md

---

# 📊 Dataset

**Source**

World Bank Global Findex Database

The Global Findex is the world's most comprehensive database measuring how adults save, borrow, make payments and manage financial resources.

The dataset contains country-level financial inclusion indicators collected across multiple survey years.

---

# 📈 Dataset Metrics

The dashboard analyzes the following financial inclusion indicators.

## Financial Inclusion

- Account Ownership
- Financial Institution Account
- Mobile Money Account
- Formal Savings
- Informal Savings
- Total Savings
- Formal Borrowing
- Informal Borrowing
- Total Borrowing

---

## Digital Finance

- Digital Account Usage
- Merchant Payments
- Utility Payments
- Government Payments
- Wage Payments
- Digital Purchases
- Internet Usage
- Mobile Phone Ownership

---

## Demographic Dimensions

- Gender
- Age Group
- Education Level
- Income Group
- Labour Force Status
- Rural / Urban Population

---

## Geographic Dimensions

- Country
- Region
- Income Classification

---

## Time Dimension

Survey Years

- 2011
- 2014
- 2017
- 2021

*(Depending on the dataset version.)*

---

# 🗄️ Data Warehouse Design

The warehouse follows a **Star Schema**.

### Fact Table

```
FactFinancialIndicators
```

Contains

- Financial inclusion indicators
- Digital finance indicators
- Savings metrics
- Borrowing metrics
- Payment indicators

---

### Dimension Tables

#### DimCountry

- Country
- Country Code
- Region
- Income Group

#### DimDate

- Year

#### DimDemographic

- Demographic Group
- Demographic Category

---

# 📑 Reporting Layer

SQL reporting views simplify Power BI development.

```
vw_Base
```

Primary reporting view containing

- Country information
- Demographics
- Financial metrics
- Digital finance metrics
- Time dimension

---

# 📊 Power BI Dashboards

## 1️⃣ Executive Overview

Provides a high-level summary of global financial inclusion.

### Includes

- Executive KPI Cards
- Financial Inclusion Trend
- Top Performing Countries
- Regional Comparison
- Income Group Analysis
- Executive Summary
- Interactive Filters

---

## 2️⃣ Digital Finance

Analyzes digital financial adoption worldwide.

### Includes

- Digital Account KPI
- Mobile Account KPI
- Merchant Payments KPI
- Internet Usage KPI
- Digital Adoption Trend
- Regional Comparison
- Income Group Analysis
- Executive Insights

---

## *(Optional Future Pages)*

- Demographic Analysis
- Savings & Borrowing Analysis

---

# 📊 KPIs

The following measures are calculated using DAX.

```
Average Account Ownership
Average Financial Institution Account
Average Mobile Account
Average Digital Account
Average Saved
Average Borrowed
Average Merchant Payments
Average Internet Usage
```

All KPIs are displayed as percentages.

---

# 📌 Interactive Features

- Country Filter
- Region Filter
- Income Group Filter
- Year Filter
- Cross Filtering
- Dynamic Visual Interactions
- Drill-down Analysis

---

# 📈 Business Questions Answered

- Which regions have the highest financial inclusion?
- How has account ownership changed over time?
- Which countries lead in digital finance?
- How does income affect financial inclusion?
- Which demographic groups are financially underserved?
- How are savings and borrowing behaviors changing?

---

# 🛠️ Technology Stack

### Database

- Microsoft SQL Server

### ETL

- SQL

### Data Warehouse

- Star Schema

### Visualization

- Microsoft Power BI

### Data Analysis

- DAX
- Power Query

---

# 🚀 Key Features

- End-to-End BI Pipeline
- SQL Data Warehouse
- Star Schema Modeling
- Reporting Views
- Interactive Dashboards
- Executive KPI Reporting
- Dynamic Filtering
- Cross Visual Analysis
- Business Insight Generation

---

# 📸 Dashboard Preview

> Add screenshots of each Power BI dashboard here.

```
Images/
├── ExecutiveDashboard.png
├── DigitalFinance.png
```

---

# 📚 Data Source

World Bank

Global Findex Database

https://globalfindex.worldbank.org/

---

# 👨‍💻 Author

**Sayuri Ghosh**

B.Tech CSE (AI & ML)

Business Intelligence | Data Analytics | SQL | Power BI