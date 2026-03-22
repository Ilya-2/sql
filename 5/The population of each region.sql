Посчитайте население каждого региона. В качестве результата выведите название региона и его численность населения.
Поля в результирующей таблице:
region_name
total_population

SELECT Regions.name as region_name, sum(Cities.population) as total_population
FROM Regions JOIN Cities on Regions.id = Cities.regionid
group by Regions.id

