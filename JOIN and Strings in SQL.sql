# JOIN in MySQL
CREATE TABLE left_table (id INT, description TEXT);
CREATE TABLE right_table (id INT, description TEXT);

INSERT INTO left_table VALUES (1, 'left 01'),
(2, 'left 02'),
(3, 'left 03'),
(4, 'left 04'),
(5, 'left 05'),
(6, 'left 06'),
(7, 'left 07'),
(8, 'left 08'),
(9, 'left 09');

INSERT INTO right_table VALUES (6, 'right 06'),
(7, 'right 07'),
(8, 'right 08'),
(9, 'right 09'),
(10, 'right 10'),
(11, 'right 11'),
(11, 'right 12'),
(11, 'right 13'),
(11, 'right 14');

SELECT * FROM left_table;
SELECT * FROM right_table;

DROP TABLE left_table;
DROP TABLE right_table;

# INNER JOIN
SELECT r.description AS right_t, l.description AS left_t
FROM right_table AS r
INNER JOIN left_table AS l ON r.id=l.id;

# LEFT JOIN
SELECT right_table.description as right_t, left_table.description as left_t
FROM right_table
LEFT JOIN left_table on right_table.id=left_table.id;

# RIGHT JOIN
SELECT r.description as right_t, l.description as left_t
FROM right_table as r
RIGHT JOIN left_table as l on r.id=l.id;

DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS products;
# CREATE THREE(3) TABLES WITH SIMILAR CONTENTS
CREATE TABLE users (id INT, first_name VARCHAR(15), last_name VARCHAR(15), address VARCHAR(50), email VARCHAR(20));
CREATE TABLE products (id INT, name VARCHAR(15), description VARCHAR(50), stock_count INT, price FLOAT(20));
CREATE TABLE orders (id INT, user_id INT, product_id INT, agent_logged INT);

INSERT INTO users VALUES (1, 'Luke', 'Harrison', '1640 Riverside street', 'luke@lukehotmail.com'),
(2, 'Heather', 'Reynolds', '742 Evergreen close', 'heza@gmail.com'),
(3, 'Simon', 'Clarkson', '7 Peterborough rd', 'smr@yahoo.com'),
(4, 'Claire', 'Simpson', '15 Musgrad town', 'claire@hotmail.com'),
(5, 'Oliver', 'Harrison', '1640 Riverside street', 'oliver@yahoo.com'),
(6, 'James', 'Gilbert', '598 Firshil road', 'jgil@apple.com'),
(7, 'Michael', 'Johnson', '12 Redmire close', 'mj@ymail.com'),
(8, 'Thomas', 'Smith', '342 Brown rd', 't.smith@asl.com'),
(9, 'Robyn', 'Gilbert', '598 Firshil road', 'summer@dmail.com'),
(10, 'Bryony', 'Brown', '165 Southern road', 'bryony@hotmail.com');

INSERT INTO products VALUES (192, 'Carton DonSimon', 'whether you like it or not', 0, 14.99),
(23, 'Spring card', 'Decluttered to serve better', 1, 3.49),
(3, 'Smart POS', NULL, 1, 24.99),
(32, 'TripLast 3310', 'Cost effective platform', 4, 16.50),
(875, 'A4 Storage', 'Dimensional quality and satisfaction', 5, 4.99),
(456, 'Pack of drinks', 'Date first and notice difference', 5, 12.99),
(341, 'Set of 2 spoons', '5 year guarantee', 8, 4.99),
(67, 'Large Car pool', 'Need some transport', 10, 12.99),
(196, '10X plastics', 'Pack of 10 plastics', 10, 15.99),
(310, 'StorePac 5cm', 'High quality product', 10, 9.99);

INSERT INTO orders VALUES (1, 5, 196, 0),
(2, 4, 32, 1),
(3, 6, 310, 0),
(4, 10, 196, 1),
(5, 1, 67, 1),
(6, 1, 341, 1),
(7, 1, 875, 0),
(8, 9, 3, 1),
(9, 5, 23, 1),
(10, 8, 196, 1);

# INNER JOIN
SELECT o.id, u.first_name, u.last_name, p.name AS 'product_name', p.price AS 'Product price'
FROM orders as o
JOIN users as u ON o.id=u.id
JOIN products AS p ON o.product_id=p.id
ORDER BY id ASC;

# LEFT JOIN
SELECT o.id, u.first_name, u.last_name, p.name AS 'product_name'
FROM orders as o
LEFT JOIN users as u ON o.id=u.id
LEFT JOIN products as p ON o.product_id=p.id
ORDER BY id ASC;

USE sql_intro;
# STRINGS
# FIND THE LENGTH OF A STRING
SELECT length('STRING') AS Length_of_string;

# Count the number of characters in a string. 
SELECT DISTINCT Country, length(Country) AS 'Length of Country' 
FROM online_retail_csv
ORDER BY 'Length of Country' Desc;

# Filter out the friends from the text "my friends"
SELECT substr("my friends", 4, 3) AS friends;
SELECT substr("1993-06-06", 1, 4) AS "Year";
SELECT substr("1993-06-06", 6, 2) AS "Month";
SELECT substr("1993-06-06", 9, 2) AS "Day";

SELECT * FROM online_retail_csv;
SELECT substr(InvoiceDate, 6, 4) as Year
FROM online_retail_csv;
SELECT substr(InvoiceDate, 1, 2) as Month
FROM online_retail_csv;
SELECT substr(InvoiceDate, 4, 1) as Day
FROM online_retail_csv;

# Removing spaces in text
SELECT trim('   STRING   ') AS full_trim;
SELECT ltrim('   STRING   ');
SELECT rtrim('   STRING   ');
SELECT trim(trailing from '...STRING...') AS Trimmed_Text;

# Folding case in text
SELECT 'string' = 'STRING';
SELECT lower('sTrInG') = lower('string');
SELECT upper('sTrInG') = upper('string');
SELECT upper(Country)
FROM online_retail_csv
ORDER BY Country;
SELECT lower(Country)
FROM online_retail_csv
ORDER BY Country;