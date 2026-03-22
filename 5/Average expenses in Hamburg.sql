Подсчитайте средние траты на каждый тип события в городе «Hamburg». Если каких-то типов событий не было в этом городе, то необходимо вывести 0 в качестве средних трат.

Поля в результирующей таблице:
event_type
average_costs

SELECT EventType.name as event_type,
COALESCE(avg(costs), 0) as average_costs
from Cities join Events on Cities.id = Events.cityid
and Cities.name = 'Hamburg'
RIGHT JOIN EventType on Events.typeid = EventType.id
group by EventType.name
