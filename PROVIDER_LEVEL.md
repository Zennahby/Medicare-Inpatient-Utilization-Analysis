# Provider-Level Utilization and Medicare Financial Exposure Analysis

## Overview

This section evaluates hospital-level inpatient utilization and Medicare financial exposure using the CMS Medicare Inpatient Prospective Payment System (IPPS) dataset. This analysisis identified high volume, high cost providers, determined if utilization is driven by patient volume or length of stay, and how utilization patterns translate into Medicare spending exposure at the hospital level. This provider-level perspective is essential for understanding operational bottlenecks, capacity risk, and high-impact financial leverage points in the Medicare inpatient system.

---

## Key Analytical Questions

- What drives inpatient utilization? Is it patient volume or patient prolonged stays?
- How does provider-level utilization translate into Medicare financial exposure?


---

## 1. Inpatient Capacity Utilization (Expected Bed Days)

I used Expected Bed Days to quantify provider **total inpatient capacity consumption** at the provider level.  This metric combines discharge volume and geometric mean length of stay (GMLOS), translating clinical activity into a direct measure of bed usage.

Using a scatter chart to plot total discharges against GMLOS with Expected Bed Days as the bubble size, i discovered a little over 30% of the providers were high-volume hospitals most likely teaching hospitals. These high volume hospitals demonstrated two distinct utilization patterns:

- high_volume providers due to patients staying longer than the national median indicating potential throughput and discharge-planning constraints requiring efficiency interventions (Adventhealth Orlando FL, New york Presbyterian Hospital).
- High-volume Providers that maintained average or below-average length of stay, reflecting volume-driven utilization rather than inefficiency (Lehigh Valley Hospital, Hospital for special surgery). This can easily be handled through capacity planning rather than efficiency interventions


**Provider Expected Bed Days**  
![Provider Expected Bed Days](<../VISUALIZATIONS/Provider_Expected_Bed_Days.png>)

---

## 2. Medicare Financial Exposure (Payment per Discharge vs Total Discharges)

This chart explains why some hospitals account for more Medicare spending than others.

Medicare spending increases in two ways:

* when a hospital treats many patients, or

* when each hospital stay is expensive.

The chart shows both at the same time. Hospitals on the right treat many patients. Hospitals higher on the chart receive more Medicare payment per stay. Larger bubbles represent hospitals where Medicare spends the most overall. Most high-spending hospitals are not expensive for just one reason. Some hospitals are expensive  because:
 1. They have high volume of patients but their cost per stay are within or lower than national average (Beaumont Hospital Troy MI, Uf Health The villages Hospital FL). These hospitals can find ways to reduce avoidable admissions.
 2. They have low volume of patiens but the cost per stay is above national average, often due to complexity, service mix, or coding intensity (Harris Health Systems,John H, Stroger Jr Hospital). for these you can Identify high-cost DRGs driving payment intensity,reduce unnecessary diagnostic procedures and Ensure payments reflect clinical reality, not documentation inflation
 3. The hospitals treat many patients and have higher-than-average cost per stay (Adventhealth hospital Orlando, NYU-Langone Hospitals). strategies can include targeted value-based contracts,,LOS reduction programs focused on DRGs with the highest cost and bed use tight management of high-cost inpatient services
 
 
  Because Medicare spending is driven by both volume and cost per stay, effective intervention requires matching strategies to provider-specific cost drivers rather than applying uniform cost controls.

**Provider level Medicare Spending**  
![Provider Payment per Discharge](<../VISUALIZATIONS/Provider_Payment_per _Discharge.png>)

---

## Provider-Level Insight Summary

In summary, analysis at the provider-level show that Medicare inpatient utilization and financial risk is not spread evenly across hospitals. It is highest at hospitals that both treat many patients and receive higher payments per stay.

Some hospitals strain inpatient capacity because patients stay longer than average, while others do so simply because they treat large numbers of patients. Medicare spending increases the most when high patient volume and high cost per stay occur together.

Because hospitals become expensive for different reasons, solutions must be provider-specific. Reducing length of stay helps hospitals where long stays drive bed use, while cost and payment controls matter most where high volume and high payment per stay combine.

---

## Methodological Notes

- All metrics were aggregated at the provider level across DRGs and years to represent each hospital’s full inpatient footprint.
- Expected Bed Days were calculated as total discharges multiplied by GMLOS to quantify true inpatient capacity consumption.
- Payment per discharge was derived from total DRG payments divided by total discharges to normalize financial intensity across hospitals of different sizes.
- Log scaling was applied to discharge volume to accommodate the wide distribution of hospital sizes while preserving interpretability.
- System-wide medians were used as reference benchmarks to anchor interpretation against the typical Medicare inpatient provider rather than against only high-volume hospitals.

---


