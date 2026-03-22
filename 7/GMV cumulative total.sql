Необходимо вывести сумму GMV (Gross Merchandise Value) нарастающим итогом по дням.

Отсортируйте результат в порядке возрастания по date.

with ch as (
    SELECT s.date, sum(price) as daily_gmv
    from items i join sales s on i.item_id = s.item_id
    group by s.date
)

select date, daily_gmv, SUM(daily_gmv) OVER (order by date) as gmv
from ch
