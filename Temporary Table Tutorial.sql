-- Temporary Tables

Create Temporary Table temp_table
(first_name varchar(50),
last_name varchar(50),
favorite_movie varchar(100)
);

select*
from temp_table;

Insert Into temp_table
values('Judith', 'Ngeno', 'Prison Break');

select*
from temp_table;

select*
from employee_salary;

Create Temporary Table salary_over_50k
select*
from employee_salary
where salary >= 50000;

select*
from salary_over_50k;

























