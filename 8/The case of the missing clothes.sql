Напишите SQL-запрос, который выведет уникальные имена пользователей, которые покупали товары из категории Книги, но при этом никогда не покупали товары из категории Одежда.

Результат: поле name (без дубликатов).

with check_item as (
SELECT *, case
          when item = 'Одежда' then 1
          else 0 END AS ch_od
from purchases
),
check_name as (
SELECT us.name, sum(ch_od) as k
from check_item it join users us on it.user_id = us.user_id
GROUP BY us.name
)


SELECT distinct u.name
from check_name join users u on check_name.name = u.name join purchases p on p.user_id = u.user_id
where p.item = 'Книги' and check_name.k = 0
