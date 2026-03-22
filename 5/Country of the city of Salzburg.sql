Выведите название страны, где находится город «Salzburg»
Поля в результирующей таблице:
country_name

SELECT Countries.name as country_name
from Countries join Regions on Countries.id = Regions.countryid join Cities on Regions.id = Cities.regionid
where Cities.name = 'Salzburg'
