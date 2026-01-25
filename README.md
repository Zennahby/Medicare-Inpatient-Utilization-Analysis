# Medicare Inpatient Utilization & Cost Structure Analysis (2019–2023)

## Why This Project Matters
Medicare inpatient risk is often assessed using total discharges or total spend, which hides where
capacity strain and cost pressure actually originate.

This project analyzes CMS Inpatient Prospective Payment System (IPPS) data to identify where
inpatient utilization, bed capacity pressure, and cost intensity are **structurally concentrated** —
separating volume effects from true utilization intensity and cost drivers.

The goal is not reporting totals, but enabling **targeted, high-leverage decision-making** for
healthcare payers, providers, and strategy teams.

---

## What This Project Demonstrates
This project was designed as a **decision-focused analytics portfolio**, demonstrating:

- Advanced SQL data preparation, validation, and outlier analysis  
- Composite metric design (Expected Bed Days, per-capita normalization)  
- Healthcare domain judgment (utilization ≠ inefficiency)  
- Multi-level analysis across DRG, provider, and state perspectives  
- Executive-level storytelling grounded in defensible methodology  

---

## Analytical Structure
The analysis is intentionally structured across three complementary levels:

### DRG Level
Identifies which inpatient services disproportionately drive:
- Discharge volume
- Inpatient bed utilization
- Medicare financial exposure  

### Provider Level
Evaluates how hospitals consume inpatient capacity and Medicare spend by separating:
- Volume-driven utilization
- Length-of-stay–driven intensity
- Cost per hospitalization  

### State Level
Normalizes utilization and cost by population to reveal:
- Structural capacity pressure
- Cost intensity independent of scale
- Geographic variation in inpatient risk  

Each level answers a **distinct decision question** and builds on the previous one.

---

## Core Metrics
The analysis centers on a small set of decision-relevant metrics:

- **Expected Bed Days** – inpatient capacity consumption  
- **Expected Bed Days per 1,000 Residents** – population-normalized capacity pressure  
- **Average Medicare Payment per Discharge** – cost intensity per hospitalization  

Formal definitions and interpretation guardrails are documented in `Metric_Definitions.md`.

---

## Data & Tools
- **Primary Data Source:** CMS Medicare IPPS Inpatient Data (2019–2023)  
- **Tools:** SQL, Google BigQuery, Power BI  

SQL scripts, data validation logic, and visualization artifacts are fully documented
to ensure transparency and reproducibility.

---

## Repository Guide
Recommended reading order:

1. `Executive_Summary.md` – cross-level synthesis and key insights  
2. `DRG_Level.md` → `Provider_Level.md` → `State_Level.md` – detailed analysis  
3. `Analytical_Methodology.md` – assumptions, scope, and aggregation logic  
4. `Data_Pipeline.md` – end-to-end data preparation and modeling  
5. `/SQL` – representative SQL scripts  
6. `/VISUALIZATIONS` – final charts and semantic model diagram  

---

## Key Insight (One Sentence)
A small subset of medical DRGs, providers, and states drives the majority of Medicare inpatient
capacity strain, while cost intensity and utilization pressure require **different policy and
operational levers**.

---
