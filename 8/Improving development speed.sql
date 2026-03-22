Дана таблица CodeSuggestionsStats со статистикой автодополнения кода.

Напишите запрос для поиска среднего процента улучшения скорости разработки (speed_improvement) для каждого языка программирования (language) в апреле 2024 года.
Поля в результирующей таблице:
language
avg_speed_improvement

SELECT language, avg(speed_improvement) as avg_speed_improvement
from CodeSuggestionsStats
where TO_CHAR(date, 'YYYY-MM') = '2024-04'
GROUP BY language
