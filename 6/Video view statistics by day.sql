Дана таблица watched_content с информацией о просмотрах видео пользователями. Каждая строка в таблице соответствует одному просмотру.

Посчитайте в одном запросе:
количество просмотров (views) видео по дням
размер аудитории (audience) — уникальное количество пользователей по дням
Полученную таблицу отсортируйте по дате по возрастанию.
Поля в результирующей таблице:
date
views
audience

SELECT date, 
count(video_id) as views,
COUNT(DISTINCT user_id) as audience 
from watched_content
GROUP by date
order by 1;
