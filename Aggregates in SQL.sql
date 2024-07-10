SHOW TABLES;
USE SQL_TUTORIAL;
SHOW TABLES;
SELECT * FROM online_retail_csv;

# Getting the count of countries in the data
SELECT Country, count(*) AS Count_of_countries
FROM online_retail_csv
GROUP BY Country
ORDER BY Country;

DROP TABLE IF EXISTS sales;
# Creating a new table
CREATE TABLE sales (product_id int, sell_price float, quantity int, state varchar(20));

# Inserting few values into the sales table
INSERT INTO sales values 
(121, 320.0, 3, 'California'),
(121, 320.0, 6, 'Texas'),
(121, 320.0, 4, 'Alaska'),
(123, 290.0, 2, 'Texas'),
(123, 290.0, 7, 'California'),
(123, 290.0, 4, 'Washington'),
(121, 320.0, 7, 'Ohio'),
(121, 320.0, 2, 'Arizona'),
(123, 290.0, 8, 'Colorado');

SELECT * FROM sales;

# Create the cost price table of the products
CREATE TABLE c_table (product_id int, cost_price float);

# Insert values into the cost table
INSERT INTO c_table values
(121, 270.0),
(123, 250.0);

SELECT * FROM c_table;

# Join the sales tables and the cost table, and calculate the profit
SELECT c.product_id, sum(distinct (s.sell_price - c.cost_price) * s.quantity) as profit
FROM sales as s inner join c_table as c
WHERE s.product_id = c.product_id
GROUP BY c.product_id;

# Having clause in SQL
# Check the cities having average salary more than 60000
SELECT * from emp_details;
SELECT city, avg(salary) as avg_salary
FROM emp_details
GROUP BY city
HAVING AVG(salary) > 60000;

# Cities where the total salary is greater than 60000
SELECT city, sum(distinct salary) as total_salary
FROM emp_details
GROUP BY city
HAVING sum(salary) > 60000;

# How many cities have more than 1 employee?
SELECT city, count(*) as employee_count
FROM emp_details
GROUP BY city
HAVING count(*) > 1;

# How many cities apart from Houston have more than 1 employees?
SELECT city, count(*) as employee_count
FROM emp_details
WHERE city != "Houston"
GROUP BY city
HAVING count(*) > 1;

# Number of employees in the cities having average salary of more than 75000
SELECT city, count(*) as emp_count
FROM emp_details
GROUP BY city
HAVING AVG(salary) > 75000;


## MODULE 2; Using the Aggregate Functions
SELECT * FROM online_retail_csv;                                                                                                  
SELECT count(Country) as Number_of_countries FROM online_retail_csv;
SELECT count(DISTINCT Country) AS No_of_ind_countries FROM online_retail_csv;

# Getting the number of individual countries in the data, and producing the results
# having the country greater than 10
SELECT Country, count(Country) AS No_of_countries 
FROM online_retail_csv
GROUP BY Country
HAVING No_of_countries > 10
ORDER BY No_of_countries ASC;

# Getting the Total Revenue per country as a byproduct of the Quantity and UnitPrice
SELECT Country, sum(Quantity) AS Total_quantity, round(sum(UnitPrice), 1) AS Total_UnitPrice, round((sum(Quantity) * round(sum(UnitPrice), 1)), 1) AS Total_Revenue
FROM online_retail_csv
GROUP BY Country
ORDER BY Total_revenue DESC;


### MODULE 3; Aggregating the DISTINCT values
SELECT count(Country) FROM online_retail_csv;
SELECT Country FROM online_retail_csv ORDER BY Country;
SELECT count(DISTINCT Country) FROM online_retail_csv;
SELECT avg(Quantity) from online_retail_csv;
SELECT Country, min(Quantity), max(UnitPrice)
FROM online_retail_csv
GROUP BY Country;
SELECT DISTINCT Country
FROM online_retail_csv
ORDER BY Country;