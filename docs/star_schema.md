                     +----------------+
                     |   DimCountry   |
                     +----------------+
                     | CountryID (PK) |
                     | CountryName    |
                     | CountryCode    |
                     | Region         |
                     | IncomeGroup    |
                     +--------+-------+
                              |
                              |
                              |
+-------------+      +--------v-----------------------+      +------------------+
|   DimDate   |      | FactFinancialIndicators        |      | DimDemographic   |
+-------------+      +--------------------------------+      +------------------+
| YearID (PK) |      | FactID (PK)                    |      | GroupID (PK)     |
| Year        |      | CountryID (FK)                 |      | Group            |
+-------------+      | YearID (FK)                    |      | Group2           |
                     | GroupID (FK)                   |      +------------------+
                     | AccountOwnership               |
                     | FIAccountOwnership             |
                     | MobileAccountOwnership         |
                     | BorrowingRate                  |
                     | SavingsRate                    |
                     | DigitalAccountUsage            |
                     | ...                            |
                     +--------------------------------+