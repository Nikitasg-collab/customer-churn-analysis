Create database FinTech

CREATE TABLE Churn_Data (
    Sl_No INT,
    CustomerId INT PRIMARY KEY,
    Surname VARCHAR(50),
    CreditScore INT NOT NULL,
    Geography VARCHAR(50) NOT NULL,
    Gender VARCHAR(10),
    Age INT NOT NULL,
    Tenure INT NOT NULL,
    Balance DECIMAL(10,2) NOT NULL,
    NumOfProducts INT NOT NULL,
    HasCrCard INT NOT NULL,
    IsActiveMember INT NOT NULL,
    EstimatedSalary DECIMAL(10,2) NOT NULL,
    Exited INT NOT NULL
);

select * from Churn_data;

--churn customer--2037 records

select count(*) as total_customer, 
sum(case when exited=1 then 1 else 0 end) as churned_customer
from churn_data ;

---calculating churn percentage

select SUM(CASE WHEN exited = 1 THEN 1 ELSE 0 END) * 1.0/count(*) * 100 as churn_percentage
from churn_data;

--churn customer by activie menber 1 or 0

select IsActiveMember, count(*) as total, 
sum(case when exited=1 then 1 else 0 end) as churn 
from churn_data group by IsActiveMember;

--churned percentage according to activity

select  IsActiveMember, count(*) as total,
SUM(CASE WHEN exited = 1 THEN 1 ELSE 0 END) * 1.0/count(*) * 100 as churned_percentage
from churn_data group by IsActiveMember;

--by age data

select  age,
case 
when age between 30 and 50 then '30-50' else 'others' end as age_group
from churn_data group by age;

--churn count and percentage by age

select 
case 
when age between 30 and 50 then '30-50' else 'Others' end as age_group,
count(*) as total,
sum(case when exited=1 then 1 else 0 end) as churn,
SUM(CASE WHEN exited = 1 THEN 1 ELSE 0 END) * 1.0/count(*) * 100 as churned_percentage 
from churn_data 
group by 
CASE 
        WHEN age BETWEEN 30 AND 50 THEN '30-50' 
        ELSE 'Others' 
    END;


--products vs churn

select NumOfProducts,COUNT(*) AS total,
sum(case when exited=1 then 1 else 0 end) as churn,
SUM(CASE WHEN exited = 1 THEN 1 ELSE 0 END) * 1.0/count(*) * 100 as churned_percentage 
from churn_data 
group by  NumOfProducts;




