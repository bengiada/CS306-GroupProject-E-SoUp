SELECT c.name, SUM(ys.population) AS total_population
FROM Countries c
JOIN Yearly_Status ys ON c.iso_code = ys.iso_code
GROUP BY c.name;
