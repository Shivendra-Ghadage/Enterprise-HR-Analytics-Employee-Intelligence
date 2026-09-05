-- Enterprise HR Analytics & Employee Intelligence
-- Phase 3: MySQL Database Implementation
-- File: 02_create_tables.sql

-- Select the project database
Use enterprise_hr_analytics;

-- Table 1: employees

create table if not exists employees (
    EmployeeID varchar(20) not null,
    FirstName varchar(50),
    LastName varchar(50),
    Gender varchar(20),
    Age int,
    BusinessTravel varchar(50),
    Department varchar(100),
    DistanceFromHome_KM int,
    State varchar(100),
    Ethnicity varchar(100),
    Education int,
    EducationField varchar(100),
    JobRole varchar(100),
    MaritalStatus varchar(50),
    Salary decimal(12,2),
    StockOptionLevel int,
    OverTime varchar(20),
    HireDate date,
    Attrition varchar(10),
    YearsAtCompany int,
    YearsInMostRecentRole int,
    YearsSinceLastPromotion int,
    YearsWithCurrManager int,

    constraint pk_employees
        primary key (EmployeeID)
);

-- Table 2: performance_ratings

create table if not exists performance_ratings (
    PerformanceID varchar(20) not null,
    EmployeeID varchar(20) not null,
    ReviewDate date,
    EnvironmentSatisfaction int,
    JobSatisfaction int,
    RelationshipSatisfaction int,
    TrainingOpportunitiesWithinYear int,
    TrainingOpportunitiesTaken int,
    WorkLifeBalance int,
    SelfRating int,
    ManagerRating int,

    constraint pk_performance_ratings
        primary key (PerformanceID),

    constraint fk_performance_employee
        foreign key (EmployeeID)
        references employees(EmployeeID)
);

-- Verify tables
show tables;

-- Verify the structure
describe employees;
describe performance_ratings;