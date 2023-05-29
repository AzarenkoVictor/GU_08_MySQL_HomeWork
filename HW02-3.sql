CREATE DATABASE IF NOT EXISTS HW02;
USE HW02;

CREATE TABLE IF NOT EXISTS orders (
  id INT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
  employee_id VARCHAR(5),
  amount FLOAT,
  order_status VARCHAR(25) NOT NULL
);
DESCRIBE orders;

INSERT INTO orders (employee_id, amount, order_status)
VALUES 
	('e03', 15, 'OPEN'),
	('e01', 25.50, 'OPEN'),
	('e05', 100.70, 'CLOSED'),
	('e02', 22.18, 'OPEN'),
	('e04', 9.50, 'CANCELLED');

SELECT *,
CASE
	WHEN order_status = 'OPEN' THEN "Order is in open state"
    WHEN order_status = 'CLOSED' THEN "Order is closed"
	WHEN order_status = 'CANCELLED' THEN "Order is cancelled"
    ELSE "Нет данных"
END AS full_order_status
FROM orders;