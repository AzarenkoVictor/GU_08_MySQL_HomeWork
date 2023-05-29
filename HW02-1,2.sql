CREATE DATABASE IF NOT EXISTS HW02;
USE HW02;

CREATE TABLE IF NOT EXISTS sales (
  id INT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
  order_date DATE NOT NULL,
  count_product INT
);

INSERT INTO sales (order_date, count_product) 
VALUES 
  ('2022-01-01', 156), 
  ('2022-01-02', 180), 
  ('2022-01-03', 21), 
  ('2022-01-04', 124), 
  ('2022-01-05', 341);

SELECT * FROM sales;

SELECT id AS 'id заказа',
CASE
	WHEN count_product < 100 THEN "Маленький заказ"
    WHEN count_product >= 100 AND count_product <= 300 THEN "Средний заказ"
	WHEN count_product > 300 THEN "Большой заказ"
    ELSE "Нет данных"
END AS 'Тип заказа'
FROM sales;
