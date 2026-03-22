Посчитай кол-во уникальных пользователей-мужчин, заказавших более чем три вещи (items) суммарно за все заказы. Обратите внимание, что в таблице мужская аудитория имеет поле user_gender «male» или «m».
Поля в результирующей таблице:
unique_male_users

SELECT count(*) as unique_male_users
from Purchases
where user_gender in ('male', 'm') and items > 3
