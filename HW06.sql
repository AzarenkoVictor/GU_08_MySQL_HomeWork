CREATE DATABASE HW06;
USE HW06;

DELIMITER //
CREATE FUNCTION time_converter (seconds INT) 
RETURNS VARCHAR(100)
DETERMINISTIC
BEGIN
	DECLARE form_result VARCHAR(100);
	DECLARE days INT;
	DECLARE hours INT;
	DECLARE minutes INT;
	SET days = (seconds - seconds % (24*3600))/(24*3600);
	SET hours = (seconds % (24*3600) - seconds % (60*60))/(60*60);
	SET minutes = (seconds % (24*60) - seconds % (60))/60;
	SET seconds = seconds % 60;
	SET form_result= CONCAT(days, ' days ', hours, ' hours ', minutes, ' minutes ', seconds, ' seconds');
	RETURN (form_result);
END //
DELIMITER ;

SELECT time_converter(123456);



DELIMITER //

CREATE FUNCTION even_numbers(n INT)
RETURNS VARCHAR(100)
BEGIN
  DECLARE i INT DEFAULT 1;
  DECLARE result VARCHAR(100) DEFAULT '';
  
  WHILE i <= n DO
    IF i % 2 = 0 THEN
      SET result = CONCAT(result, i, ', ');
    END IF;
    SET i = i + 1;
  END WHILE;
  
  RETURN SUBSTRING(result, 1, LENGTH(result) - 2);
END //

DELIMITER ;

SELECT even_numbers(10);
