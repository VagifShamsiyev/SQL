/*
Answer: What are the most optimal skills to learn (aka it's in high demand and a high-paying skill)?
- Identify skills in high demand and associated with high average salaries for Data Analyst roles
- Concentrates on remote positions with specified salaries
- Why? Targets skills that offer job security (high demand) and financial benefits (high salaries),
  offering strategic insights for career development in data analysis
*/

_____

SELECT
    skills_dim.skill_id,
    skills_dim.skills,
    COUNT(skills_job_dim.job_id) AS demand_count,
    ROUND(AVG(job_postings_fact.salary_year_avg), 0) AS avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
    AND job_work_from_home = True
GROUP BY
    skills_dim.skill_id
HAVING
    COUNT(skills_job_dim.job_id) > 10
ORDER BY
    avg_salary DESC,
    demand_count DESC
LIMIT 25;

_____

/*

| Skill     | Demand | Avg. salary |
| --------- | -----: | ----------: |
| Python    |    236 |    $101,397 |
| Tableau   |    230 |     $99,288 |
| R         |    148 |    $100,499 |
| SAS       |     63 |     $98,902 |
| Looker    |     49 |    $103,795 |
| Snowflake |     37 |    $112,948 |
| Oracle    |     37 |    $104,534 |
| Azure     |     34 |    $111,225 |
| AWS       |     32 |    $108,317 |
| Go        |     27 |    $115,320 |
| Hadoop    |     22 |    $113,193 |

The main trend

There is a clear trade-off between demand and specialization.

Python and Tableau are among the most frequently requested skills, but their average salaries are around $99K–$101K. Meanwhile, less-common skills such as Go, Hadoop, Snowflake, Azure, and AWS have noticeably higher average salaries.

That suggests:

High demand → broader analyst market → moderate salary

Lower demand + technical specialization → narrower market → higher salary

Cloud/data-platform skills are particularly interesting

Snowflake, Azure, AWS, and BigQuery all have salaries above roughly $108K–$113K, 
while their demand counts are much lower than Python/Tableau.

That's consistent with the idea that employers pay more for analysts who can work with modern data infrastructure, 
not just analyze already-prepared data.

Python is the interesting middle ground

Python has 236 postings, essentially matching Tableau's 230, but its average salary is slightly higher.

So Python looks like a particularly strong skill because it combines:

high demand + broad applicability + decent salary

That's a much better risk/reward profile than learning something like Go purely because its average salary is higher.

One caution about these numbers

Don't interpret:

"Go pays $115K, therefore learning Go will make me earn $115K."

The salary is associated with jobs that mention the skill, 
and those jobs may already be more technical or senior. 
The skill itself isn't necessarily causing the higher salary.

There's also a data-quality issue here: 
SAS appears twice with identical demand/salary values, 
probably because it exists under two skill IDs. 
That should be deduplicated before doing further analysis.

For your learning strategy

Looking across all the datasets you've shown me, I'd separate skills into:

Best foundation:
SQL, Python, Excel, Tableau/Power BI

Best specialization for higher-paying technical roles:
Snowflake, AWS/Azure, Databricks, Spark/PySpark, Airflow

Not worth prioritizing just because salary is high:
Go, C++, Java, Scala, Kubernetes, etc., 
unless you're deliberately moving toward data engineering/software engineering.

The most interesting pattern across your datasets is that SQL is extremely demanded, 
while the highest-paying skills tend to be the more specialized technical/data-engineering skills built on top of that foundation.

_____

[
  {
    "skill_id": 8,
    "skills": "go",
    "demand_count": "27",
    "avg_salary": "115320"
  },
  {
    "skill_id": 234,
    "skills": "confluence",
    "demand_count": "11",
    "avg_salary": "114210"
  },
  {
    "skill_id": 97,
    "skills": "hadoop",
    "demand_count": "22",
    "avg_salary": "113193"
  },
  {
    "skill_id": 80,
    "skills": "snowflake",
    "demand_count": "37",
    "avg_salary": "112948"
  },
  {
    "skill_id": 74,
    "skills": "azure",
    "demand_count": "34",
    "avg_salary": "111225"
  },
  {
    "skill_id": 77,
    "skills": "bigquery",
    "demand_count": "13",
    "avg_salary": "109654"
  },
  {
    "skill_id": 76,
    "skills": "aws",
    "demand_count": "32",
    "avg_salary": "108317"
  },
  {
    "skill_id": 4,
    "skills": "java",
    "demand_count": "17",
    "avg_salary": "106906"
  },
  {
    "skill_id": 194,
    "skills": "ssis",
    "demand_count": "12",
    "avg_salary": "106683"
  },
  {
    "skill_id": 233,
    "skills": "jira",
    "demand_count": "20",
    "avg_salary": "104918"
  },
  {
    "skill_id": 79,
    "skills": "oracle",
    "demand_count": "37",
    "avg_salary": "104534"
  },
  {
    "skill_id": 185,
    "skills": "looker",
    "demand_count": "49",
    "avg_salary": "103795"
  },
  {
    "skill_id": 2,
    "skills": "nosql",
    "demand_count": "13",
    "avg_salary": "101414"
  },
  {
    "skill_id": 1,
    "skills": "python",
    "demand_count": "236",
    "avg_salary": "101397"
  },
  {
    "skill_id": 5,
    "skills": "r",
    "demand_count": "148",
    "avg_salary": "100499"
  },
  {
    "skill_id": 78,
    "skills": "redshift",
    "demand_count": "16",
    "avg_salary": "99936"
  },
  {
    "skill_id": 187,
    "skills": "qlik",
    "demand_count": "13",
    "avg_salary": "99631"
  },
  {
    "skill_id": 182,
    "skills": "tableau",
    "demand_count": "230",
    "avg_salary": "99288"
  },
  {
    "skill_id": 197,
    "skills": "ssrs",
    "demand_count": "14",
    "avg_salary": "99171"
  },
  {
    "skill_id": 92,
    "skills": "spark",
    "demand_count": "13",
    "avg_salary": "99077"
  },
  {
    "skill_id": 13,
    "skills": "c++",
    "demand_count": "11",
    "avg_salary": "98958"
  },
  {
    "skill_id": 186,
    "skills": "sas",
    "demand_count": "63",
    "avg_salary": "98902"
  },
  {
    "skill_id": 7,
    "skills": "sas",
    "demand_count": "63",
    "avg_salary": "98902"
  },
  {
    "skill_id": 61,
    "skills": "sql server",
    "demand_count": "35",
    "avg_salary": "97786"
  },
  {
    "skill_id": 9,
    "skills": "javascript",
    "demand_count": "20",
    "avg_salary": "97587"
  }
]

*/