Напишите SQL-запрос, который определит самый часто используемый промокод.

Необходимо вывести название этого промокода и количество раз, которое он был использован в заказах.

Поля в результирующей таблице: name, usage_count.

SELECT name, count(*) as usage_count
from promocodes pr join orders o on pr.promocode_id = o.promocode_id
GROUP BY name
ORDER BY count(*) desc
limit 1;
