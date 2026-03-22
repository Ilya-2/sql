Напишите запрос, который выдаст последнюю цену каждой валюты.

Поля в результирующей таблице: name, price.

with ch as (
select name,
       LAST_VALUE(price) OVER (partition by name order by date ROWS BETWEEN unbounded preceding and unbounded following) as price
from currency
)

select name, price
from ch
GROUP BY name, price
