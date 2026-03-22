Какой средний возраст клиентов, купивших Smartwatch (использовать наименование товара products.name) в 2024 году?

Поля в результирующей таблице: average_age﻿﻿﻿

SELECT AVG(age) AS average_age
FROM customers c
WHERE EXISTS (
    SELECT 1
    FROM purchases pu
    JOIN products pr ON pu.product_key = pr.product_key
    WHERE pu.customer_key = c.customer_key
      AND EXTRACT(YEAR FROM pu.date) = 2024
      AND pr.name = 'Smartwatch'
);
