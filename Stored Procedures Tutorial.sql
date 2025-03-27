-- Stored Procedures --

select*
from employee_salary
where salary >= 50000;

Create Procedure large_salaries()
select*
from employee_salary
where salary >= 50000;

Call large_salaries();

Delimiter $$
Create Procedure large_salaries2()
Begin
  select*
  from employee_salary
  where salary >= 50000;
  select*
  from employee_salary
  where salary >= 10000;
end $$
Delimiter ;

Call large_salaries2();

-- Perimeter --

Delimiter $$
Create Procedure large_salaries4(p_employee_id INT)
Begin
  select salary
  from employee_salary
  where employee_id = p_employee_id
  ;
end $$
Delimiter ;

Call large_salaries4(1)


































