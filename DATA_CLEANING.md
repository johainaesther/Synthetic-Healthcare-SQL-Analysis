# Data Cleaning

## Inspect Dataset

```sql
SELECT *
FROM healthcare_dataset;
```

Manually checking dataset for NULL values, duplicate rows, or inconsistent data. Total rows: 55,500

## Finding Duplicate Rows

```sql
SELECT Name, COUNT(*) AS duplicate_count
FROM healthcare_dataset
GROUP BY Name, Age, Gender, Blood_Type, Medical_Condition, Date_of_Admission, Doctor, Hospital, Insurance_Provider, Billing_Amount, Room_Number, Admission_Type, Discharge_Date, Medication, Test_Results
HAVING COUNT(*) > 1
ORDER BY Name;
```

Results showed 534 duplicated groups.

## Finding Null Values

```sql
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
```

There were 0 rows with NULL values, which means that every column in every row has a value.


## Checking for admission and discharge date inconsistencies.

```sql
SELECT COUNT(*) as date_inconsist
FROM healthcare_dataset
WHERE Discharge_Date < Date_of_Admission;
```

There were 0 rows where discharge dates were earlier than admission dates.

## Checking for impossible values in age column.

```sql
SELECT COUNT(*) as impossible_age
FROM healthcare_dataset
WHERE Age NOT BETWEEN 0 AND 122;
```

There were 0 rows where age is less than 0 or greater than 122.

## Checking for negative or unusual values in billing amount column.

First, find the maximum amount.

```sql
SELECT MAX(Billing_Amount) as max_billing
FROM healthcare_dataset;
```
<img width="212" height="52" alt="image" src="https://github.com/user-attachments/assets/70e7158c-e402-4ef2-9b51-0fa75f43302b" />

Second, find the minimum amount.

```sql
SELECT MIN(Billing_Amount) as min_billing
FROM healthcare_dataset;
```

<img width="189" height="51" alt="image" src="https://github.com/user-attachments/assets/9c152d55-4a5a-43b2-9d2e-67102947e1b1" />

This reveals that Billing_Amount column contains at least one negative value. Therefore, will need to find how many rows have a negative billing amount.

```sql
SELECT COUNT(*) as neg_billing
FROM healthcare_dataset
WHERE Billing_Amount < 0;
```

<img width="154" height="50" alt="image" src="https://github.com/user-attachments/assets/4e1d4cc5-65d9-49f6-98d1-801ea807aaf7" />

There are 108 rows with a negative number in Billing_Amount.

## Checking for unusual values in Room_Number.

Finding the lowest and highest room numbers.
```sql
SELECT MIN(Room_Number) AS min_room_number
FROM healthcare_dataset;
```
```
SELECT MAX(Room_Number) AS max_room_number
FROM healthcare_dataset;
```

<img width="224" height="112" alt="image" src="https://github.com/user-attachments/assets/14d133b1-b4fc-4f7b-b264-9d5a3e78532f" />

Room numbers range from 101 to 500 with no negative values or obvious extreme outliers.
