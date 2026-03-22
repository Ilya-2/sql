Предположим, вам дана таблица данных твитов Twitter. Напишите запрос, чтобы получить гистограмму твитов, опубликованных каждым пользователем в 2022 году. Выведите количество твитов на пользователя как группу и количество пользователей Twitter, которые попадают в эту группу.

Другими словами, сгруппируйте пользователей по количеству твитов (tweet_bucket), которые они опубликовали в 2022 году, и подсчитайте количество пользователей в каждой группе (users_num).
Поля в результирующей таблице:
tweet_bucket
users_num

WITh ch as (SELECT user_id, count(*) as k_tweet
from Tweets
where EXTRACT(YEAR FROM tweet_date) = '2022' 
GROUP by user_id)

SELECT k_tweet as tweet_bucket, count(*) as users_num
from ch
group by k_tweet;
