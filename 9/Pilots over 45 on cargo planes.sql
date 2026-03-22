Выведите пилотов старше 45 лет, которые совершили больше 2 полётов на грузовых самолетах
Поля в результирующей таблице:
name

SELECT name
from Pilots join Flights on Pilots.pilot_id in (Flights.first_pilot_id, Flights.second_pilot_id)
join Planes on Flights.plane_id = Planes.plane_id
where pilots.age > 45 and Planes.cargo_flag = True
group by name
having count(*) > 2
