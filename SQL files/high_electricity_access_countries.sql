CREATE VIEW high_electricity_access_countries AS
SELECT c.iso_code, c.name, AVG(ate.percentage) AS average_electricity_access
FROM Countries c
JOIN Access_to_Electricity ate ON c.iso_code = ate.iso_code
GROUP BY c.iso_code, c.name
HAVING AVG(ate.percentage) > 95;