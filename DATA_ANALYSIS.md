## Analysis

### 1. What are the most common medical conditions among patients?

```sql
SELECT Medical_Condition, COUNT(*) AS total_number
FROM vw_SyntheticHealthcareData
GROUP BY Medical_Condition
ORDER BY total_number DESC;
```
**Results:**

<img width="158" height="91" alt="image" src="https://github.com/user-attachments/assets/4ba5dd0f-9e77-4629-be31-5edcf3fdca8c" />

The most common medical condition is arthritis, with 9,218 patients.
***
### 2. What is the average billing amount for each medical condition?

```sql
SELECT Medical_Condition, ROUND(AVG(Billing_Amount), 2) AS average_billing_amount
FROM vw_SyntheticHealthcareData
GROUP BY Medical_Condition
ORDER BY average_billing_amount DESC;
```
**Results:**

<img width="196" height="92" alt="image" src="https://github.com/user-attachments/assets/7dbd7356-8b42-4d0d-b1d9-c4b718263d56" />

Obesity had the highest average billing amount at $25,804.36, while Cancer had the lowest at $25,152.32.
***
### 3. What is the average length of stay for each medical condition?

```sql
SELECT Medical_Condition,
	CAST(
		AVG(CAST(DATEDIFF(day, Date_of_Admission, Discharge_Date) AS DECIMAL(10,2))) 
		AS DECIMAL (10,1)
	) AS average_length_of_stay
FROM vw_SyntheticHealthcareData
GROUP BY Medical_Condition
ORDER BY average_length_of_stay DESC;
```
**Results:**

<img width="196" height="92" alt="image" src="https://github.com/user-attachments/assets/153e3101-c57d-47d1-9428-13cf7ebf58d7" />

Asthma had the highest average length of stay at 15.7 days, while Obesity had the lowest at 15.4 days.
***
### 4. Which admission type has the highest number of patients?

```sql
SELECT Admission_Type, COUNT(*) AS number_of_patients
FROM vw_SyntheticHealthcareData
GROUP BY Admission_Type
ORDER BY number_of_patients DESC;
```
**Results:**

<img width="173" height="53" alt="image" src="https://github.com/user-attachments/assets/7ed8bbe7-96fe-4f9a-b8f7-be645bb947b7" />

Elective admissions had the highest patient count with 18,473 patients.
***
### 5. What is the average billing amount for each admission type?

```sql
SELECT Admission_Type, ROUND(AVG(Billing_Amount), 2) AS average_billing_amount
FROM vw_SyntheticHealthcareData
GROUP BY Admission_Type
ORDER BY average_billing_amount DESC;
```
**Results:**

<img width="187" height="53" alt="image" src="https://github.com/user-attachments/assets/7f95f2b1-51c2-4297-be7e-6826a64d37d9" />

Elective admissions had the highest average billing amount at $25,612.14.
***
### 6. What is the average length of stay for each admission type?

```sql
SELECT Admission_Type,
	CAST(
		AVG(CAST(DATEDIFF(day, Date_of_Admission, Discharge_Date) AS DECIMAL(10,2))) 
		AS DECIMAL (10,1)
	) AS average_length_of_stay
FROM vw_SyntheticHealthcareData
GROUP BY Admission_Type
ORDER BY average_length_of_stay DESC;
```
**Results:**

<img width="188" height="53" alt="image" src="https://github.com/user-attachments/assets/20a19df8-8034-484d-bb6b-1954e15d106c" />

Emergency admissions had the highest average length of stay at 15.6 days.
***
### 7. Which month had the highest number of admissions?

```sql
SELECT DATENAME(MONTH, Date_of_Admission) AS month_name,
	DATEPART(YEAR, Date_of_Admission) AS year,
	COUNT(*) AS number_of_admissions
FROM vw_SyntheticHealthcareData
GROUP BY DATENAME(MONTH, Date_of_Admission), 
	DATEPART(YEAR, Date_of_Admission)
ORDER BY number_of_admissions DESC;
```
**Results:**

<img width="202" height="782" alt="image" src="https://github.com/user-attachments/assets/6a356f9e-c0e0-42ca-b801-8e5f1f6deee2" />

August 2020 had the highest admission count with 1,003 patients.
***
### 8. Which insurance provider had the highest average billing amount?

```sql
SELECT Insurance_Provider, ROUND(AVG(Billing_Amount), 2) AS average_billing_amount
FROM vw_SyntheticHealthcareData
GROUP BY Insurance_Provider
ORDER BY average_billing_amount DESC;
```
**Results:**

<img width="198" height="80" alt="image" src="https://github.com/user-attachments/assets/c2fecfec-968c-4ba8-92dd-a5b26811debe" />

Medicare had the highest average billing amount at $25,628.32.
***
### 9. Which insurance provider covered the highest number of patients?

```sql
SELECT Insurance_Provider, COUNT(*) AS total_number_of_patients
FROM vw_SyntheticHealthcareData
GROUP BY Insurance_Provider
ORDER BY total_number_of_patients DESC;
```
**Results:**

<img width="204" height="79" alt="image" src="https://github.com/user-attachments/assets/cc725d7a-9996-4b17-bce3-747dc415b0b5" />

Cigna had the highest patient count of 11,139 patients.
***
### 10. Which medication was prescribed most frequently?

```sql
SELECT Medication, COUNT(*) AS total_number_of_patients
FROM vw_SyntheticHealthcareData
GROUP BY Medication
ORDER BY total_number_of_patients DESC;
```
**Results:**

<img width="182" height="80" alt="image" src="https://github.com/user-attachments/assets/99a4e379-de8f-4d72-8c77-555ebcd406c0" />

Lipitor was the most frequently prescribed, given to a total of 11,038 patients.
***
