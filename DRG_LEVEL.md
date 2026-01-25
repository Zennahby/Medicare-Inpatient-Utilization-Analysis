# DRG-Level Utilization, Capacity, and Financial Efficiency Analysis

## Overview
This section analyzes utilization, inpatient capacity, and payment efficiency at the Diagnosis-Related Group (DRG) level using CMS Medicare Inpatient Prospective Payment System (IPPS) data.  
The objective is to identify which DRGs drive discharge volume inpatient bed utilization and financial exposure.  The analysis also distinguished scale-driven risk from reimbursement inefficiency.


## Key Analytical Questions
- Which DRGs account for the majority of inpatient discharges?
- Which DRGs consume the most inpatient bed capacity?
- Is financial risk driven by reimbursement inefficiency or by utilization scale and intensity?

---

## 1. Discharge Volume (Pareto Analysis)

A Pareto analysis of the DRG total discharges revealed that inpatient utilization is highly concentrated. That is a small subset of DRGs 22 in number (8% of all the DRG) accounted for a disproportionate share of total discharges (67% of all discharges), while the rest contributed marginally to overall system volume. This concentration effect supports a interventions targeted towards these high discharge volume DRGs rather than broad, low-yield interventions.

**DRG Discharge Volume:**  
![DRG Discharge Volume](<../VISUALIZATIONS/DRG_Discharge_Volume.png>)


---

## 2. Inpatient Bed Utilization (Expected Bed Days)

Expected Bed Days analysis highlights that inpatient capacity pressure is driven primarily by high-severity medical DRGs with extended lengths of stay, rather than by discharge volume alone. DRGs such as septicemia, heart failure, and respiratory infections contribute a disproportionate share of inpatient bed days, indicating operational risk related to throughput and care intensity.

**Expected Bed Days**  
![Expected Bed Days](<../VISUALIZATIONS/Expected _Bed_Days.png>)

---

## 3. Financial Efficiency vs Cost Exposure

i used a multivariate scatter analysis to compare payment per discharge and payment-to-charge ratios (PCR), using bubble size as expected bed days. I found that most DRGs clustered around similar reimbursement efficiency and that financial exposure was driven primarily by a small number of high-cost outliers (burns, cell and other immunnotherapies)rather than widespread reimbursement inefficiency across DRGs.
 High volume DRGs such as septicemia, heart failure, and respiratory infections fall into the low-cost, above-median efficiency quadrant, indicating that financial exposure is driven by high volume and bed utilization rather than reimbursement inefficiency

**DRG Payment Efficiency and Cost Exposure:**  
![DRG Payment Efficiency and Cost Exposure](<../VISUALIZATIONS/DRG_Payment_Efficiency_Cost_Exposure.png>)
---

## DRG-Level Insight Summary

Taken together, the DRG-level findings indicate that system-level risk is driven more by utilization concentration, inpatient bed intensity, and scale effects of a small group of medical DRGs and less by inefficient reimbursement. These findings support targeted utilization management, length-of-stay optimization, and coding accuracy initiatives rather than broad cost reduction strategies.

---
These DRG-level findings inform subsequent State-level and Provider-level analyses, where geographic variation and facility-specific performance are evaluated to identify where utilization and financial risk are most concentrated operationally.
