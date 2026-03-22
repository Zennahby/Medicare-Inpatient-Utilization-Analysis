# Medicare Inpatient Utilization & Cost Structure Analysis (2019–2023)

## Executive Summary
This project analyzes Medicare inpatient data to identify where hospital utilization, cost, and capacity pressures are structurally concentrated across the U.S. healthcare system.

The analysis shows that system risk is not evenly distributed—it is concentrated across a small subset of conditions, providers, and states, driven by differences in utilization intensity, cost structure, and care delivery patterns.

These findings highlight that effective healthcare interventions must target **where pressure is concentrated**, rather than relying on system-wide cost or capacity assumptions.

### Key Findings

- **Inpatient utilization is highly concentrated, with 67% of discharges driven by just 22 DRGs (8%), indicating that system pressure is driven by a narrow set of conditions rather than evenly distributed demand**

- **Provider-level financial and capacity risk is concentrated among a subset of hospitals and driven by two mechanisms—patient volume and cost per stay—with the highest spending occurring where both overlap, requiring provider-specific rather than uniform interventions**

- **Capacity pressure varies structurally across states, with large, high-demand states like Florida (1,212), Illinois (1,147), and New York (1,017) experiencing sustained strain driven by both population scale and utilization intensity**

- **Extreme per-capita strain also occurs in smaller systems like Delaware (1,595), showing that capacity pressure can emerge from structural constraints—not just demand—while large states like California (677) and Texas (757) operate at lower utilization intensity despite high volume**

- **Cost intensity varies independently of utilization, with states like Alaska (~$25K), Hawaii (~$22K), and California (~$22K) far exceeding low-cost states like Florida, Alabama, and Mississippi (~$13K), reflecting differences in reimbursement structure, geography, and case complexity**

- **The interaction between cost and capacity reveals structurally different system risk profiles: high-strain/high-cost states (e.g., New York, California) face compounded financial and capacity pressure, while high-strain/low-cost states (e.g., Florida) face operational strain at low margins—requiring targeted interventions such as value-based care versus capacity expansion**

![DRG Concentration](./VISUALIZATIONS/DRG_Discharge_Volume1.png)
*Figure: A small subset of DRGs drives the majority of inpatient utilization, demonstrating that healthcare system demand is structurally concentrated rather than evenly distributed.*

### Core Insight
Hospital strain is not driven by demand alone—it emerges from how care is concentrated across conditions, providers, and geographies, requiring targeted rather than uniform system interventions.
---

## Why This Project Matters
Medicare inpatient risk is often assessed using total discharges or total spend, which obscures where capacity strain and cost pressure actually originate.

This project analyzes CMS Inpatient Prospective Payment System (IPPS) data to identify where inpatient utilization, bed capacity pressure, and cost intensity are **structurally concentrated**—separating volume effects from true utilization intensity and cost drivers.

The goal is not reporting totals, but enabling **targeted, high-leverage decision-making** for healthcare payers, providers, and strategy teams.
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

SQL scripts, data validation logic, and visualization artifacts are fully documented to ensure transparency and reproducibility.
---

## Repository Guide
Recommended reading order:

1. `Executive_Summary.md` – cross-level synthesis and key insights  
2. `DRG_Level.md` → `Provider_Level.md` → `State_Level.md` – detailed analysis  
3. `Analytical_Methodology.md` – assumptions, scope, and aggregation logic  
4. `Data_Pipeline.md` – end-to-end data preparation and modeling  
5. `/SQL` – representative SQL scripts  
6. `/VISUALIZATIONS` – final charts and semantic model diagram  
