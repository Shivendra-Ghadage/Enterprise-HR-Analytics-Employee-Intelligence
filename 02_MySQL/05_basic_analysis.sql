-- Enterprise HR Analytics & Employee Intelligence
-- File: 05_basic_analysis.sql
use enterprise_hr_analytics;

-- Employees by Gender
select
    Gender,
    count(*) as employee_count
from employees
group by Gender
order by employee_count desc;

-- Employees by Department
select
    Department,
    count(*) as employee_count
from employees
group by Department
order by employee_count desc;

-- Employees by Job Role
select
    JobRole,
    count(*) as employee_count
from employees
group by JobRole
order by employee_count desc;

-- Employees by Business Travel
select
    BusinessTravel,
    count(*) as employee_count
from employees
group by BusinessTravel
order by employee_count desc;

-- 5. Employees by Marital Status
select
    MaritalStatus,
    count(*) as employee_count
from employees
group by MaritalStatus
order by employee_count desc;

-- Overtime Distribution
select
    OverTime,
    count(*) as employee_count
from employees
group by OverTime
order by employee_count desc;

-- Attrition Distribution
select
    Attrition,
    count(*) as employee_count
from employees
group by Attrition;

-- Salary Statistics
select
    min(Salary) as minimum_salary,
    max(Salary) as maximum_salary,
    round(avg(Salary), 2) as average_salary
from employees;

-- Average Salary by Department
select
    Department,
    round(avg(Salary), 2) as average_salary
from employees
group by Department
order by average_salary desc;

-- Average Age by Department
select
    Department,
    round(avg(Age), 2) as average_age
from employees
group by Department
order by average_age desc;