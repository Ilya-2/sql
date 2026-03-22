Дано: две таблицы:

region — справочник регионов.
town — список городов.
Задача: Вывести список только тех регионов, в которых есть хотя бы один город, основанный до 1900 года (включительно), с указанием общего количества таких городов в каждом регионе.

Поля в результирующей таблице: title, old_towns_count.

Отсортируйте результат в порядке убывания по old_towns_count, затем в порядке возрастания по title.

with check_count as (
SELECT *, case
          when year_ <= 1900 then 1
          else 0 end as k_g
from town
),
kgv as (
SELECT r.title, sum(k_g) as pr
from check_count ch join region r on r.id = ch.region_id
group by r.title
)


SELECT title, pr as old_towns_count
from kgv
where pr > 0
order by 2 desc, 1;
