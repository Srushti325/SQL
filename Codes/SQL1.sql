-- CREATE TABLE
CREATE TABLE job_applied (
    job_id INT,
    application_sent_date DATE,
    custom_resume BOOLEAN,
    resume_file_name VARCHAR(255),
    cover_letter_sent BOOLEAN,
    cover_letter_file_name VARCHAR(255),
    status VARCHAR(50)
);

-- DELETE TABLE
DROP TABLE jobs_applied
-- SHOW TABLE
SELECT *
FROM job_applied;

-- INSERT VALUES IN THE TABLE
INSERT INTO job_applied (
    job_id,
    application_sent_date,
    custom_resume,
    resume_file_name,
    cover_letter_sent,
    cover_letter_file_name,
    status
)
VALUES (
    1,
    '2022-01-01',
    TRUE,
    'resume1.pdf',
    TRUE,
    'cover_letter1.pdf',
    'Applied'    
),
(
    2,
    '2022-01-02',
    FALSE,
    'resume2.pdf',
    FALSE,
    'cover_letter2.pdf',
    'Applied'
)
-- SHOW TABLE
SELECT *
FROM job_applied;

-- ALTER TABLE (ADD COLUMN)
ALTER TABLE job_applied
ADD contact VARCHAR(50);
-- SHOW TABLE
SELECT * 
FROM job_applied

-- UPDATE(1) 
UPDATE job_applied
SET contact = 'SRUSHTI KULKARNI'
WHERE job_id = 1;
-- UPDATE(2)
UPDATE job_applied
SET contact = 'AYUSH PATIL'
WHERE job_id = 2;
-- SHOW TABLE
SELECT *
FROM job_applied;

-- ALTER TABLE (RENAME COLUMN)
ALTER TABLE job_applied
RENAME COLUMN contact TO contact_person
-- SHOW TABLE
SELECT *
FROM job_applied

-- ALTER TABLE (CHANGE COLUMN DATATYPE)
ALTER TABLE job_applied
ALTER COLUMN contact_person TYPE TEXT
-- SHOW TABLE
SELECT *
FROM job_applied;

-- ALTER TABLE (DROP COLUMN)
ALTER TABLE job_applied
DROP COLUMN contact_person;
-- SHOW TABLE
SELECT *
FROM job_applied;

