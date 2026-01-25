CREATE OR REPLACE TABLE
  `healthanalytics-project.healthcare_capstone.Provider_Service_2019_2023` AS

SELECT
  2019 AS year,
  Rndrng_Prvdr_CCN,
  Rndrng_Prvdr_Org_Name,
  Rndrng_Prvdr_City,
  Rndrng_Prvdr_St,
  Rndrng_Prvdr_State_FIPS,
  Rndrng_Prvdr_Zip5,
  Rndrng_Prvdr_State_Abrvtn,
  Rndrng_Prvdr_RUCA,
  Rndrng_Prvdr_RUCA_Desc,
  DRG_Cd,
  DRG_Desc,
  Tot_Dschrgs,
  Avg_Submtd_Cvrd_Chrg,
  Avg_Tot_Pymt_Amt,
  Avg_Mdcr_Pymt_Amt
FROM
  `healthanalytics-project.healthcare_capstone.MUP_IHP_RY23_P03_V10_DY19_ProviderService`

UNION ALL

SELECT
  2020 AS year,
  Rndrng_Prvdr_CCN,
  Rndrng_Prvdr_Org_Name,
  Rndrng_Prvdr_City,
  Rndrng_Prvdr_St,
  Rndrng_Prvdr_State_FIPS,
  Rndrng_Prvdr_Zip5,
  Rndrng_Prvdr_State_Abrvtn,
  Rndrng_Prvdr_RUCA,
  Rndrng_Prvdr_RUCA_Desc,
  DRG_Cd,
  DRG_Desc,
  Tot_Dschrgs,
  Avg_Submtd_Cvrd_Chrg,
  Avg_Tot_Pymt_Amt,
  Avg_Mdcr_Pymt_Amt
FROM
  `healthanalytics-project.healthcare_capstone.MUP_IHP_RY23_P03_V10_DY20_ProviderService`

UNION ALL

SELECT
  2021 AS year,
  Rndrng_Prvdr_CCN,
  Rndrng_Prvdr_Org_Name,
  Rndrng_Prvdr_City,
  Rndrng_Prvdr_St,
  Rndrng_Prvdr_State_FIPS,
  Rndrng_Prvdr_Zip5,
  Rndrng_Prvdr_State_Abrvtn,
  Rndrng_Prvdr_RUCA,
  Rndrng_Prvdr_RUCA_Desc,
  DRG_Cd,
  DRG_Desc,
  Tot_Dschrgs,
  Avg_Submtd_Cvrd_Chrg,
  Avg_Tot_Pymt_Amt,
  Avg_Mdcr_Pymt_Amt
FROM
  `healthanalytics-project.healthcare_capstone.MUP_IHP_RY23_P03_V10_DY21_ProviderService`

UNION ALL

SELECT
  2022 AS year,
  Rndrng_Prvdr_CCN,
  Rndrng_Prvdr_Org_Name,
  Rndrng_Prvdr_City,
  Rndrng_Prvdr_St,
  Rndrng_Prvdr_State_FIPS,
  Rndrng_Prvdr_Zip5,
  Rndrng_Prvdr_State_Abrvtn,
  Rndrng_Prvdr_RUCA,
  Rndrng_Prvdr_RUCA_Desc,
  DRG_Cd,
  DRG_Desc,
  Tot_Dschrgs,
  Avg_Submtd_Cvrd_Chrg,
  Avg_Tot_Pymt_Amt,
  Avg_Mdcr_Pymt_Amt
FROM
  `healthanalytics-project.healthcare_capstone.MUP_IHP_RY23_P03_V10_DY22_ProviderService`

UNION ALL

SELECT
  2023 AS year,
  Rndrng_Prvdr_CCN,
  Rndrng_Prvdr_Org_Name,
  Rndrng_Prvdr_City,
  Rndrng_Prvdr_St,
  Rndrng_Prvdr_State_FIPS,
  Rndrng_Prvdr_Zip5,
  Rndrng_Prvdr_State_Abrvtn,
  Rndrng_Prvdr_RUCA,
  Rndrng_Prvdr_RUCA_Desc,
  DRG_Cd,
  DRG_Desc,
  Tot_Dschrgs,
  Avg_Submtd_Cvrd_Chrg,
  Avg_Tot_Pymt_Amt,
  Avg_Mdcr_Pymt_Amt
FROM
  `healthanalytics-project.healthcare_capstone.MUP_IHP_RY23_P03_V10_DY23_ProviderService`;
