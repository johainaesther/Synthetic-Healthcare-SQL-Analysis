-- Direct to correct database
USE SyntheticHealthcareDB;
GO

-- Question 1: What are the most common medical conditions among patients?

-- Count the total number of patients with each medical condition.
SELECT Medical_Condition, COUNT(*) AS total_number
FROM vw_SyntheticHealthcareData
GROUP BY Medical_Condition
ORDER BY total_number DESC;
-- Results: Arthritis had the highest patient count with 9,218 patients.

-----------------------------------------------------------------------------------------------------------------------

-- Question 2: What is the average billing amount for each medical condition?

-- Calculate the average billing amount for each medical condition.
-- Round the result to 2 decimal places for currency consistency.
SELECT Medical_Condition, ROUND(AVG(Billing_Amount), 2) AS average_billing_amount
FROM vw_SyntheticHealthcareData
GROUP BY Medical_Condition
ORDER BY average_billing_amount DESC;
-- Results: Obesity had the highest average billing amount at $25,804.36, while Cancer had the lowest at $25,152.32.
-- Observation: The difference between the highest and lowest averages is only about $652, 
	-- suggesting that medical condition may not have a very strong relationship with billing amount in this synthetic dataset.

-----------------------------------------------------------------------------------------------------------------------

-- Question 3: What is the average length of stay for each medical condition?

-- Calculate length of stay using the difference between admission and discharge dates.
-- Calculate the average length of stay for each medical condition and use CAST to maintain decimal precision.
SELECT Medical_Condition,
	CAST(
		AVG(CAST(DATEDIFF(day, Date_of_Admission, Discharge_Date) AS DECIMAL(10,2))) 
		AS DECIMAL (10,1)
	) AS average_length_of_stay
FROM vw_SyntheticHealthcareData
GROUP BY Medical_Condition
ORDER BY average_length_of_stay DESC;
-- Results: Asthma had the highest average length of stay at 15.7 days, while Obesity had the lowest at 15.4 days.
-- Observation: Average length of stay varied only slightly across medical conditions, ranging from 15.4 to 15.7 days.
	-- This suggests that medical condition may not be strongly associated with length of stay in this synthetic dataset.

-----------------------------------------------------------------------------------------------------------------------

-- Question 4: Which admission type has the highest number of patients?

-- Calculate the number of patients for each admission type.
SELECT Admission_Type, COUNT(*) AS number_of_patients
FROM vw_SyntheticHealthcareData
GROUP BY Admission_Type
ORDER BY number_of_patients DESC;
-- Results: Elective admissions had the highest patient count with 18,473 patients.

-----------------------------------------------------------------------------------------------------------------------

-- Question 5: What is the average billing amount for each admission type?

-- Calculate average billing amount for each admission type.
-- Round the results to 2 decimal places for currency consistency.
SELECT Admission_Type, ROUND(AVG(Billing_Amount), 2) AS average_billing_amount
FROM vw_SyntheticHealthcareData
GROUP BY Admission_Type
ORDER BY average_billing_amount DESC;
-- Results: Elective admissions had the highest average billing amount at $25,612.14.
-- Observation: The difference between the highest and lowest average billing amounts was only $106.81,
	-- suggesting that admission type may not have a strong relationship with billing amount in this synthetic dataset.

-----------------------------------------------------------------------------------------------------------------------

-- Question 6: What is the average length of stay for each admission type?

-- Calculate length of stay using the difference between admission and discharge dates.
-- Calculate the average length of stay for each admission type and use CAST to maintain decimal precision.
SELECT Admission_Type,
	CAST(
		AVG(CAST(DATEDIFF(day, Date_of_Admission, Discharge_Date) AS DECIMAL(10,2))) 
		AS DECIMAL (10,1)
	) AS average_length_of_stay
FROM vw_SyntheticHealthcareData
GROUP BY Admission_Type
ORDER BY average_length_of_stay DESC;
-- Results: Emergency admissions had the highest average length of stay at 15.6 days.
-- Observation: Average length of stay was similar across admission types, 
	-- with only a small difference between the highest and lowest averages.

-----------------------------------------------------------------------------------------------------------------------

-- Question 7: Which month had the highest number of admissions?

-- Extract month name and year from admission date.
-- Count admissions for each month and year combination.
SELECT DATENAME(MONTH, Date_of_Admission) AS month_name,
	DATEPART(YEAR, Date_of_Admission) AS year,
	COUNT(*) AS number_of_admissions
FROM vw_SyntheticHealthcareData
GROUP BY DATENAME(MONTH, Date_of_Admission), 
	DATEPART(YEAR, Date_of_Admission)
ORDER BY number_of_admissions DESC;
-- Results: August 2020 had the highest admission count with 1,003 patients.
-- Observation: Admission volume varied noticeably by month and year, 
	-- suggesting that patient volume was not evenly distributed throughout the dataset.

-----------------------------------------------------------------------------------------------------------------------

-- Question 8: Which insurance provider had the highest average billing amount?

-- Calculate the average billing amount per insurance provider.
SELECT Insurance_Provider, ROUND(AVG(Billing_Amount), 2) AS average_billing_amount
FROM vw_SyntheticHealthcareData
GROUP BY Insurance_Provider
ORDER BY average_billing_amount DESC;
-- Results: Medicare had the highest average billing amount at $25,628.32.

-----------------------------------------------------------------------------------------------------------------------

-- Question 9: Which insurance provider covered the highest number of patients?

-- Calculate the number of patients for each insurance provider.
SELECT Insurance_Provider, COUNT(*) AS total_number_of_patients
FROM vw_SyntheticHealthcareData
GROUP BY Insurance_Provider
ORDER BY total_number_of_patients DESC;
-- Results: Cigna had the highest patient count of 11,139 patients.

-----------------------------------------------------------------------------------------------------------------------

-- Question 10: Which medication was prescribed most frequently?

-- Calculate the total number of patients for each medication given.
SELECT Medication, COUNT(*) AS total_number_of_patients
FROM vw_SyntheticHealthcareData
GROUP BY Medication
ORDER BY total_number_of_patients DESC;
-- Results: Lipitor was the most frequently prescribed, given to a total of 11,038 patients.

-----------------------------------------------------------------------------------------------------------------------

-- Observations of whole dataset: 
-- Unable to continue analysis with the Doctor and Hospital columns due to incosistent or malformed synthetic values and high cardinality.
-- Many doctor names appeared only once, limiting meaningful provider-level comparisons.
-- Hospital names also contained irregular or malformed values, reducing their usefulness for reliable analysis.