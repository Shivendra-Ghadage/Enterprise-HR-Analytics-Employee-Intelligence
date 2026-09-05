-- Enterprise HR Analytics & Employee Intelligence
-- File: 06_intermediate_analysis.sql
use enterprise_hr_analytics;

-- Overall Attrition Rate
select
    count(*) as total_employees,
    sum(
        case
            when Attrition = 'Yes' then 1
            else 0
        end
    ) as employees_left,

    round(
        sum(case when Attrition = 'Yes' then 1 else 0 end)
        * 100.0 / count(*),
        2
    ) as attrition_rate
from employees;

-- Attrition by Department
select
    Department,
    count(*) as total_employees,
    sum(
        case
            when Attrition = 'Yes' then 1
            else 0
        end
    ) as employees_left,
    round(
        sum(case when Attrition = 'Yes' then 1 else 0 end)
        * 100.0 / count(*),
        2
    ) as attrition_rate
from employees
group by Department
order by attrition_rate desc;

-- Overtime vs Attrition
select
    OverTime,
    count(*) as total_employees,
    sum(
        case
            when Attrition = 'Yes' then 1
            else 0
        end
    ) as employees_left,
    round(
        sum(case when Attrition = 'Yes' then 1 else 0 end)
        * 100.0 / count(*),
        2
    ) as attrition_rate
from employees
group by OverTime
order by attrition_rate desc;

-- Job Role vs Attrition
select
    JobRole,
    count(*) as total_employees,
    sum(
        case
            when Attrition = 'Yes' then 1
            else 0
        end
    ) as employees_left,
    round(
        sum(case when Attrition = 'Yes' then 1 else 0 end)
        * 100.0 / count(*),
        2
    ) as attrition_rate
from employees
group by JobRole
order by attrition_rate desc;

-- Salary Band vs Attrition
select
    case
        when Salary < 50000 then 'Low Salary'
        when Salary < 100000 then 'Medium Salary'
        else 'High Salary'
    end as salary_band,
    count(*) as total_employees,
    sum(
        case
            when Attrition = 'Yes' then 1
            else 0
        end
    ) as employees_left,

    round(
        sum(case when Attrition = 'Yes' then 1 else 0 end)
        * 100.0 / count(*),
        2
    ) as attrition_rate
from employees
group by salary_band
order by attrition_rate desc;

-- Age Group vs Attrition
select
    case
        when Age < 25 then 'Under 25'
        when Age between 25 and 34 then '25-34'
        when Age between 35 and 44 then '35-44'
        when Age between 45 and 54 then '45-54'
        else '55+'
    end as age_group,
    count(*) as total_employees,
    sum(
        case
            when Attrition = 'Yes' then 1
            else 0
        end
    ) as employees_left,
    round(
        sum(case when Attrition = 'Yes' then 1 else 0 end)
        * 100.0 / count(*),
        2
    ) as attrition_rate
from employees
group by age_group
order by attrition_rate desc;

-- Job Satisfaction vs Attrition
select
    p.JobSatisfaction,
    count(distinct e.EmployeeID) as employee_count,
    sum(
        case
            when e.Attrition = 'Yes' then 1
            else 0
        end
    ) as employees_left,
    round(
        sum(case when e.Attrition = 'Yes' then 1 else 0 end)
        * 100.0
        / count(distinct e.EmployeeID),
        2
    ) as attrition_rate
from employees e
join performance_ratings p
    on e.EmployeeID = p.EmployeeID
group by p.JobSatisfaction
order by p.JobSatisfaction;

-- Work-Life Balance vs Attrition
select
    p.WorkLifeBalance,
    count(distinct e.EmployeeID) as employee_count,
    sum(
        case
            when e.Attrition = 'Yes' then 1
            else 0
        end
    ) as employees_left,
    round(
        sum(case when e.Attrition = 'Yes' then 1 else 0 end)
        * 100.0
        / count(distinct e.EmployeeID),
        2
    ) as attrition_rate
from employees e
join performance_ratings p
    on e.EmployeeID = p.EmployeeID
group by p.WorkLifeBalance
order by p.WorkLifeBalance;

-- Employee Performance Summary
select
    e.EmployeeID,
    e.FirstName,
    e.LastName,
    e.Department,
    e.JobRole,

    round(avg(p.SelfRating), 2) as avg_self_rating,
    round(avg(p.ManagerRating), 2) as avg_manager_rating,
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
    
-- Department Performance
select
    e.Department,
    count(distinct e.EmployeeID) as employee_count,
    round(avg(p.SelfRating), 2) as avg_self_rating,
    round(avg(p.ManagerRating), 2) as avg_manager_rating
from employees e
join performance_ratings p
    on e.EmployeeID = p.EmployeeID
group by e.Department
order by avg_manager_rating desc;