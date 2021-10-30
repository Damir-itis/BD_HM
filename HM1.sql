--Task 1

select *
from employee e
left join employee em
on e.id = em.chief_id
where e.salary < em.salary;

--Task 2

select *
from  employee as e
where e.salary = (
    select max(salary)
    from employee as em
    where e.department_id = em.department_id);

--Task 3

select *
from department as d
left join employee as e
on d.id = e.department_id
where (select count(department_id)
    from employee where e.department_id = d.id) <= 3;

--Task 4

select *
from employee as e
left join employee as em
on e.chief_id = em.id
where e.department_id != em.department_id;

--Task 5

with sum_of_salaries as (
    select sum(salary) as sum,
           department_id as d_id
    from employee
    group by department_id)
    select d_id
from sum_of_salaries
where sum = (
    select max(sum)
    from sum_of_salaries
    )
