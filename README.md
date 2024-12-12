This project is all about diving into the **World Database** 🌍 using SQL to answer interesting questions and explore global data trends!  

---

## 🎯 Project Overview  

This project takes a deep dive into the **World Database**, using SQL to:  
- Explore population trends 🌆  
- Analyse life expectancy 🌱  
- Investigate languages spoken across continents 🌐  
- Build meaningful relationships between countries, cities, and languages 🤝  

It’s all about turning raw data into insights while strengthening my database and SQL skills! 💪

---

## 🛠️ Skills & Tools  

- **SQL**: Writing queries to filter, sort, group, and join data like a pro.  
- **Relational Databases**: Exploring table relationships (one-to-one, one-to-many, many-to-many).  
- **Normalization**: Keeping data clean, efficient, and redundancy-free!  
- **EER Diagrams**: Mapping database relationships for clarity.  

---

## 📝 Key Queries  

Here’s a taste of the questions I answered:  

1. **🌍 How many cities are in the USA?**  
  ```sql
   SELECT COUNT(name) as Count, CountryCode 
   FROM city 
   WHERE CountryCode = 'USA';
```
2. **🌱 What’s the population and life expectancy in Argentina?**
  ```sql
   SELECT Name, Population, LifeExpectancy
   FROM country
   Where Name = 'Argentina';
```
3. **📊 Which country has the highest life expectancy?**
```sql
SELECT Name as country, LifeExpectancy
FROM country
ORDER BY LifeExpectancy desc
LIMIT 1;
```
4. **🏙️ Find 25 cities that start with ‘F’:**
```sql
SELECT Name as City
FROM city 
WHERE Name LIKE 'F%' 
LIMIT 25;
```
5. **🌎 List the total population by continent:**
```sql
SELECT Continent, SUM(population) as Population 
FROM country 
GROUP BY Continent;
```
6.**🎓 What’s the most spoken language on each continent?**
```sql
select ct.name as Country, cl.Language as 'Most Spoken Language', cl.percentage
from countrylanguage as cl
inner join country as ct
on cl.countrycode = ct.code
where cl.percentage = (select max(cl.Percentage) from countrylanguage cl where cl.CountryCode = ct.Code)
order by ct.name;
```
## 🌟 Highlights  

- **Explored Global Trends**: From cities with tiny populations to countries with high life expectancy, the dataset offered fascinating insights.  
- **Built Strong Queries**: Improved my SQL skills with tasks involving `GROUP BY`, `HAVING`, `JOINS`, and subqueries.  
- **Mapped Relationships**: Created an EER diagram to visualize how tables (like country, city, and language) interact and identified their foreign and primary keys.  

---

## 🖼️ Sample Visual  

Here’s a sneak peek of my EER Diagram!  
![eer](https://github.com/user-attachments/assets/6fabca9a-cb49-4c09-9c8b-fe7032e37439)

---

## 🐾 A Little Reflection  

I absolutely loved working on this assignment! It reminded me why I’m so passionate about data. I feel incredibly confident with SQL after this challenge and thoroughly enjoyed querying all the data to uncover insights. The process of building queries, experimenting with joins, and exploring the dataset was both rewarding and fun. This project has solidified my love for databases and made me even more excited to tackle future SQL challenges! 💪  
