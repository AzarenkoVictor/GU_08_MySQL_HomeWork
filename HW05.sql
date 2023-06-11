CREATE DATABASE HW05;
USE HW05;


CREATE TABLE IF NOT EXISTS cars
(
	id   INT NOT NULL PRIMARY KEY,
    mark VARCHAR(45),
    cost INT
);

INSERT cars
VALUES
	(1, "Audi", 52642),
    (2, "Mercedes", 57127 ),
    (3, "Skoda", 9000 ),
    (4, "Volvo", 29000),
	(5, "Bentley", 350000),
    (6, "Citroen ", 21000 ), 
    (7, "Hummer", 41400), 
    (8, "Volkswagen ", 21600);

CREATE VIEW cheap_cars AS
  SELECT * FROM Cars
  WHERE cost < 25000;

ALTER VIEW cheap_cars AS
  SELECT * FROM cars
  WHERE cost < 30000;

CREATE VIEW  audi_scoda_cars  AS
  SELECT * FROM cars
  WHERE name IN ("Audi", "Skoda");


CREATE TABLE train_schedule
(
	train_id  INT NOT NULL,
    station VARCHAR(20),
    station_time TIME
);

INSERT INTO train_schedule (train_id, station, station_time)
VALUES (110, 'San Francisco', '10:00:00'),
       (110, 'Redwood City', '10:54:00'),
       (110, 'Palo Alto', '11:02:00'),
       (110, 'San Jose', '12:35:00'),
       (120, 'San Francisco', '11:00:00'),
       (120, 'Palo Alto', '12:49:00'),
       (120, 'San Jose', '13:30:00');

SELECT  
  train_id,
  station,
  station_time
TIMEDIFF(
  LEAD(station_time) OVER (PARTITION BY train_id ORDER BY station_time), station_time
  AS next_station_time
FROM train_schedule;
