-- Audit for duplicates and missing data
WITH total_rows AS (
  SELECT COUNT(*) AS total_rows
  FROM `healthanalytics-project.healthcare_capstone.Provider_Service_2019_2023`
),

duplicates AS (
  SELECT COUNT(*) AS total_duplicate_rows
  FROM (
    SELECT
      year,
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
      Avg_Mdcr_Pymt_Amt,
      COUNT(*) AS cnt
    FROM `healthanalytics-project.healthcare_capstone.Provider_Service_2019_2023`
    GROUP BY
      year,
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
    HAVING COUNT(*) > 1
  )
),

missing_data AS (
  SELECT
    COUNTIF(year IS NULL) AS year_missing,
    COUNTIF(Rndrng_Prvdr_CCN IS NULL) AS CCN_missing,
    COUNTIF(Rndrng_Prvdr_Org_Name IS NULL) AS org_name_missing,
    COUNTIF(Rndrng_Prvdr_City IS NULL) AS city_missing,
    COUNTIF(Rndrng_Prvdr_St IS NULL) AS state_missing,
    COUNTIF(Rndrng_Prvdr_State_FIPS IS NULL) AS state_fips_missing,
    COUNTIF(Rndrng_Prvdr_Zip5 IS NULL) AS zip_missing,
    COUNTIF(Rndrng_Prvdr_State_Abrvtn IS NULL) AS state_abbrev_missing,
    COUNTIF(Rndrng_Prvdr_RUCA IS NULL) AS ruca_missing,
    COUNTIF(Rndrng_Prvdr_RUCA_Desc IS NULL) AS ruca_desc_missing,
    COUNTIF(DRG_Cd IS NULL) AS drg_code_missing,
    COUNTIF(DRG_Desc IS NULL) AS drg_desc_missing,
    COUNTIF(Tot_Dschrgs IS NULL OR Tot_Dschrgs = 0) AS tot_dschrgs_missing,
    COUNTIF(Avg_Submtd_Cvrd_Chrg IS NULL OR Avg_Submtd_Cvrd_Chrg = 0) AS avg_sub_chrg_missing,
    COUNTIF(Avg_Tot_Pymt_Amt IS NULL OR Avg_Tot_Pymt_Amt = 0) AS avg_tot_pymt_missing,
    COUNTIF(Avg_Mdcr_Pymt_Amt IS NULL OR Avg_Mdcr_Pymt_Amt = 0) AS avg_mdcr_pymt_missing
  FROM `healthanalytics-project.healthcare_capstone.Provider_Service_2019_2023`
)

SELECT
  t.total_rows,
  d.total_duplicate_rows,
  m.*
FROM total_rows t, duplicates d, missing_data m;
