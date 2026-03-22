Даны таблицы:

items - таблица истории цен.
orders - журнал транзакций.
Напишите запрос, который выведет актуальные цены товаров на 17 декабря 2025 года.

Поля в результирующей таблице: item_id, name, price, update_date.

with check1 as (
SELECT i.item_id, i.name, i.price, i.update_date,
ROW_NUMBER() OVER (partition by i.item_id order by i.update_date desc) as k
from items i
where i.update_date <= '2025-12-17'
),
check2 as (
select item_id, name, price, update_date
from check1
where k = 1
)



SELECT item_id, name, price, update_date
from check2
