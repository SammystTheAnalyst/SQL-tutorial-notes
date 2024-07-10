# Numbers in SQL
CREATE TABLE int_tab (id TINYINT, salary FLOAT); 

INSERT INTO int_tab VALUES (-125, 1.2345),
(-90, 1.7219);
# Number division in MySQL
SELECT 1/2;
SELECT 1.0/2;
SELECT cast(1 AS REAL) / 2;
SELECT 17/5;
SELECT 17%5;
SELECT cast(17 AS REAL) / 5;

# Rounding up numbers in SQL
SELECT 2.33333;
SELECT round(2.33333);
SELECT round(2.33333, 3);
SELECT round(2.33333, 0);
