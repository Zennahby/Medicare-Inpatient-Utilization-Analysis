--- IQR Outlier Check
WITH stats AS (
  SELECT
    DRG_Cd,
    APPROX_QUANTILES(Avg_Submtd_Cvrd_Chrg, 4)[OFFSET(1)] AS q1_charge,
    APPROX_QUANTILES(Avg_Submtd_Cvrd_Chrg, 4)[OFFSET(3)] AS q3_charge,
    APPROX_QUANTILES(Avg_Tot_Pymt_Amt, 4)[OFFSET(1)] AS q1_payment,
    APPROX_QUANTILES(Avg_Tot_Pymt_Amt, 4)[OFFSET(3)] AS q3_payment
  FROM `healthanalytics-project.healthcare_capstone.Provider_Service_2019_2023`
  GROUP BY DRG_Cd
),

iqr_bounds AS (
  SELECT
    DRG_Cd,
    q1_charge,
    q3_charge,
    (q3_charge - q1_charge) AS iqr_charge,
    q1_payment,
    q3_payment,
    (q3_payment - q1_payment) AS iqr_payment
  FROM stats
)

SELECT
  p.year,
  p.Rndrng_Prvdr_CCN,
  p.DRG_Cd,
  p.Avg_Submtd_Cvrd_Chrg,
  p.Avg_Tot_Pymt_Amt,
  'IQR_OUTLIER' AS outlier_flag
FROM `healthanalytics-project.healthcare_capstone.Provider_Service_2019_2023` p
JOIN iqr_bounds b
  ON p.DRG_Cd = b.DRG_Cd
WHERE
  p.Avg_Submtd_Cvrd_Chrg > b.q3_charge + 1.5 * b.iqr_charge
  OR p.Avg_Submtd_Cvrd_Chrg < b.q1_charge - 1.5 * b.iqr_charge
  OR p.Avg_Tot_Pymt_Amt > b.q3_payment + 1.5 * b.iqr_payment
  OR p.Avg_Tot_Pymt_Amt < b.q1_payment - 1.5 * b.iqr_payment
ORDER BY
  Avg_Submtd_Cvrd_Chrg DESC
LIMIT 200;




WITH drg_stats AS (
  SELECT
    DRG_Cd,
    DRG_Desc,
    APPROX_QUANTILES(Avg_Mdcr_Pymt_Amt, 4)[OFFSET(1)] AS Q1,
    APPROX_QUANTILES(Avg_Mdcr_Pymt_Amt, 4)[OFFSET(3)] AS Q3
  FROM `healthanalytics-project.healthcare_capstone.Provider_Service_2019_2023`
  WHERE Avg_Mdcr_Pymt_Amt IS NOT NULL
  GROUP BY DRG_Cd, DRG_Desc
),

bounds AS (
  SELECT
    DRG_Cd,
    DRG_Desc,
    Q1,
    Q3,
    (Q3 - Q1) AS IQR,
    Q1 - 1.5 * (Q3 - Q1) AS lower_bound,
    Q3 + 1.5 * (Q3 - Q1) AS upper_bound
  FROM drg_stats
)

SELECT
  p.year,
  p.Rndrng_Prvdr_CCN,
  p.Rndrng_Prvdr_Org_Name,
  p.DRG_Cd,
  b.DRG_Desc,
  p.Avg_Mdcr_Pymt_Amt,
  b.lower_bound,
  b.upper_bound,
  CASE
    WHEN p.Avg_Mdcr_Pymt_Amt < b.lower_bound THEN 'LOW OUTLIER'
    WHEN p.Avg_Mdcr_Pymt_Amt > b.upper_bound THEN 'HIGH OUTLIER'
  END AS outlier_flag
FROM `healthanalytics-project.healthcare_capstone.Provider_Service_2019_2023` p
JOIN bounds b
  ON p.DRG_Cd = b.DRG_Cd
WHERE
  p.Avg_Mdcr_Pymt_Amt < b.lower_bound
  OR p.Avg_Mdcr_Pymt_Amt > b.upper_bound
ORDER BY
  outlier_flag DESC,
  p.Avg_Mdcr_Pymt_Amt DESC;




--- Z-Score Outlier Check
WITH drg_stats AS (
  SELECT
    DRG_Cd,
    DRG_Desc,
    AVG(Avg_Mdcr_Pymt_Amt) AS mean_payment,
    STDDEV_POP(Avg_Mdcr_Pymt_Amt) AS stddev_payment
  FROM `healthanalytics-project.healthcare_capstone.Provider_Service_2019_2023`
  WHERE Avg_Mdcr_Pymt_Amt IS NOT NULL
  GROUP BY DRG_Cd, DRG_Desc
),

z_scores AS (
  SELECT
    p.year,
    p.Rndrng_Prvdr_CCN,
    p.Rndrng_Prvdr_Org_Name,
    p.DRG_Cd,
    s.DRG_Desc,
    p.Avg_Mdcr_Pymt_Amt,
    s.mean_payment,
    s.stddev_payment,
    SAFE_DIVIDE(
      p.Avg_Mdcr_Pymt_Amt - s.mean_payment,
      s.stddev_payment
    ) AS z_score
  FROM `healthanalytics-project.healthcare_capstone.Provider_Service_2019_2023` p
  JOIN drg_stats s
    ON p.DRG_Cd = s.DRG_Cd
)

SELECT
  year,
  Rndrng_Prvdr_CCN,
  Rndrng_Prvdr_Org_Name,
  DRG_Cd,
  DRG_Desc,
  Avg_Mdcr_Pymt_Amt,
  ROUND(z_score, 2) AS z_score,
  CASE
    WHEN z_score >= 3 THEN 'HIGH OUTLIER'
    WHEN z_score <= -3 THEN 'LOW OUTLIER'
  END AS outlier_flag
FROM z_scores
WHERE ABS(z_score) >= 3
ORDER BY ABS(z_score) DESC;
