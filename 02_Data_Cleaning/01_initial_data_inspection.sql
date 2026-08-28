-- Direct to the correct database
USE [SyntheticHealthcareDB];
GO

-- Inspection query
SELECT *
FROM healthcare_dataset;
-- Manually checking dataset for NULL values, duplicate rows, or inconsistent data.
-- Total rows: 55,500

-- Finding duplicate rows.
SELECT Name, COUNT(*) AS duplicate_count
FROM healthcare_dataset
GROUP BY Name, Age, Gender, Blood_Type, Medical_Condition, Date_of_Admission, Doctor, Hospital, Insurance_Provider, Billing_Amount, Room_Number, Admission_Type, Discharge_Date, Medication, Test_Results
HAVING COUNT(*) > 1
ORDER BY Name;
-- Results: 534 duplicated groups 

-- Finding NULL values.
SELECT COUNT(*) AS number_of_null
FROM healthcare_dataset
WHERE Name IS NULL
	OR Age IS NULL
	OR Gender IS NULL
	OR Blood_Type IS NULL
	OR Medical_Condition IS NULL
	OR Date_of_Admission IS NULL
	OR Doctor IS NULL
	OR Hospital IS NULL
	OR Insurance_Provider IS NULL
	OR Billing_Amount IS NULL
	OR Room_Number IS NULL
	OR Admission_Type IS NULL
	OR Discharge_Date IS NULL
	OR Medication IS NULL
	OR Test_Results IS NULL;
-- Results: 0 rows with NULL values; therefore every column in every row has a value.

-- Check for admission and discharge date inconsistencies.
SELECT COUNT(*) as date_inconsist
FROM healthcare_dataset
WHERE Discharge_Date < Date_of_Admission;
-- Results: 0 rows where discharge dates is earlier than admission dates.

-- Check for impossible values in age column.
SELECT COUNT(*) as impossible_age
FROM healthcare_dataset
WHERE Age NOT BETWEEN 0 AND 122;
-- Results: 0 rows where age is less than 0 or greater than 122.

-- Check for negative or unusual values in billing amount column.
SELECT MIN(Billing_Amount) as min_billing
FROM healthcare_dataset;
-- Results: Minimum billing amount is a negative (-2008.4921875).
SELECT MAX(Billing_Amount) as max_billing
FROM healthcare_dataset;
-- Results: Maximum billing amount is 52764.27734375.
-- Notes: Billing_Amount contains at least one negative value and has more decimal precision than expected for currency.
SELECT COUNT(*) as neg_billing
FROM healthcare_dataset
WHERE Billing_Amount < 0;
-- Results: 108 rows have a negative Billing_Amount.

-- Check for unusual values in Room_Number
SELECT MIN(Room_Number) AS min_room_number
FROM healthcare_dataset;
-- Results: Minimum room number is 101.
SELECT MAX(Room_Number) AS max_room_number
FROM healthcare_dataset;
-- Results: Maximum room number is 500.
-- Notes: Room_Number ranges from 101 to 500 with no negative values or obvious exteme outliers.