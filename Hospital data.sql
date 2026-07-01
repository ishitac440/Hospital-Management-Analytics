-- CREATE DATABASE hospital_analytics;
USE hospital_analytics;
-- CREATE TABLE hospital_data (
--     Patient_ID INT,
--     Age INT,
--     Gender VARCHAR(20),
--     Medical_Condition VARCHAR(100),
--     Treatment VARCHAR(100),
--     Outcome VARCHAR(50),
--     Insurance_Type VARCHAR(50),
--     Income INT,
--     Region VARCHAR(50),
--     Smoking_Status VARCHAR(20),
--     Admission_Type VARCHAR(50),
--     Hospital_ID INT,
--     Length_of_Stay INT,
--     Age_group VARCHAR (50)
-- );

-- Query 1- TOTAL NO. OF PATIENTS
-- SELECT COUNT(*) AS Total_Patients
-- FROM hospital_data;

-- Query 2- AVERAGE PATIENT AGE
-- SELECT ROUND(AVG(Age),2) AS Average_Age
-- FROM hospital_data;

-- Query 3- GENDER AGE
-- SELECT Gender,
-- COUNT(*) AS Total_Patients
-- FROM hospital_data
-- GROUP BY Gender;

-- Query 4- MOST COMMON MEDICAL CONDITIONS
-- SELECT Medical_Condition,
-- COUNT(*) AS Total_Cases
-- FROM hospital_data
-- GROUP BY Medical_Condition
-- ORDER BY Total_Cases DESC; 

-- Query 5- MOST COMMON TREATMENTS
-- SELECT Treatment,
-- COUNT(*) AS Total_Treatments
-- FROM hospital_data
-- GROUP BY Treatment
-- ORDER BY Total_Treatments DESC; 

-- Query 6- AVERAGE LENGTH OF STAY
-- SELECT ROUND(AVG(Length_of_Stay),2) AS Average_Stay
-- FROM hospital_data;

-- Query 7- PATIENT PER HOSPITAL
-- SELECT Hospital_ID,
-- COUNT(*) AS Total_Patients
-- FROM hospital_data
-- GROUP BY Hospital_ID
-- ORDER BY Total_Patients DESC;

-- Query 8- AVERAGE INCOME BY INSURANCE TYPE
-- SELECT Insurance_Type,
-- ROUND(AVG(Income),2) AS Average_Income
-- FROM hospital_data
-- GROUP BY Insurance_Type; 

-- Query 9- SMOKING STATUS vs MEDICAL CONDITION
-- SELECT Smoking_Status,
-- Medical_Condition,
-- COUNT(*) AS Patients
-- FROM hospital_data
-- GROUP BY Smoking_Status, Medical_Condition
-- ORDER BY Smoking_Status;

-- Query 10- AVERAGE AGE BY MEDICAL CONDITION
-- SELECT Medical_Condition,
-- ROUND(AVG(Age),2) AS Average_Age
-- FROM hospital_data
-- GROUP BY Medical_Condition
-- ORDER BY Average_Age DESC;

-- Query 11- CREATE AGE GROUPS
-- SELECT
-- CASE
-- WHEN Age < 18 THEN 'Child'
-- WHEN Age >= 18 AND Age <= 35 THEN 'Young Adult'
-- WHEN Age >= 36 AND Age <= 60 THEN 'Adult'
-- ELSE 'Senior'
-- END AS Age_Group,
-- COUNT(*) AS Total_Patients
-- FROM hospital_data
-- GROUP BY
-- CASE
-- WHEN Age < 18 THEN 'Child'
-- WHEN Age >= 18 AND Age <= 35 THEN 'Young Adult'
-- WHEN Age >= 36 AND Age <= 60 THEN 'Adult'
-- ELSE 'Senior'
-- END
-- ORDER BY COUNT(*) DESC;

-- Query 12- RANK() WINDOW FUNCTION
SELECT
    Medical_Condition,
    Total_Patients,
    RANK() OVER (ORDER BY Total_Patients DESC) AS Condition_Rank
FROM
(
    SELECT
        Medical_Condition,
        COUNT(*) AS Total_Patients
    FROM hospital_data
    GROUP BY Medical_Condition
) AS condition_summary; 





 







