Дана таблица watched_content с информацией о просмотрах видео пользователями.

Выведите список пользователей (user_id), смотревших видео каждый день в январе 2026 года.

Подсказка: в январе 31 день.
Поля в результирующей таблице:
user_id

SELECT user_id
from watched_content
where TO_CHAR(date, 'YYYY-MM') = '2026-01'
GROUP by user_id
HAVING count(*) = 31
