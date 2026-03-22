Выведите сумму выручки по каждому курсу за последний месяц.
Если сейчас 11 июля 10:15, то вы должны вывести сумму выручки за промежуток 11 июня 10:15 - 11 июля 10:15.
Поля в результирующей таблице:
course_id
revenue

SELECT course_id, sum(price) as revenue
from Orders
where order_date BETWEEN NOW() - INTERVAL '1 month' and NOW()
GROUP BY course_id 

or

SELECT course_id,
	sum(price) as revenue
from Orders
where order_date BETWEEN CURRENT_TIMESTAMP - INTERVAL '1 month'
	and CURRENT_TIMESTAMP
GROUP BY course_id
