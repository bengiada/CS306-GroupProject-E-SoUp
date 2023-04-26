CREATE VIEW high_energy_consumption_countries AS
SELECT c.iso_code, c.name, AVG(ec.amount) AS average_energy_consumption
FROM Countries c
JOIN Energy_Consumption ec ON c.iso_code = ec.iso_code
GROUP BY c.iso_code, c.name
HAVING AVG(ec.amount) > (SELECT AVG(amount) FROM Energy_Consumption);

