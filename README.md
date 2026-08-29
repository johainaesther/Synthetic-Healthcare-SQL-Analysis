# Synthetic Healthcare SQL Analysis

## Project Overview

This project analyzes a synthetic healthcare dataset using SQL Server.

The goal was to practice data cleaning, aggregation, date functions, and exploratory analysis using healthcare-related data.

## Dataset

The dataset contains patient information including:

- Medical condition
- Admission type
- Admission and discharge dates
- Billing amount
- Insurance provider
- Medication
- Doctor
- Hospital

The dataset is synthetic and does not contain real patient information.

## Data Cleaning

Data cleaning included:

- Identifying and removing duplicate records
- Creating a cleaned SQL view for analysis
- Rounding billing amounts for consistency
- Reviewing columns for data-quality issues

After cleaning:

- Original rows: 55,500
- Duplicate rows removed: 534
- Clean rows: 54,966

## Analysis Questions

1. What are the most common medical conditions among patients?

2. What is the average billing amount for each medical condition?

3. What is the average length of stay for each medical condition?

4. Which admission type has the highest number of patients?

5. What is the average billing amount for each admission type?

6. What is the average length of stay for each admission type?

7. Which month had the highest number of admissions?

8. Which insurance provider had the highest average billing amount?

9. Which insurance provider covered the highest number of patients?

10. Which medication was prescribed most frequently?

[View Data Analysis](https://github.com/johainaesther/Synthetic-Healthcare-SQL-Analysis/blob/main/DATA_ANALYSIS.md)

## Key Findings

- Arthritis had the highest patient count with 9,218 patients.
- Obesity had the highest average billing amount by medical condition at $25,804.36.
- Average length of stay varied only slightly across medical conditions.
- Elective admissions had the highest patient count with 18,473 patients.
- August 2020 had the highest monthly admission count with 1,003 patients.
- Medicare had the highest average billing amount among insurance providers.
- Cigna covered the highest number of patients.
- Lipitor was the most frequently prescribed medication.

## Data Limitations

The `Doctor` and `Hospital` columns were excluded from further analysis because of limitations in the synthetic data.

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

```text
Synthetic-Healthcare-SQL-Analysis
│
├── README.md
├── 01_Dataset
├── 02_Data_Cleaning
└── 03_Data_Analysis
