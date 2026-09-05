-- Enterprise HR Analytics & Employee Intelligence
-- File: 04_data_validation.sql
use enterprise_hr_analytics;

-- Employee Record Count
select count(*) as employee_count
from employees;

-- Performance Record Count
select count(*) as performance_count
from performance_ratings;

-- Duplicate Employee IDs
select 
	EmployeeID,
	count(*) as duplicate_count
from employees
group by EmployeeID
having count(*)>1;

-- Duplicate performance IDs
select 
	PerformanceID,
	count(*) as duplicate_count
from performance_ratings
group by PerformanceID
having count(*)>1;

-- Missing Employee IDs
select count(*) as missing_employee_id
from employees
where EmployeeID is null;

-- Missing Performance Employee IDs
select count(*) as missing_employee_id
from performance_ratings
where EmployeeID is null;

-- Unmatched Employee IDs
select count(*) as unmatched_records
from performance_ratings p
left join employees e
    on p.EmployeeID = e.EmployeeID
where e.EmployeeID is null;

-- Missing Salary
select count(*) as missing_salary
from employees
where Salary is null;

-- Invalid Age
select *
from employees
where Age < 18
   or Age > 70;

-- Invalid Salary
select *
from employees
where Salary <= 0;

-- Invalid Satisfaction Ratings
select *
from performance_ratings
where EnvironmentSatisfaction not between 1 and 4
   or JobSatisfaction not between 1 and 4
   or RelationshipSatisfaction not between 1 and 4
   or WorkLifeBalance not between 1 and 4;
   
-- Check Self Rating Values
select distinct SelfRating
from performance_ratings
order by SelfRating;

-- Check Manager Rating Values
select distinct ManagerRating
from performance_ratings
order by ManagerRating;