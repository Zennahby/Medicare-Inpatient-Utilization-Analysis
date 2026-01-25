# **Analytical Methodology**

## **Purpose**

This document explains **how the analysis was conducted**, the assumptions applied, and the scope boundaries intentionally set.
The goal is to ensure transparency, reproducibility, and correct interpretation of findings across DRG, Provider, and State levels.


---

## **Data Source**
1. [Medicare Inpatient Hospitals - by Provider and Service .zip](https://data.cms.gov/provider-summary-by-type-of-service/medicare-inpatient-hospitals/medicare-inpatient-hospitals-by-provider-and-service)

 **Datasets:**
-  MUP_IHP_RY23_P03_V10_DY19_PRVSV 
-  MUP_IHP_RY23_P03_V10_DY20_PRVSV
-  MUP_IHP_RY23_P03_V10_DY21_PRVSV
-  MUP_IHP_RY23_P03_V10_DY22_PRVSV
- MUP_IHP_RY23_P03_V10_DY23_PRVSV

These datasets contain inpatient discharge, payment, and DRG-level utilization data aggregated by provider and service.
They were selected because they provide a standardized, national view of Medicare inpatient utilization and payment patterns across hospitals, services, and states.

2.  [[Table5 (Final Rule and Correction Notice) ZIP](https://www.cms.gov/files/zip/fy-2025-ipps-final-rule-table-5.zip)]
**Datasets:**
- FY25 Grouper 41 DRG Weights & Geometric Mean Length of Stay.

3. https://en.wikipedia.org/wiki/List_of_U.S._states_and_territories_by_population
- List of U.S. states and territories by population.

State population figures were used **solely for per-capita normalization** in state-level analysis and **not** for demographic or policy inference.


## **Time Period**

* **Years covered:** 2019–2023

Multiple years were analyzed together to:

* Reduce volatility from year-specific anomalies
* Reflect stable inpatient utilization patterns
* Emphasize **structural trends** rather than short-term shocks
---

## **Core Metrics (Methodological Role)**

The analysis focused on decision-relevant composite metrics rather than raw activity counts.

### **Expected Bed Days**

Used as the primary indicator of **inpatient capacity consumption**, combining discharge volume and length of stay to reflect true bed utilization beyond raw counts.

### **Expected Bed Days per 1,000 Residents (State Level)**

Used to normalize inpatient capacity pressure by population, enabling fair comparison across states of different sizes.

### **Average Medicare Payment per Discharge**

Used to isolate **cost intensity per hospitalization**, removing utilization volume effects and highlighting structural cost drivers.

> *Formal definitions and formulas for all metrics are documented separately in `Metric_Definitions.md`.*

---
## **Aggregation Logic**

* **DRG Level:**
    Metrics were aggregated across all providers and years to identify utilization concentration, inpatient bed intensity, and financial exposure by service category.

* **Provider Level**
  All DRGs and years were aggregated per provider to represent each hospital’s full inpatient footprint and operational risk profile.

* **State Level**
  Provider-level metrics were rolled up to the state level and normalized by population where appropriate.

No additional DRG-level case-mix adjustment was applied beyond GMLOS, as the analysis focuses on **utilization and capacity risk**, not clinical outcome comparison.
---

## **Key Assumptions**

* Medicare inpatient claims are a reliable proxy for system-wide inpatient utilization patterns
* GMLOS adequately represents average inpatient stay duration for capacity estimation
* Population-normalized metrics better indicate structural pressure than raw volume
* Higher payment per discharge reflects structural cost factors and case mix, not inefficiency by default

These assumptions are standard in health services utilization and payment analysis.
---

## **What Was Intentionally Not Done**

To preserve analytical clarity and avoid overinterpretation:

* No predictive modeling or forecasting was performed
* No quality or outcome measures were inferred from cost or utilization
* No all-payer extrapolation was attempted beyond Medicare
* No causal relationships were inferred between utilization and spending
* No provider or state rankings were framed as performance or quality scores

The analysis focuses strictly on **risk concentration and structural patterns**, not performance grading.

---

## **Interpretation Guide**

* High utilization does not imply inefficiency by default
* Low payment per discharge does not imply higher quality
* Capacity pressure and cost intensity are treated as **separate risks**
* Findings are intended to guide **targeted intervention**, not uniform cost reduction

---
## **Methodological Summary**
Applying consistent metrics, clear aggregation logic, and explicit scope boundaries, this analytical methodology ensures that conclusions drawn at the DRG, provider, and state levels are comparable, defensible, and decision-relevant.
---