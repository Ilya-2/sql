Даны таблицы с параметрами объявлений (адрес и цена) с историчностью по одной колонке. Необходимо вывести актуальные адрес и цену для каждого объявления.

Поля в итоговом запросе: item_id, address, price.

with check1 as (
SELECT s.item_id, s.address, sp.price,
ROW_NUMBER() OVER (partition by s.item_id order by sp.actual_date desc, s.actual_date desc) as d
from s_item_address s join s_item_price sp on s.item_id = sp.item_id

)



SELECT item_id, address, price
from check1
where d = 1
