# 🏥 Hospital Information Analysis – SQL Project

This project analyzes hospital data from the `hospinfo` table within the `healthcare` database to provide insights on hospital distribution, performance, and services across different states and ownership types.

---

## 📁 Dataset Overview

- **Database:** `healthcare`
- **Table:** `hospinfo`
- **Data Points:** Hospital names, states, types, ownership, ratings, services, and performance metrics.

---

## 🎯 Objectives

- Analyze hospital counts by state, type, and ownership
- Assess hospital performance metrics including overall ratings, mortality, and patient experience
- Examine availability of emergency services and EHR (Electronic Health Record) status
- Identify hospitals and states excelling or lagging in key performance areas

---

## 🧰 Tools & Methods

- **SQL** queries for:
  - Aggregation (`COUNT`, `AVG`)
  - Grouping and ordering (`GROUP BY`, `ORDER BY`)
  - Filtering and updating (`WHERE`, `UPDATE`)
  - Conditional case handling (`CASE` statements)

---

## 🔍 Key Analyses & Findings

- **Hospital Counts:**  
  - Total number of hospitals overall and by state  
  - Distribution by hospital type and ownership  
  - Presence of emergency services  

- **Performance Ratings:**  
  - Average overall hospital rating by state and ownership type  
  - Top 10 highest-rated hospitals  
  - Mortality rating distribution and timeliness of care  

- **Patient Experience:**  
  - Identification of hospitals with below-average patient experience  
  - Imaging effectiveness comparison  

- **Data Quality & Cleaning:**  
  - Handling missing or empty `ehr_status` data with replacement strategies  

- **Regional Insights:**  
  - Top states with hospitals rated “Above the national average” for mortality performance

---

## 📊 Example Query Snippet

```sql
SELECT State, COUNT(*) AS Hospital_Count
FROM hospinfo
GROUP BY State
ORDER BY Hospital_Count DESC;
