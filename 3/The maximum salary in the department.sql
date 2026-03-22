Вывести список имён сотрудников, получающих максимальную заработную плату в своем отделе
Поля в результирующей таблице:
name

with ch as (
    SELECT name, ROW_NUMBER() OVER (PARTITION BY department_id order by salary desc) as zp
    from Employee
    
)

select name
from ch
where zp = 1
