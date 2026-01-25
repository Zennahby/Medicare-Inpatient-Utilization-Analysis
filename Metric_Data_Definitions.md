## **Metric Definitions**

This document defines all metrics used across the **DRG-, Provider-, and State-level analyses**.
Metrics are defined **once** to ensure consistent interpretation and avoid duplication across files.

---

## **Primary Decision Metrics**

These metrics directly drive conclusions and decision guidance.

---

### **1. Expected Bed Days**

**Definition**
Total Discharges × Geometric Mean Length of Stay (GMLOS)

**Analytical Role**
Primary measure of **inpatient capacity consumption**, capturing both patient volume and stay duration.

**Interpretation Notes**

* Higher values indicate greater inpatient bed utilization
* Does not imply inefficiency by default
* Must be interpreted in context of scale and care delivery patterns

---

### **2. Expected Bed Days per 1,000 Residents**

**Definition**
State-level Expected Bed Days ÷ State Population × 1,000

**Analytical Role**
Measures **population-normalized inpatient capacity pressure**, enabling fair comparison across states of different sizes.

**Interpretation Notes**

* High values indicate **structural utilization intensity**
* Reflects persistent system-level reliance on inpatient care
* Not a measure of quality or access

---

### **3. Average Medicare Payment per Discharge**

**Definition**
Total Medicare Inpatient Payments ÷ Total Discharges

**Analytical Role**
Measures **cost intensity per hospitalization**, independent of utilization volume.

**Interpretation Notes**

* Higher values reflect structural cost drivers (e.g., labor costs, case mix, geography)
* Does not imply overpayment or inefficiency by default

---

## **Supporting Metrics**

These metrics provide context and serve as inputs to primary decision metrics.

---

### **4. Total Discharges**

**Definition**
Total number of Medicare inpatient discharges associated with a DRG, provider, or state.

**Analytical Role**

* Foundational volume indicator
* Used for concentration and scale analysis
* Input to composite metrics

**Interpretation Notes**

* Favors large systems and populations
* Not interpreted independently as a risk or performance measure

---

### **5. Geometric Mean Length of Stay (GMLOS)**

**Definition**
Average inpatient length of stay for a DRG, calculated using a geometric mean.

**Analytical Role**

* Proxy for inpatient stay duration
* Input to Expected Bed Days

**Interpretation Notes**

* Represents typical stays, not extremes
* Longer GMLOS does not imply inefficiency on its own

---

### **6. Total Medicare Inpatient Payments**

**Definition**
Sum of Medicare DRG payments associated with inpatient discharges.

**Analytical Role**

* Measures total Medicare financial exposure
* Input to Average Payment per Discharge

**Interpretation Notes**

* Highly correlated with volume
* Not interpreted independently due to scale bias

---

## **Analytical Dimensions**

Metrics are analyzed across the following dimensions:

* **DRG** — Service-level utilization and cost concentration
* **Provider** — Hospital-level capacity and financial exposure
* **State** — System-level structural pressure and cost intensity
* **Year** — Multi-year aggregation (2019–2023) for stability

---

## **Interpretation Guardrails**

* High utilization ≠ inefficiency
* Low payment per discharge ≠ higher quality
* Volume, utilization intensity, and cost are treated as **separate analytical dimensions**
* Metrics describe **risk concentration**, not performance ranking

---

### **Bottom Line**

These metrics are designed to **separate scale, utilization intensity, and cost**, enabling targeted and defensible analysis of Medicare inpatient utilization and spending risk.

---
