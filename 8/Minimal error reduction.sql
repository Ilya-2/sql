Дана таблица CodeSuggestionsStats со статистикой автодополнения кода.

Для каждого языка программирования (language) в апреле 2024 года напишите запрос для поиска минимального процента снижения ошибок (error_reduction), наблюдаемого среди всех автодополнений кода от ИИ.
Поля в результирующей таблице:
language
min_error_reduction

SELECT language, min(error_reduction) as min_error_reduction
FROM CodeSuggestionsStats
where TO_CHAR(date, 'YYYY-MM') = '2024-04'
GROUP by language
