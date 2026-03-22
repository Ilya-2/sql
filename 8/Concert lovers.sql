Необходимо найти клиентов, которые покупали билеты на концерт, но никогда не покупали билеты в театр.

SELECT DISTINCT user_id
from orders
where user_id NOT IN (SELECT user_id
    from orders
    where event_type = 'театр') and event_type = 'концерт'
