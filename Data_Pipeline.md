# **Data Pipeline**

## **Purpose**

This document describes the end-to-end process used to transform raw Medicare inpatient datasets into analysis-ready tables for DRG-, provider-, and state-level analysis.
The objective is to provide **transparency, reproducibility, and execution-level clarity** around how data were sourced, processed, and visualized.

---

## **1. Data Ingestion**

### **Primary Data Source — CMS IPPS Inpatient Files**

* Dataset: *CMS Medicare Inpatient Hospitals – by Provider and Service*
* Years: **2019, 2020, 2021, 2022, 2023**

The annual CMS IPPS inpatient files were downloaded directly from the CMS website in their published format.

The raw files were seperately uploaded into *Google BigQuery* without pre-aggregation or transformation to serve as the central analytical storage layer.

**Supporting Data Sources**
### A. CMS IPPS Final Rule — DRG Weights & GMLOS
* Data used:
   * Geometric Mean Length of Stay (GMLOS) values were joined to the inpatient dataset to support expected Bed Days calculations.
### B. U.S. State Population Data
* State population figures were extracted from a public reference source, curated in Microsoft Excel, and uploaded into Power BI as a standalone reference table. This data was used only for per-capita normalization in state-level analysis. It was not used for demographic, outcome, or policy inference.

### Semantic Model

The analytical model was implemented in Power BI using a central fact table
(CMS IPPS inpatient data) with supporting dimension tables for DRG weights
and state population. Relationships were defined on DRG code and state code
to enable consistent metric evaluation across DRG, provider, and state levels.

 ![PowerBI_Model_Relationships](<../VISUALIZATIONS/PowerBI_Model_Relationships.png>)
 


---

## **2. Data Standardization**

Before consolidating the five annual CMS IPPS inpatient datasets (2019–2023), structural consistency was verified across all files.

* Column names were identical across all years.
* Data types were consistent across datasets. 
* DRG codes and provider identifiers followed the same CMS formatting standards.

Because the datasets shared a consistent schema, no column renaming, data-type normalization, or identifier alignment was required.

---

## **3. Data Validation & Quality Checks**

Basic but essential data quality checks were performed:

 **Duplicates and missing data checks**
Checked for duplicates and missing data to make sure the Year/Provider/DRG combination was counted only once and the data complete. 

* No duplicates were found. 
 ![Duplicate Check](<../VISUALIZATIONS/Duplicate_Check.png>)

* 681 missing values was found in RUCA and Ruca Description  ![681 missing values was found in RUCA and Ruca Description](<../VISUALIZATIONS/Duplicate_Missing_Data_Check.png>)

- The ratio of the missing RUCA Data is 0.09% and the RUCA columns are not key identifiers in the dataset, this was ignored and analysis moved forward.

Outlier detection using both IQR and DRG-normalized Z-score methods identified a predominance of high outliers. 

**IQR Outlier Check**
![Outlier Check sql](<../VISUALIZATIONS/IQR_OUtlier_Checks.png>) 
Although a high proportion of observations were flagged as upper-tail outliers, these values were retained in the final dataset. In DRG-based reimbursement, extreme values often reflect legitimate clinical severity, resource intensity, and Medicare pricing design rather than data quality issues. Excluding these observations would risk biasing severity-sensitive metrics and materially understating true payment concentration across high-complexity DRGs.

the sql queries are in the sql f0lder
[IQR Outlier Check](<RESULTS/IQR OUTLIER CHECK.csv>)

[Z-Score Outlier Check](<RESULTS/Z-SCORE OUTLIER CHECK.csv>)

---

## **4. Metric Construction**

* **Expected Bed Days** was calculated using discharge counts and GMLOS
* **Average Medicare Payment per Discharge** was calculated by normalizing total payments by total discharges
* **Expected Bed Days per 1,000 Residents** was calculated using state population normalization

All metric formulas and interpretation guidance are documented in [Metric Definitions.md](ANALYSIS/../Metric_Data_Definitions.md).

---

## **5. Data Preparation for Analysis**

The five annual CMS IPPS inpatient datasets (2019–2023) were combined into a single consolidated table to support multi-year analysis.

* All five years were unioned using the verified consistent schema.
* A Year field was added to preserve temporal context.
* No pre-aggregated summary tables were created upstream.
* The consolidated dataset was exported and loaded into Power BI as the primary analytical table.

This approach preserved row-level detail while allowing aggregation to be performed dynamically during analysis.

## **6. Analytical Modeling in Power BI**

Analytical modeling was performed within Power BI rather than through upstream data modeling.


- The consolidated CMS inpatient table served as the primary analytical table
- Supporting reference tables (GMLOS and state population) were loaded separately
- Relationships were created using DRG code (for GMLOS) and state code (for population)
- All analytical metrics, including:
Expected Bed Days, Expected Bed Days per 1,000 Residents and Average Medicare Payment per Discharge were created as DAX measures within Power BI.

This modeling approach allowed metrics to be evaluated consistently across DRG, provider, and state views without duplicating data.

## **7. Visualization and Aggregation**

- Power BI was used as both the semantic layer and the visualization layer for this project.
- Aggregation was done dynamically through Power BI visuals and DAX measures
- Metrics were evaluated at different analytical levels based on visual context
- No additional aggregation tables was prepared outside Power BI

This ensured that:
- All insights were derived from a single consolidated dataset
- Metric definitions remained consistent across visuals
- Analytical logic was centralized and transparent
---

## **8. Scope Controls**

To maintain analytical clarity:

* No missing-value imputation was performed
* No outlier trimming or winsorization was applied
* No predictive modeling or feature engineering was conducted
* No quality or outcome measures were inferred

All observed variation reflects the underlying CMS source data.

---

## **Pipeline Summary**

This pipeline documents the **full execution path** from raw CMS downloads through Excel-based enrichment, BigQuery-based transformation, and Power BI-based visualization was designed to preserve data integrity while enabling scalable, multi-level analysis.

---

## **Implementation Note**

SQL scripts supporting each pipeline stage will be linked in a dedicated `/SQL` directory once finalized and organized.

---
## SQL Implementation Reference

All data preparation and analytical queries used in this project are documented in the `/SQL` directory.
---