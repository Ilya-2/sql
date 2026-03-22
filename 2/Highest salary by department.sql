Найти наибольшую зарплату по департаментам и отсортировать департаменты по убыванию максимальной зарплаты.

with ch as (
    SELECT name, dep_id, Salary, ROW_NUMBER() over (PARTITION BY Dep_id order by Salary desc) as zp
    from Employees
)

SELECT Departments.name as DepartmentName, Salary as HighestSalary
from ch join Departments on ch.dep_id = Departments.id
where zp = 1
order by Salary desc
