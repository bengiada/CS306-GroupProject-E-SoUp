CREATE VIEW high_renewable_production_countries AS
SELECT c.iso_code, c.name, AVG(ep.renewable) AS average_renewable_production
FROM Countries c
JOIN Energy_Production ep ON c.iso_code = ep.iso_code
GROUP BY c.iso_code, c.name
HAVING AVG(ep.renewable) > (SELECT AVG(ep.renewable)
							FROM Energy_Production ep);