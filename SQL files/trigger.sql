DROP TRIGGER IF EXISTS fix_value_before_insert;
delimiter //
CREATE TRIGGER fix_value_before_insert 
BEFORE INSERT 
ON Access_to_Electricity
FOR EACH ROW
BEGIN  
IF NEW.percentage IS NOT NULL
THEN
	IF (NEW.percentage < 1) THEN SET NEW.percentage = 1;
	END IF;
	IF (NEW.percentage > 100) THEN  SET NEW.percentage = 100;
	END IF;
END IF;
END//
delimiter ;

DROP TRIGGER IF EXISTS fix_value_before_update;
delimiter //
CREATE TRIGGER fix_value_before_update 
BEFORE UPDATE ON Access_to_Electricity
FOR EACH ROW
BEGIN  
IF percentage IS NOT NULL
THEN
	IF percentage < 1 THEN UPDATE percentage SET percentage = 1;
	END IF; 
	IF percentage > 100 THEN UPDATE percentage SET percentage = 100;
	END IF;
END IF;
END//
delimiter ;
