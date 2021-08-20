--Question 2
--Find the distinct values for the extended step. The code has been started for you, but you will need to program the third line yourself before running the query.

SELECT 
distinct Extended_step
from salary_range_by_job_classification;

--Question 3
--Excluding $0.00, what is the minimum bi-weekly high rate of pay (please include the dollar sign and decimal point in your answer)? The code has been started for you, but you will need to add onto the last line of code to get the correct answer.

Select 
min(Biweekly_high_Rate)
From salary_range_by_job_classification
where Biweekly_high_Rate!='$0.00'
;

--Question 4 
--What is the maximum biweekly high rate of pay (please include the dollar sign and decimal point in your answer)? The code has been started for you, but you will need to add onto the last line of code to get the correct answer.
SELECT 
Max(Biweekly_high_Rate) 
From salary_range_by_job_classification;

--Question 5
--What is the pay type for all the job codes that start with '03'? The code has been started for you, but you will need to program the fourth and fifth lines yourself before running the query.
Select
job_code,
pay_type
From salary_range_by_job_classification
where job_code Like '03%';


--Question 6
--Run a query to find the Effective Date (eff_date) or Salary End Date
--(sal_end_date) for grade Q90H0? The code has been started for you, but you will need to program the third through the sixth lines yourself before running the query. 

Select
grade,
eff_date,
sal_end_date
From salary_range_by_job_classification
where grade='Q90H0';

--Question 7
--Sort the Biweekly low rate in ascending order. There is no starter code, as you need to write and run the query on your own. Hint: there are 4 lines to run this query.
Select 
Biweekly_Low_Rate
From salary_range_by_job_classification
Order By Biweekly_Low_Rate ASC;

--Question 8
--Write and run a query, with no starter code to answer this question: What Step are Job Codes 0110-0400? Hint: there are 6 lines to run this query.

select 
Job_Code,
Step 
from salary_range_by_job_classification
where Job_Code>='0110' and Job_Code<='0400';

--Question 9
--Write and run a query, with no starter code or hints to answer this question: What is the Biweekly High Rate minus the
--Biweekly Low Rate for job Code 0170?
select 
Job_Code,
Biweekly_high_Rate,
Biweekly_low_Rate,
Biweekly_high_Rate-Biweekly_low_Rate
from salary_range_by_job_classification
where Job_Code>='0170' and Job_Code<='0200';


--Question 10
--Write and run a query, with no starter code or hints to answer this question: What is the Extended Step for Pay Types M, H, and D? 

SELECT
Extended_Step,
Pay_type
from salary_range_by_job_classification
where Pay_Type in ('M','H','D')

--Question 11
--Write and run a query, with no starter code or hints to answer this question: What is the step for Union Code 990 and a Set ID of SFMTA or COMMN? 
SELECT
Step,
Union_Code,
SetID
from salary_range_by_job_classification
where Union_Code='990'
or SetID in ('SFMTA','COMMN');