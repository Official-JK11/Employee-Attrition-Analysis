-- Databricks notebook source

-- Employee Table
SELECT * FROM emp_attr

-- COMMAND ----------

-- Total Employee Count
SELECT sum(EmployeeCount) FROM emp_atrr

-- COMMAND ----------

-- Find Attrition Count
SELECT sum(EmployeeCount), Attrition FROM emp_atrr GROUP BY 2

-- COMMAND ----------

-- Attrition by Age analysis
SELECT sum(EmployeeCount),
CASE WHEN age BETWEEN 20 and 25 THEN "20-25" WHEN Age BETWEEN 26 AND 32 THEN "26-32" WHEN Age BETWEEN 33 AND 40 THEN "33-40" ELSE "40+" END age_group
FROM emp_atrr
WHERE attrition = 'Yes'
GROUP BY 2

-- COMMAND ----------

-- Attrition by Department Analysis
SELECT sum(EmployeeCount), Department FROM emp_atrr
WHERE attrition = 'Yes'
GROUP BY Department


-- COMMAND ----------

-- Attrition by Education Analysis(1-Below College, 2-College, 3-Bachelor, 4-Master, 5-Doctor)
SELECT sum(EmployeeCount) AS Employee_Count,
CASE WHEN Education=1 THEN 'BELOW COLLEGE' WHEN Education=2 THEN 'COLLEGE' WHEN Education=3 THEN 'BACHELORS' WHEN Education=4 THEN 'MASTER' ELSE 'DOCTOR' END education 
FROM emp_atrr
WHERE Attrition = 'Yes'
GROUP BY Education

-- COMMAND ----------

-- Attrition by Environment Satisfaction
SELECT sum(EmployeeCount) AS Employee_Count,
CASE WHEN  EnvironmentSatisfaction=1 THEN 'LOW' WHEN EnvironmentSatisfaction=2 THEN 'MEDIUM' WHEN EnvironmentSatisfaction=3 THEN 'HIGH'  ELSE 'HIGHLY SATISFIED' END Environment_Satisfaction 
FROM emp_atrr
WHERE Attrition = 'Yes'
GROUP BY EnvironmentSatisfaction

-- COMMAND ----------

-- Attrition By Business Travel Analysis
SELECT sum(EmployeeCount), BusinessTravel FROM emp_atrr
WHERE attrition = 'Yes'
GROUP BY BusinessTravel


-- COMMAND ----------

-- Insights we got
-- 1. Employees of age group 26-32 were leaving the organization.
-- 2. Employees from R&D Department were leaving the organization.
-- 3. 41.7% Employees with bachelors degree were leaving the organization.
-- 4. Majority of employees leaving the organizaiton mentioned low satisfaction towards working environment.
-- 5. Majority of employees leaving the organization travel rarely.

