# 🏥 Synthetic Healthcare SQL Analysis

## Project Overview

This project analyzes a synthetic healthcare dataset using SQL server.

The goal was to practice data cleaning, aggregation, date functions, and exploratory analysis using healthcare-related data.

## Dataset

The dataset contains patient information including:

- Medical condition
- Admission type
- Admissiong and discharge dates
- Billing amount
- Insurance provider
- Medication
- Doctor
- Hospital

The dataset is synthetic and does not contain real patient information.

## Data Cleaning

Data Cleaning included:

- Identifying and removing duplicate records.
- Creating a cleaned SQL view for analysis.
- Rounding billing amounts for consistency.
- Reviewing columns for data-quality issues.

After cleaning:

- Original rows: 55,500
- Duplicate rows removed: 534
- Clean rows: 54,966

## 📌 Analysis

### 1. What are the most common medical conditions among patients?

'''sql
SELECT Medical_Condition, COUNT(*) AS total_number
FROM vw_SyntheticHealthcareData
GROUP BY Medical_Condition
ORDER BY total_number DESC;
'''

### 2. What is the average billing amount for each medical condition?

### 3. What is the average length of stay for each medical condition?

### 4. Which admission type has the highest number of patients?

### 5. What is the average billing amount for each admission type?

### 6. What is the average length of stay for each admission type?

### 7. Which month had the highest number of admissions?

### 8. Which insurance provider had the highest average billing amount?

### 9. Which insurance provider covered the highest number of patients?

### 10. Which medication was prescribed most frequently?

## Data Limitations

The 'Doctor' and 'Hospital' columns were excluded from further analysis because of limitations in the synthetic data.

Many doctor names appeared only once, which limited meaningful provider-level comparisons. Some hospital values were also inconsistent or malformed.

## SQL Skills Used

- SELECT
- GROUP BY
- ORDER BY
- COUNT()
- AVG()
- ROUND()
- CAST()
- DATEDIFF()
- DATENAME()
- DATEPART()
- ROW_NUMBER()
- Common Table Expressions (CTEs)
- SQL Views

## Repository Structure

'''text
Synthetic-Healthcare-SQL-Analysis
│
├── README.md
├── 01_Dataset
├── 02_Data_Cleaning
└── 03_Data_Analysis