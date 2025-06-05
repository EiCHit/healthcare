USE healthcare;

SELECT * 
FROM hospinfo;

SELECT COUNT(*) AS Total_Hospitals
FROM hospinfo;

-- Number of hospitals per state
SELECT State, COUNT(*) AS Hospital_Count
FROM hospinfo
GROUP BY State
ORDER BY Hospital_Count DESC;

-- Number of hospitals by type
SELECT Hospital_Type, COUNT(*) Count
FROM hospinfo
GROUP BY Hospital_Type
ORDER BY Count DESC;

-- Number of hospitals by ownership
SELECT Hospital_Ownership, COUNT(*) Count
FROM hospinfo
GROUP BY Hospital_Ownership
ORDER BY Count DESC;

-- Hospitals with and without Emergency Services
SELECT Emergency_Services, COUNT(*) Count
FROM hospinfo
GROUP BY Emergency_Services;

-- Average hospital overall rating by state
SELECT state, ROUND(AVG(overall_rating)) AS avg_rating
FROM hospinfo
WHERE overall_rating IS NOT NULL
GROUP BY state
ORDER BY avg_rating DESC;

-- Lowest-rated hospitals (top 10)
SELECT hospital_name, state, overall_rating
FROM hospinfo
WHERE overall_rating
ORDER BY overall_rating DESC
LIMIT 10;

-- Mortality performance breakdown
SELECT mortality_rating, COUNT(*) AS count
FROM hospinfo
GROUP BY mortality_rating;

-- Timeliness of care breakdown
SELECT timeliness_care_cmp, COUNT(*) AS count
FROM hospinfo
GROUP BY timeliness_care_cmp;

-- Top 5 states with most hospitals rated "Above the national average" for mortality
SELECT state, COUNT(*) AS Above_Avg_Mortality
FROM hospinfo
WHERE mortality_rating = 'Above the national average'
GROUP BY state
ORDER BY Above_Avg_Mortality DESC
LIMIT 5;

-- Average rating by hospital ownership type 
SELECT Hospital_Ownership, ROUND(AVG(overall_rating)) AS avg_rating
FROM hospinfo
WHERE overall_rating 
GROUP BY Hospital_Ownership
ORDER BY avg_rating DESC;

-- Hospitals with below average patient experience
SELECT Hospital_Name, State, patient_exp_comparison
FROM hospinfo
WHERE patient_exp_comparison = 'Below the national average';	

-- Imaging effectiveness comparison breakdown
SELECT effectiveness_comparison, COUNT(*) AS Count
FROM hospinfo
GROUP BY effectiveness_comparison;

-- Count how many rows have empty or NULL  
SELECT
  COUNT(*) AS Total_Rows,
  COUNT(CASE WHEN ehr_status IS NULL OR ehr_status = '' THEN 1 END) AS Empty_Or_NULL,
  COUNT(CASE WHEN ehr_status IS NOT NULL AND ehr_status <> '' THEN 1 END) AS Non_Empty
FROM hospinfo;

-- Filter queries to exclude empty/null
SELECT
  CASE
    WHEN ehr_status IS NULL OR ehr_status = '' THEN 'Unknown'
    ELSE ehr_status
  END as ehr_status,
  COUNT(*) AS Count
FROM hospinfo
GROUP BY ehr_status;

-- Update table to replace empty with NULL or default value 
UPDATE hospinfo
SET ehr_status = 'Unknown'
WHERE ehr_status IS NULL OR ehr_status = '';




