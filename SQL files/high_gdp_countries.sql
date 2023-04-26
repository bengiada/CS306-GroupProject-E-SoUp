CREATE VIEW high_gdp_countries AS
SELECT c.iso_code, c.name, AVG(ys.GDP) AS average_gdp
FROM Countries c
JOIN Yearly_Status ys ON c.iso_code = ys.iso_code
GROUP BY c.iso_code, c.name
HAVING AVG(ys.GDP) > (SELECT AVG(GDP) FROM Yearly_Status);