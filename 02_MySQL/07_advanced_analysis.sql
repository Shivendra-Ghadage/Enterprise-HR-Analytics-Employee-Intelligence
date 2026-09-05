-- Enterprise HR Analytics & Employee Intelligence
-- File: 07_advanced_analysis.sql

use enterprise_hr_analytics;

-- Rank Employees by Salary Within Department
select
    EmployeeID,
    FirstName,
    LastName,
    Department,
    Salary,

    dense_rank() over(
        partition by Department
        order by Salary desc
    ) as salary_rank
from employees;

-- Top 3 Highest-Paid Employees per Department
with ranked_employees as (
    select
        EmployeeID,
        FirstName,
        LastName,
        Department,
        Salary,
        dense_rank() over (
            partition by Department
            order by Salary desc
        ) as salary_rank
    from employees
)
select *
from ranked_employees
where salary_rank <= 3
order by Department, salary_rank;

-- Employee Performance Summary
select
    e.EmployeeID,
    e.FirstName,
    e.LastName,
    e.Department,
    e.JobRole,
    round(avg(p.SelfRating), 2) as avg_self_rating,
    round(avg(p.ManagerRating), 2) as avg_manager_rating,
    round(
        avg(p.SelfRating - p.ManagerRating),
        2
    ) as average_rating_gap,
    count(p.PerformanceID) as review_count
from employees e
join performance_ratings p
    on e.EmployeeID = p.EmployeeID
group by
    e.EmployeeID,
    e.FirstName,
    e.LastName,
    e.Department,
    e.JobRole;
    
-- Highest-Performing Employees
select
    e.EmployeeID,
    e.FirstName,
    e.LastName,
    e.Department,
    e.JobRole,
    round(
        avg(p.ManagerRating),
        2
    ) as avg_manager_rating
from employees e
join performance_ratings p
    on e.EmployeeID = p.EmployeeID
group by
    e.EmployeeID,
    e.FirstName,
    e.LastName,
    e.Department,
    e.JobRole
order by avg_manager_rating desc
limit 20;

-- Self Rating vs Manager Rating
select
    SelfRating,
    ManagerRating,
    count(*) as rating_count
from performance_ratings
group by
    SelfRating,
    ManagerRating
order by
    SelfRating,
    ManagerRating;

-- Training Opportunities vs Performance
select
    TrainingOpportunitiesTaken,
    count(*) as review_count,
    round(
        avg(SelfRating),
        2
    ) as avg_self_rating,
    round(
        avg(ManagerRating),
        2
    ) as avg_manager_rating
from performance_ratings
group by TrainingOpportunitiesTaken
order by TrainingOpportunitiesTaken;

-- Employees with Long Promotion Gaps
select
    EmployeeID,
    FirstName,
    LastName,
    Department,
    JobRole,
    YearsAtCompany,
    YearsSinceLastPromotion
from employees
where YearsSinceLastPromotion >= 5
order by YearsSinceLastPromotion desc;

-- Employees with Long Current Manager Relationships
select
    EmployeeID,
    FirstName,
    LastName,
    Department,
    JobRole,
    YearsWithCurrManager
from employees
order by YearsWithCurrManager desc
limit 20;

-- Attrition + Performance Analysis
select
    e.Attrition,
    count(distinct e.EmployeeID) as employee_count,
    round(
        avg(p.SelfRating),
        2
    ) as avg_self_rating,
    round(
        avg(p.ManagerRating),
        2
    ) as avg_manager_rating
from employees e
join performance_ratings p
    on e.EmployeeID = p.EmployeeID
group by e.Attrition;

-- Final HR Employee Intelligence Dataset
select
    e.EmployeeID,
    e.FirstName,
    e.LastName,
    e.Gender,
    e.Age,
    e.Department,
    e.JobRole,
    e.Salary,
    e.OverTime,
    e.YearsAtCompany,
    e.YearsSinceLastPromotion,
    e.Attrition,
    round(avg(p.SelfRating), 2) as avg_self_rating,
    round(avg(p.ManagerRating), 2) as avg_manager_rating,
    round(avg(p.JobSatisfaction), 2) as avg_job_satisfaction,
    round(avg(p.WorkLifeBalance), 2) as avg_work_life_balance,
    count(p.PerformanceID) as review_count
from employees e
left join performance_ratings p
    on e.EmployeeID = p.EmployeeID
group by
    e.EmployeeID,
    e.FirstName,
    e.LastName,
    e.Gender,
    e.Age,
    e.Department,
    e.JobRole,
    e.Salary,
    e.OverTime,
    e.YearsAtCompany,
    e.YearsSinceLastPromotion,
    e.Attrition;