create database bank_loan_analysis;

Use bank_loan_analysis;

# Visual 1 - Year wise loan amount

select year(issue_d) as Year_of_issue_date ,
sum(loan_amnt) as Total_loan_amnt
from finance_1
group by Year_of_issue_date
order by Year_of_issue_date;

# Visual 2- Grade and sub grade wise revol_bal

Select f1.grade , f1.sub_grade, sum(f2.revol_bal) as Total_revol_bal
from finance_1 as f1 inner join finance_2 as f2
on(f1.id=f2.id)
group by f1.grade , f1.sub_grade
order by f1.grade , f1.sub_grade;

# Visual 3- Total Payment for Verified Status Vs Total Payment for Non Verified Status

Select f1.verification_status,
concat("$",format(round(sum(total_pymnt)/1000000,2),2),"M") as Total_Payment
from finance_1 as f1 inner join finance_2 as f2
on(f1.id=f2.id)
group by f1.verification_status
having f1.verification_status in ('verified','not verified');

# Visual 4- State wise and month wise loan status

SELECT f1.addr_state,
       MONTH(f1.issue_d) AS month_of_issue_d,
       f1.loan_status
FROM finance_1 AS f1
INNER JOIN finance_2 AS f2 ON f1.id = f2.id
GROUP BY f1.addr_state, MONTH(f1.issue_d), f1.loan_status
ORDER BY MONTH(f1.issue_d);


# Visual 5- Home ownership Vs last payment date stats
SELECT 
    f1.home_ownership,
    count(last_pymnt_d) as count_last_pymt_d
    
FROM 
    finance_1 AS f1
left JOIN 
    finance_2 AS f2 ON f1.id = f2.id
GROUP BY 
  1;



