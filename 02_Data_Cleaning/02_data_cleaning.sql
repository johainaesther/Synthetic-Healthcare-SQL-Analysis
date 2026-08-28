-- Direct to the correct database
USE [SyntheticHealthcareDB];
GO

-- Create a view from CleanData.
CREATE OR ALTER VIEW vw_SyntheticHealthcareData AS
-- Create a CTE called 'CleanData' to identify duplicate rows.
WITH CleanData AS (
-- Assign a row number to each set of duplicate records using ROW_NUMBER() to label duplicates.
	SELECT *,
		ROW_NUMBER() OVER(PARTITION BY Name, Age, Gender, Blood_Type, Medical_Condition, Date_of_Admission, Doctor, Hospital, Insurance_Provider, Billing_Amount, Room_Number, Admission_Type, Discharge_Date, Medication, Test_Results ORDER BY Name) AS Dup_No
	FROM healthcare_dataset
)

-- Select non-duplicate data and format Billing_Amount to 2 decimals.
SELECT Name, Age, Gender, Blood_Type, Medical_Condition, Date_of_Admission, Doctor, Hospital, Insurance_Provider, ROUND(Billing_Amount, 2) AS Billing_Amount, Room_Number, Admission_Type, Discharge_Date, Medication, Test_Results
FROM CleanData
WHERE Dup_No = 1;
 
-- Validating view before analysis.
SELECT *
FROM vw_SyntheticHealthcareData;
-- Results: 54,966 unique rows remain.
-- 534 duplicate rows were removed and Billing_Amount was formatted to 2 decimal places.