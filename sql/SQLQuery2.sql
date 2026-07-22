SELECT COUNT(*) AS Countries
FROM warehouse.DimCountry;

SELECT COUNT(*) AS Years
FROM warehouse.DimDate;

SELECT COUNT(*) AS Demographics
FROM warehouse.DimDemographic;

SELECT COUNT(*) AS Facts
FROM warehouse.FactFinancialIndicators;

SELECT CountryID, COUNT(*)
FROM warehouse.DimCountry
GROUP BY CountryID
HAVING COUNT(*) > 1;

SELECT YearID, COUNT(*)
FROM warehouse.DimDate
GROUP BY YearID
HAVING COUNT(*) > 1;

SELECT GroupID, COUNT(*)
FROM warehouse.DimDemographic
GROUP BY GroupID
HAVING COUNT(*) > 1;

SELECT COUNT(*)
FROM warehouse.FactFinancialIndicators
WHERE CountryID IS NULL;

SELECT COUNT(*)
FROM warehouse.FactFinancialIndicators
WHERE YearID IS NULL;

SELECT COUNT(*)
FROM warehouse.FactFinancialIndicators
WHERE GroupID IS NULL;

ALTER TABLE warehouse.DimCountry
ADD CONSTRAINT PK_DimCountry
PRIMARY KEY (CountryID);

ALTER TABLE warehouse.DimDate
ADD CONSTRAINT PK_DimDate
PRIMARY KEY (YearID);

ALTER TABLE warehouse.DimDemographic
ADD CONSTRAINT PK_DimDemographic
PRIMARY KEY (GroupID);

ALTER TABLE warehouse.FactFinancialIndicators
ADD FactID INT IDENTITY(1,1);

ALTER TABLE warehouse.FactFinancialIndicators
ADD CONSTRAINT PK_FactFinancialIndicators
PRIMARY KEY (FactID);

SELECT
    COLUMN_NAME,
    DATA_TYPE,
    CHARACTER_MAXIMUM_LENGTH,
    NUMERIC_PRECISION,
    NUMERIC_SCALE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'warehouse'
  AND TABLE_NAME = 'DimCountry'
  AND COLUMN_NAME = 'CountryID';

SELECT
    COLUMN_NAME,
    DATA_TYPE,
    CHARACTER_MAXIMUM_LENGTH,
    NUMERIC_PRECISION,
    NUMERIC_SCALE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'warehouse'
  AND TABLE_NAME = 'FactFinancialIndicators'
  AND COLUMN_NAME = 'CountryID';

SELECT
    MIN(CountryID) AS MinID,
    MAX(CountryID) AS MaxID
FROM warehouse.FactFinancialIndicators;

ALTER TABLE warehouse.FactFinancialIndicators
ALTER COLUMN CountryID INT NOT NULL;

ALTER TABLE warehouse.FactFinancialIndicators
ADD CONSTRAINT FK_Fact_Country
FOREIGN KEY (CountryID)
REFERENCES warehouse.DimCountry(CountryID);

SELECT COLUMN_NAME, DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'warehouse'
  AND TABLE_NAME = 'DimDate'
  AND COLUMN_NAME = 'YearID';

SELECT COLUMN_NAME, DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'warehouse'
  AND TABLE_NAME = 'FactFinancialIndicators'
  AND COLUMN_NAME = 'YearID';

SELECT COLUMN_NAME, DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'warehouse'
  AND TABLE_NAME = 'DimDemographic'
  AND COLUMN_NAME = 'GroupID';

SELECT COLUMN_NAME, DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'warehouse'
  AND TABLE_NAME = 'FactFinancialIndicators'
  AND COLUMN_NAME = 'GroupID';