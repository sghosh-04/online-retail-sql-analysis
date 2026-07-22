SELECT COLUMN_NAME
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA='warehouse'
AND TABLE_NAME='FactFinancialIndicators'
ORDER BY ORDINAL_POSITION;

SELECT COLUMN_NAME
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'warehouse'
  AND TABLE_NAME = 'DimCountry';

SELECT COLUMN_NAME
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'warehouse'
  AND TABLE_NAME = 'DimDate';

SELECT COLUMN_NAME
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'warehouse'
  AND TABLE_NAME = 'DimDemographic';

CREATE OR ALTER VIEW reporting.vw_Base AS
SELECT
    f.FactID,

    c.CountryID,
    c.countrynewwb,
    c.codewb,
    c.regionwb24_hi,
    c.incomegroupwb24,

    d.YearID,
    d.[year],

    g.GroupID,
    g.[group],
    g.group2,

    f.account_t_d,
    f.fiaccount_t_d,
    f.mobileaccount_t_d,
    f.borrow_any_t_d,
    f.save_any_t_d,
    f.inactive_t_d,
    f.dig_acc,
    f.merchant_pay,
    f.internet

FROM warehouse.FactFinancialIndicators f
INNER JOIN warehouse.DimCountry c
    ON f.CountryID = c.CountryID
INNER JOIN warehouse.DimDate d
    ON f.YearID = d.YearID
INNER JOIN warehouse.DimDemographic g
    ON f.GroupID = g.GroupID;

SELECT TOP 10 *
FROM reporting.vw_Base;

CREATE OR ALTER VIEW reporting.vw_FinancialInclusion AS
SELECT
    c.countrynewwb AS Country,
    c.regionwb24_hi AS Region,
    c.incomegroupwb24 AS IncomeGroup,

    d.[year],

    g.[group],
    g.group2,

    f.account_t_d,
    f.fiaccount_t_d,
    f.mobileaccount_t_d,
    f.save_any_t_d,
    f.borrow_any_t_d,
    f.inactive_t_d

FROM warehouse.FactFinancialIndicators f
JOIN warehouse.DimCountry c
    ON f.CountryID = c.CountryID
JOIN warehouse.DimDate d
    ON f.YearID = d.YearID
JOIN warehouse.DimDemographic g
    ON f.GroupID = g.GroupID;

CREATE OR ALTER VIEW reporting.vw_DigitalFinance AS
SELECT
    c.countrynewwb AS Country,
    d.[year],
    g.[group],
    g.group2,

    f.mobileaccount_t_d,
    f.dig_acc,
    f.fing2p_acc,
    f.fing2p_card,
    f.fing2p_cash,
    f.fing2p_fin,
    f.fing2p_mob,
    f.g20_any,
    f.g20_made,
    f.g20_received,
    f.merchant_pay

FROM warehouse.FactFinancialIndicators f
JOIN warehouse.DimCountry c
    ON f.CountryID = c.CountryID
JOIN warehouse.DimDate d
    ON f.YearID = d.YearID
JOIN warehouse.DimDemographic g
    ON f.GroupID = g.GroupID;

CREATE OR ALTER VIEW reporting.vw_SavingsBorrowing AS
SELECT
    c.countrynewwb AS Country,
    d.[year],
    g.[group],
    g.group2,

    f.save_any_t_d,
    f.borrow_any_t_d,
    f.fin24sav,
    f.fin24bor,
    f.fin24fam,
    f.fin24work,
    f.fin24sell,
    f.fin24other

FROM warehouse.FactFinancialIndicators f
JOIN warehouse.DimCountry c
    ON f.CountryID = c.CountryID
JOIN warehouse.DimDate d
    ON f.YearID = d.YearID
JOIN warehouse.DimDemographic g
    ON f.GroupID = g.GroupID;

