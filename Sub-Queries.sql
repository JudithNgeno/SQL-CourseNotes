-- Subqueries

select*
from employee_demographics
where employee_id in
                    (select employee_id
					  from employee_salary 
                      where dept_id = 1)
;
-- 2 is only in the salary table and since we are doing demographics table, two is not in it.

select first_name, salary, 
(select avg(salary)
from employee_salary)
from employee_salary
;

select gender, avg(age), max(age), min(age), count(age)
from employee_demographics
group by gender
;

select gender, avg (max_age)
from 
(select gender, 
avg(age) as avg_age, 
max(age) as max_age, 
min(age) as min_age, 
count(age) 
from employee_demographics
group by gender) as agg_table
;

























			