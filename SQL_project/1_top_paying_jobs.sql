/*
Question: What are the top paying Data Analyst Jobs?
- Identify the top paying Data Analyst roles that are available remotely
- Focus on job postings with specific salary (remove NULLs)
- Also mention the company names
- Why? Highlight the top paying opportunities for Data Analyst offering insights into employee salary, skills and many more
*/

SELECT 
    job_id,
    job_title,
    salary_year_avg,
    name AS comapny_name
FROM
    job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE 
    job_title_short = 'Data Analyst' AND 
    job_location = 'Anywhere' AND
    salary_year_avg IS NOT NULL
ORDER BY
    salary_year_avg DESC
LIMIT 10;