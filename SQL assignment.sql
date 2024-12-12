select *
from city;

select * 
from country;

select *
from countrylanguage;

#task 3:USING COUNT, GET THE NUMBER OF CITIES IN THE USA#
SELECT COUNT(Name) as Count, CountryCode
FROM city
WHERE CountryCode = 'USA';

#TASK 4 Find out what the population and life expectancy for people in Argentina (ARG) is#
SELECT Name, Population, LifeExpectancy
FROM country
Where Name = 'Argentina';

#TASK 5 USING ORDER BY, LIMIT, WHAT COUNTRY HAS THE HIGHEST LIFE EXPECTANCY?#
SELECT Name as country, LifeExpectancy
FROM country
ORDER BY LifeExpectancy desc
LIMIT 1; 

#Task 6: Select 25 cities around the world that start with the letter 'F' in a single SQL query.#
SELECT Name as City
from city
where name like 'F%'
limit 25;

#Task 7:Create a SQL statement to display columns Id, Name, Population from the city table and limit results to first 10 rows only.#
select ID, Name, Population 
from city
limit 10;

#Task 9:CREATE A SQL STATEMENT TO FIND ALL CITY NAMES FROM CITY TABLE WHOSE NAME BEGINS WITH “BE” PREFIX.
select name as City
from city 
where name like 'be%';

#task 10: Create a SQL statement to find only those cities from city table whose population is between 500000-1000000.#
select name as City, Population
from city 
where Population between 500000 and 1000000;

#task 11:Create a SQL statement to find a city with the lowest population in the city table.#
select * 
from city 
order by Population
limit 1;

select name, Population
from city 
where Population = (select min(Population) from city); 

#task 12:Create a SQL statement to show the population of Switzerland and all the languages spoken there.#
select * from country
where name = 'switzerland';

select ct.name, cl.language, ct.population
from countrylanguage as cl
inner join country as ct
on cl.countrycode = ct.code
where CountryCode = 'CHE';

#task 13: CREATE A SQL STATEMENT TO FIND THE CAPITAL OF SPAIN (ESP).#
select c.id, c.name as City, ct.Name as Country, ct.Capital
from city as c
inner join country as ct
on  c.CountryCode = ct.code
where ct.capital = c.ID and ct.name ='spain';

#task 14: CREATE A SQL STATEMENT TO FIND THE COUNTRY WITH THE HIGHEST LIFE EXPECTANCY.#
select name, LifeExpectancy
from country 
where LifeExpectancy = (select max(LifeExpectancy) from country);

#task 15; Create a SQL statement to find all cities from the Europe continent.#
select ct.name as Country, ct.Continent, c.name as City
from country as ct
inner join city as c
on ct.Code = c.CountryCode
where Continent = 'europe';

# Task 16:CREATE A SQL STATEMENT TO FIND THE MOST POPULATED CITY IN THE CITY TABLE.#
select * 
from city 
order by population desc
limit 1;

select * 
from city 
where Population = (select max(Population) from city); 

#Task 17: CREATE A SQL STATEMENT TO FIND THE TOTAL POPULATION OF EACH CONTINENT#
select continent, sum(population) as population
from country 
group by Continent;

#task 18: CREATE A SQL STATEMENT TO FIND THE AVERAGE LIFE EXPECTANCY BY CONTINENT#
select continent, avg(lifeexpectancy) as AvgLifeExpectancy
from country
group by Continent;

select continent, round(avg(lifeexpectancy),2) as AvgLifeExpectancy
from country
group by Continent;

#Task 19: Create a SQL statement to list the number of cities in each country#
select ct.name as Country, count(c.name) as 'Number of Cities'
from country as ct
inner join city as c
on ct.code = c.countrycode
group by ct.name;

#Task 20: Create a SQL statement to find the total population of each country based on its cities#
select ct.name as country, sum(c.population) as 'Total City Population'
from country as ct
inner join city as c
on ct.code = c.CountryCode
group by ct.name;

select ct.name as Country, 
ifnull(c.name, 'total') as City,
ifnull(sum(c.population), 0) as CityPopulation
from country as ct
inner join city as c
on ct.code = c.CountryCode
group by ct.name, c.name
with rollup;

#Task 21:CREATE A SQL STATEMENT TO FIND THE MOST SPOKEN LANGUAGE IN EACH CONTINENT#
select ct.name as Country, cl.Language as 'Most Spoken Language', cl.percentage
from countrylanguage as cl
inner join country as ct
on cl.countrycode = ct.code
where cl.percentage = (select max(cl.Percentage) from countrylanguage cl where cl.CountryCode = ct.Code)
order by ct.name;

#CREATE A SQL STATEMENT TO FIND COUNTRIES WHERE THE OFFICIAL LANGUAGE IS EITHER 'ENGLISH', 'SPANISH', OR 'FRENCH'#
select ct.name as country, cl.Language, IsOfficial
from countrylanguage as cl
inner join country as ct 
on cl.countrycode = ct.code
where language in ('English', 'Spanish', 'french') and IsOfficial = 'T';

#Task 23: Write a query to display the total population for each continent.#
select continent, sum(population) as TotalPopulation
from country
group by continent;

#Task 24: Write a query to list countries that have more than three official languages. (joins, group by, having)#
select ct.name as Country, count(cl.Language) as 'Number of Official languages'
from countrylanguage as cl
inner join country as ct
on cl.countrycode = ct.code
where IsOfficial = 'T'
group by ct.name 
having count(cl.Language) > 3;

#Task 25: Find countries whose population is greater than the average population of all countries.#
select name as Country, Population
from country
where population > (select avg(population) from country);

select avg(population)
from country;
