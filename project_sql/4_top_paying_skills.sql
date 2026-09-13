/*
Answer: What are the top skills based on salary?
- Look at the average salary associated with each skill for Data Analyst positions
- Focuses on roles with specified salaries, regardless of location
- Why? It reveals how different skills impact salary levels for Data Analysts and
  helps identify the most financially rewarding skills to acquire or improve
*/

_____

SELECT
    skills,
    ROUND(AVG(salary_year_avg), 0) AS avg_salary
FROM 
    job_postings_fact
INNER JOIN
    skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN
    skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
    AND job_work_from_home = True
GROUP BY
    skills
ORDER BY
    avg_salary DESC
LIMIT 25
;

_____

/*

Quick trends from the top 25

1. Big-data and distributed computing skills dominate the very top.
PySpark is #1 at $208K, followed by Databricks at $142K, Airflow at $126K, and related infrastructure skills. This suggests that analysts who can work with large-scale data environments command higher salaries.

2. Python's ecosystem is strongly represented.
You have:

PySpark — $208K
Jupyter — $153K
Pandas — $152K
NumPy — $144K
Scikit-learn — $126K

This is important because employers aren't simply paying for “Python”; they're paying for the ability to use Python for data manipulation, analysis, and machine learning workflows.

3. Software-engineering skills are associated with higher-paying roles.
Bitbucket ($189K), GitLab ($155K), Linux ($137K), Kubernetes ($133K), Jenkins ($125K), Scala ($125K), and Golang ($145K) stand out.

That suggests a trend toward data analysts working closer to engineering teams and production data systems.

4. Cloud and data infrastructure appear repeatedly.
Databricks, GCP, Kubernetes, Elasticsearch, PostgreSQL, and Airflow all point toward modern data infrastructure.

So the highest-paying "data analyst" jobs aren't necessarily traditional analysts sitting exclusively in Excel/Tableau. Many appear to be hybrid analytics + data engineering/technical roles.

5. Machine-learning/AI-related tooling is present.
DataRobot, Watson, scikit-learn, PySpark and Databricks indicate that some of the highest-paying positions overlap with ML/AI workflows.

The biggest takeaway

There appears to be a progression:

Traditional Data Analyst
→ SQL + Excel + Tableau/Power BI

Advanced Analyst
→ SQL + Python + Pandas + NumPy + BI

Highly Technical / High-Paying Analyst
→ Python + PySpark + Databricks + cloud + Git + Linux + data pipelines + ML

So I would not interpret this list as “learn PySpark immediately because it pays $208K.” 
The salary is likely reflecting the type of role and its technical complexity, 
not PySpark alone causing the salary.

For someone starting out, the useful distinction is:

SQL gets you into data analytics. Python makes you stronger. 
Engineering/data-platform skills can push you toward the higher-paying end of the market.

And notably, SQL, Excel, Tableau, 
and Power BI don't appear in this top-25 highest-paying-skills list despite being among the most demanded skills. 
That is a very useful finding: the most demanded skills and the highest-paying skills are not necessarily the same skills.

_____

[
  {
    "skills": "pyspark",
    "avg_salary": "208172"
  },
  {
    "skills": "bitbucket",
    "avg_salary": "189155"
  },
  {
    "skills": "couchbase",
    "avg_salary": "160515"
  },
  {
    "skills": "watson",
    "avg_salary": "160515"
  },
  {
    "skills": "datarobot",
    "avg_salary": "155486"
  },
  {
    "skills": "gitlab",
    "avg_salary": "154500"
  },
  {
    "skills": "swift",
    "avg_salary": "153750"
  },
  {
    "skills": "jupyter",
    "avg_salary": "152777"
  },
  {
    "skills": "pandas",
    "avg_salary": "151821"
  },
  {
    "skills": "elasticsearch",
    "avg_salary": "145000"
  },
  {
    "skills": "golang",
    "avg_salary": "145000"
  },
  {
    "skills": "numpy",
    "avg_salary": "143513"
  },
  {
    "skills": "databricks",
    "avg_salary": "141907"
  },
  {
    "skills": "linux",
    "avg_salary": "136508"
  },
  {
    "skills": "kubernetes",
    "avg_salary": "132500"
  },
  {
    "skills": "atlassian",
    "avg_salary": "131162"
  },
  {
    "skills": "twilio",
    "avg_salary": "127000"
  },
  {
    "skills": "airflow",
    "avg_salary": "126103"
  },
  {
    "skills": "scikit-learn",
    "avg_salary": "125781"
  },
  {
    "skills": "jenkins",
    "avg_salary": "125436"
  },
  {
    "skills": "notion",
    "avg_salary": "125000"
  },
  {
    "skills": "scala",
    "avg_salary": "124903"
  },
  {
    "skills": "postgresql",
    "avg_salary": "123879"
  },
  {
    "skills": "gcp",
    "avg_salary": "122500"
  },
  {
    "skills": "microstrategy",
    "avg_salary": "121619"
  }
]

*/