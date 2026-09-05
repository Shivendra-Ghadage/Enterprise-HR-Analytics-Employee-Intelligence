# Enterprise HR Analytics & Employee Intelligence

## Data Dictionary

This document describes the structure, meaning, and business purpose of the
datasets used in the Enterprise HR Analytics & Employee Intelligence project.

The project uses two source CSV files obtained from Kaggle:

1. Employee.csv
2. PerformanceRating.csv

---

# 1. Dataset Overview

| File | Description |
|---|---|
| Employee.csv | Contains employee-level demographic, employment, compensation, career, and attrition information |
| PerformanceRating.csv | Contains employee performance review, satisfaction, training, and rating information |

---

# 2. Employee.csv

## Description

`Employee.csv` is the primary employee-level dataset.

Each row represents one employee.

### Primary Key

`EmployeeID`

### Number of Columns

23

---

## Employee Table Columns

| # | Column Name | Data Type | Description | Business Purpose |
|---:|---|---|---|---|
| 1 | EmployeeID | VARCHAR | Unique identifier assigned to each employee | Used to uniquely identify employees and connect employee data with performance records |
| 2 | FirstName | VARCHAR | Employee's first name | Employee identification |
| 3 | LastName | VARCHAR | Employee's last name | Employee identification |
| 4 | Gender | VARCHAR | Gender of the employee | Workforce demographic analysis |
| 5 | Age | INT | Age of the employee | Age-group and workforce analysis |
| 6 | BusinessTravel | VARCHAR | Frequency of business travel | Analyze relationship between travel and employee outcomes |
| 7 | Department | VARCHAR | Department in which the employee works | Department-level workforce and attrition analysis |
| 8 | DistanceFromHome (KM) | INT | Distance between employee's home and workplace in kilometers | Commute and attrition analysis |
| 9 | State | VARCHAR | State associated with the employee | Geographic workforce analysis |
| 10 | Ethnicity | VARCHAR | Ethnicity category of the employee | Workforce demographic analysis |
| 11 | Education | INT | Numerical education level | Education-level analysis |
| 12 | EducationField | VARCHAR | Field in which the employee received education | Education and career analysis |
| 13 | JobRole | VARCHAR | Current job role of the employee | Job-role workforce, salary, performance, and attrition analysis |
| 14 | MaritalStatus | VARCHAR | Marital status of the employee | Demographic analysis |
| 15 | Salary | DECIMAL | Employee salary | Compensation analysis |
| 16 | StockOptionLevel | INT | Employee stock option level | Compensation and retention analysis |
| 17 | OverTime | VARCHAR | Indicates whether the employee works overtime | Workload and attrition analysis |
| 18 | HireDate | DATE | Date on which the employee joined the company | Tenure and workforce timeline analysis |
| 19 | Attrition | VARCHAR | Indicates whether the employee left the organization | Employee attrition and retention analysis |
| 20 | YearsAtCompany | INT | Number of years the employee has worked at the company | Tenure analysis |
| 21 | YearsInMostRecentRole | INT | Number of years spent in the most recent/current role | Career progression analysis |
| 22 | YearsSinceLastPromotion | INT | Number of years since the employee's last promotion | Promotion and career-growth analysis |
| 23 | YearsWithCurrManager | INT | Number of years working with the current manager | Manager relationship and retention analysis |

---

# 3. PerformanceRating.csv

## Description

`PerformanceRating.csv` contains employee performance review information.

Each row represents a performance review associated with an employee.

### Primary Key

`PerformanceID`

### Foreign Key

`EmployeeID`

`EmployeeID` connects the performance review records to the employee records
in `Employee.csv`.

### Number of Columns

11

---

## Performance Rating Table Columns

| # | Column Name | Data Type | Description | Business Purpose |
|---:|---|---|---|---|
| 1 | PerformanceID | VARCHAR | Unique identifier for each performance review | Identifies individual performance review records |
| 2 | EmployeeID | VARCHAR | Identifier of the employee being reviewed | Connects performance records with employee information |
| 3 | ReviewDate | DATE | Date on which the performance review was recorded | Performance trend and time-based analysis |
| 4 | EnvironmentSatisfaction | INT | Employee satisfaction with the work environment | Analyze workplace satisfaction |
| 5 | JobSatisfaction | INT | Employee satisfaction with their job | Analyze job satisfaction and attrition |
| 6 | RelationshipSatisfaction | INT | Employee satisfaction with workplace relationships | Analyze employee relationships and retention |
| 7 | TrainingOpportunitiesWithinYear | INT | Number/level of training opportunities available during the year | Training and development analysis |
| 8 | TrainingOpportunitiesTaken | INT | Number/level of training opportunities taken by the employee | Training participation analysis |
| 9 | WorkLifeBalance | INT | Employee's work-life balance rating | Analyze work-life balance and attrition |
| 10 | SelfRating | INT | Employee's self-assessed performance rating | Compare employee self-assessment with manager assessment |
| 11 | ManagerRating | INT | Manager's performance rating of the employee | Performance evaluation and management analysis |

---

# 4. Table Relationships

The two datasets are connected using `EmployeeID`.

```text
Employee.csv
    |
    | EmployeeID
    |
    | 1 : Many
    |
    v
PerformanceRating.csv