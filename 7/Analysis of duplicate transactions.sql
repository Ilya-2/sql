Необходимо написать SQL-запрос, который найдет в таблице purchases транзакции, продублированные в результате технической ошибки.

Поля в результирующей таблице: transaction_id, datetime, amount, user_id.

with check1 as (
select transaction_id, datetime, amount, user_id,
ROW_NUMBER() over (partition by datetime, amount, user_id) as k
from purchases
),
check2 as (
select *, MAX(k) over (partition by datetime, amount, user_id) as km
from check1
)

select transaction_id, datetime, amount, user_id
from check2
where km > 1
