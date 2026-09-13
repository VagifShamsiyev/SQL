/*
Question: What are the most in-demand skills for data analysts?
- Join job postings to inner join table similar to query 2
- Identify the top 5 in-demand skills for a data analyst.
- Focus on all job postings.
- Why? Retrieves the top 5 skills with the highest demand in the job market,
  providing insights into the most valuable skills for job seekers.
*/

_____

SELECT
    skills,
    COUNT(skills_job_dim.job_id) AS demand_count
FROM 
    job_postings_fact
INNER JOIN
    skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN
    skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst'
    AND job_work_from_home = True
GROUP BY
    skills
ORDER BY
    demand_count DESC
LIMIT 5
;

_____

/*
| Rank | Skill        | Demand count |
| ---: | ------------ | -----------: |
|    1 | **SQL**      |        7,291 |
|    2 | **Excel**    |        4,611 |
|    3 | **Python**   |        4,330 |
|    4 | **Tableau**  |        3,745 |
|    5 | **Power BI** |        2,609 |

Key insight

SQL is clearly the #1 skill. 
It appears 7,291 times, substantially ahead of Excel at 4,611.

The ranking gives a useful picture of the current analyst toolkit:

SQL → Excel → Python → Tableau → Power BI

For your learning path, this suggests that SQL should be a priority, followed by Python and a BI/visualization tool. 
Excel also remains highly demanded, so it shouldn't be treated as obsolete.

[
  {
    "skills": "sql",
    "demand_count": "7291"
  },
  {
    "skills": "excel",
    "demand_count": "4611"
  },
  {
    "skills": "python",
    "demand_count": "4330"
  },
  {
    "skills": "tableau",
    "demand_count": "3745"
  },
  {
    "skills": "power bi",
    "demand_count": "2609"
  }
]

*/
