Есть таблица products с товарами и их значениями на определенную дату.

Оказалось, что начиная с какой-то даты по некоторым товарам начали приходить пустые значения.

Нужно написать запрос, в котором все NULL в поле value будут заполнены последним известным значением value для данного товара (при отсутствии предыдущих значений поле остается NULL).

Поля в результирующей таблице: sku, date, filled_value.

WITH filled_values AS (
    SELECT 
        sku,
        date,
        value,
        MAX(value) OVER (
            PARTITION BY sku 
            ORDER BY date
            ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
        ) AS filled_value
    FROM products
)
SELECT 
    sku,
    date,
    filled_value
FROM filled_values
ORDER BY sku, date;
