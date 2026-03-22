Вывести список имён сотрудников, получающих большую заработную плату, чем у непосредственного руководителя.
Поля в результирующей таблице:
name

SELECT e1.name
from Employee e1 join Employee e2 on e1.chief_id = e2.id
where e1.salary > e2.salary
