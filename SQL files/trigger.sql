delimiter //
CREATE TRIGGER fix_value_before_insert 
BEFORE INSERT ON Access_to_Electricity
FOR EACH ROW
BEGIN  
IF percentage < 1 THEN SET percentage = 1;
END IF; 
IF percentage > 100 THEN SET percentage = 100;
END IF;
END//
delimiter ;


delimiter //
CREATE TRIGGER fix_value_before_update 
BEFORE UPDATE ON Access_to_Electricity
FOR EACH ROW
BEGIN  
IF percentage < 1 THEN SET percentage = 1;
END IF; 
IF percentage > 100 THEN SET percentage = 100;
END IF;
END//
delimiter ;



