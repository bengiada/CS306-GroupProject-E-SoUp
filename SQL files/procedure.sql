
-- converts consumption per capita (kWH) to total consumption (TWH)
DROP PROCEDURE IF EXISTS totalconsumption;
DELIMITER //
CREATE PROCEDURE totalconsumption (IN input varchar(5))
BEGIN
	SELECT date, amount * population / pow(10,9) as 'Total Consumption (TWH)'
    FROM Energy_Consumption 
    NATURAL JOIN Yearly_Status
    WHERE Energy_Consumption.iso_code = input;
END//
DELIMITER ;

CALL totalconsumption('CAN');
CALL totalconsumption('CHN');