-- Enterprise HR Analytics & Employee Intelligence
-- File: 03_load_data.sql
use enterprise_hr_analytics;

-- Verify Employee Data
select count(*) as employee_count
from employees;

-- Verify Performance Data
select count(*) as performance_count
from performance_ratings;

-- Preview Employee Data
select *
from employees
limit 10;

alter table performance_ratings
modify column ReviewDate varchar(20);

truncate table performance_ratings;

-- Preview Performance Data
select*
from performance_ratings
limit 10;

select ReviewDate
from performance_ratings
limit 10;

-- Convert ReviewDate from Text to DATE
SET SQL_SAFE_UPDATES = 0;
update performance_ratings
set ReviewDate = date_format(
    str_to_date(ReviewDate, '%m/%d/%Y'),
    '%Y-%m-%d'
)
where PerformanceID is not null;

-- Verify ReviewDate
select
    PerformanceID,
    EmployeeID,
    ReviewDate
from performance_ratings
limit 10;
SET SQL_SAFE_UPDATES = 1;

-- Change ReviewDate to DATE
alter table performance_ratings
modify column ReviewDate date;

-- Check Performance Table Structure
describe performance_ratings;
