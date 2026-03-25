# E-Commerce Conversion Funnel & Traffic Quality Analysis

---

## Executive Summary

An analysis of ~16K users from Google Analytics reveals a critical issue:

> **The business is not constrained by traffic — it is constrained by poor conversion efficiency.**

* ~63% of users drop before checkout
* Mobile users convert ~2× worse than desktop
* Google drives traffic, but not revenue efficiently

The largest growth opportunity lies in **conversion optimization, not acquisition**

---

## Dataset

* Source: Google Analytics Sample Dataset (BigQuery Public Data)
* Table: `bigquery-public-data.google_analytics_sample.ga_sessions_*`
* Time Range: Aug 2016 – Sep 2016
* Data Size: ~675K event-level records

---

## Tech Stack

* SQL (BigQuery) → Data modeling
* Power BI → Visualization
* DAX → Metric calculation

---

##  Repository Structure

```bash
├── data/
│   ├── funnel_overall.csv
│   ├── funnel_device.csv
│   └── funnel_source.csv
│
├── sql/
│   ├── funnel_overall.sql
│   ├── funnel_device.sql
│   └── funnel_source.sql
│
├── dashboard/
│   └── ecommerce_funnel_analysis.pbix
│
├── images/
│   ├── funnel.png
│   ├── device.png
│   └── source.png
│
└── README.md
```

---

## Dashboard Preview

### Funnel Overview

![Funnel](images/funnel.png)

### Device Analysis

![Device](images/device.png)

### Source Analysis

![Source](images/source.png)

---

## Data Modeling Approach (SQL)

Raw event-level data is transformed into **user-level funnel behavior** to ensure accurate conversion measurement.

### Key Technique:

* `MAX()` → flag user actions
* `COUNTIF()` → aggregate funnel stages
* Avoids double-counting across sessions

---

### Example Logic

```sql
MAX(CASE WHEN hits.eCommerceAction.action_type = '3' THEN 1 ELSE 0 END) AS add_to_cart
```

---

## Analysis Breakdown

---

### 1. Funnel Performance

* Product View → Add to Cart → Checkout → Purchase

**Finding:**

> ~63% of users drop before checkout → early-stage friction is the primary bottleneck

---

### 2. Device-Level Conversion

* Desktop: ~41%
* Mobile: ~18%

**Finding:**

> Mobile users face significant friction during checkout

---

### 3. Traffic Source Efficiency

* Direct: ~14% conversion
* Google: ~6% conversion

**Finding:**

> High traffic ≠ high value — Google traffic is inefficient

---

##  Key Insights

* Conversion loss occurs early in the funnel
* Mobile UX is a major constraint
* Traffic quality varies significantly by source

---

##  Business Diagnosis

The problem is not lack of users — it is **inefficient conversion of existing demand**.

---

## Strategic Recommendations

### 1. Fix Mobile Checkout (Highest Impact)

* Reduce steps
* Simplify forms
* Improve load speed

---

### 2. Optimize Early Funnel

* Improve product page clarity
* Strengthen call-to-action
* Reduce cognitive load

---

### 3. Improve Acquisition Efficiency

* Optimize Google targeting
* Align landing pages with intent
* Prioritize high-intent traffic

---

## Expected Impact

* 20–30% increase in conversion rate
* Improved marketing ROI
* Revenue growth without additional traffic

---

## Key Takeaway

> **Conversion optimization is a higher-leverage growth strategy than increasing traffic volume.**

---

## How to Reproduce

1. Run SQL queries in BigQuery
2. Export results as CSV
3. Load into Power BI
4. Build dashboard

---

##  Author

Sahil Narula

---

