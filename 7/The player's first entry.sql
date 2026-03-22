Дана таблица Activity с активностью игроков. Каждая строка — это запись об игроке, который вошёл в систему и сыграл несколько игр (возможно, 0) перед выходом в определённый день с определённого устройства.

Напишите запрос, чтобы найти дату первого входа (first_login) для каждого игрока (player_id).
Поля в результирующей таблице:
player_id
first_login

SELECT player_id,
	MIN(event_date) AS first_login
FROM Activity
GROUP BY player_id

or

with ch as (
    SELECT player_id, event_date, FIRST_VALUE(event_date) OVER (PARTITION BY  player_id ORDER BY event_date) as k
    from Activity
)


SELECT player_id, k as first_login
from ch
group by player_id, k
