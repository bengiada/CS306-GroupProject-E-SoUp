CREATE VIEW low_co2_emissions_countries AS
SELECT c.iso_code, c.name, AVG(co2.volume) AS average_co2_emissions
FROM Countries c
JOIN CO2_emissions co2 ON c.iso_code = co2.iso_code
GROUP BY c.iso_code, c.name
HAVING AVG(co2.volume) < (SELECT AVG(volume)
							FROM CO2_emissions);