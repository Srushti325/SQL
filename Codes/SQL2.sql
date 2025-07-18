-- SHOW TABLE
SELECT job_posted_date
FROM job_postings_fact
LIMIT 10

-- :: DATE
SELECT 
    job_title_short AS Title,
    job_location AS Location,
    job_posted_date :: DATE AS Date
FROM 
    job_postings_fact
LIMIT 100;

-- AT TIME ZONE
SELECT 
    job_title_short AS Title,
    job_location AS Location,
    job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'EST' AS date_time
FROM 
    job_postings_fact
LIMIT 5;


-- EXTRACT (MONTH or YEAR or DATE)
SELECT 
    job_title_short AS Title,
    job_location AS Location,
    job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'EST' AS date_time,
    EXTRACT(MONTH FROM job_posted_date) AS month,
    EXTRACT(YEAR FROM job_posted_date) AS year
FROM 
    job_postings_fact
LIMIT 5;


--  Question- How job_postings vary month on month
SELECT
    COUNT(job_id) AS count_of_jobs,
    EXTRACT(MONTH FROM job_posted_date) AS month
FROM
    job_postings_fact
GROUP BY
    month
ORDER BY 
    count_of_jobs DESC;

-- QUESTION: CREATE 2 TABLES
-- TABLE 1: Jan 2023 Jobs
-- TABLE 2: Feb 2023 Jobs
-- TABLE 3: Mar 2023 Jobs

CREATE TABLE january_jobs AS
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 1;

CREATE TABLE february_jobs AS
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 2;

CREATE TABLE march_jobs AS
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 3;

SELECT 
    job_posted_date
FROM
    march_jobs;


-- QUESTION: CREATE COLUMN WHERE THE JOB LOCATIONS MENTIONED BELOW ARE REPLACED WITH THE RESPECTIVE NAMES
-- 'Anywhere' jobs as 'Remote'
-- 'New York, NY' jobs as 'Local'
-- Otherwise 'Onsite'
SELECT 
    job_title_short,
    job_location,
    CASE
        WHEN job_location = 'Anywhere' THEN 'Remote'
        WHEN job_location = 'New York, NY' THEN 'Local'
    ELSE 'Onsite'
END AS location_category
FROM job_postings_fact;

-- QUESTION: Now check how many jobs are there in total for all the categories and then specificly for 'Data Analyst'
SELECT 
    COUNT(job_id) AS number_of_jobs,
    CASE
        WHEN job_location = 'Anywhere' THEN 'Remote'
        WHEN job_location = 'New York, NY' THEN 'Local'
    ELSE 'Onsite'
END AS location_category
FROM 
    job_postings_fact
WHERE
    job_title_short = 'Data Analyst'
GROUP BY
    location_category;


-- SUBQUERIES
SELECT *
FROM (
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 1
) AS j_jobs

-- CTEs
WITH j_jan_jobs AS (
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 1
)
SELECT *
FROM j_jan_jobs

-- QUESTION: Count the number of remote jobs postings per skill



-- UNION
SELECT
    job_title_short,
    company_id,
    job_location
FROM 
    january_jobs

UNION

SELECT
    job_title_short,
    company_id,
    job_location
FROM february_jobs

UNION

SELECT
    job_title_short,
    company_id,
    job_location
FROM march_jobs


-- UNION ALL
SELECT
    job_title_short,
    company_id,
    job_location
FROM 
    january_jobs

UNION ALL

SELECT
    job_title_short,
    company_id,
    job_location
FROM february_jobs

UNION ALL

SELECT
    job_title_short,
    company_id,
    job_location
FROM march_jobs