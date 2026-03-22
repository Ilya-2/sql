Дана таблица employees_income. id - уникальный ключ сотрудника, income - ежемесячная зарплата.

Необходимо подсчитать количество сотрудников в каждой категории:

"Низкая зарплата": Зарплата строго меньше 20 000.

"Средняя зарплата": Зарплаты попадающие в отрезок от 20 000 до 50 000.

"Высокая зарплата": Зарплата строго больше 50 000.

В итоговой таблице должны быть все категории. Если в категорию никто не попал, то для нее выводится 0.

Поля в результирующей таблице: category, count. Результат необходимо отсортировать по убыванию count.

SELECT
    'Низкая зарплата' AS category
    , COUNT(*) AS count
FROM employees_income ei
WHERE ei.income < 20000
UNION ALL
SELECT
    'Средняя зарплата' AS category
    , COUNT(*) AS count
FROM employees_income ei
WHERE ei.income BETWEEN 20000 AND 50000
UNION ALL

(SELECT
    'Высокая зарплата' AS category
    , COUNT(*) AS count
FROM employees_income ei
WHERE ei.income > 50000
ORDER BY count DESC)

ORDER BY count DESC
