SELECT c.name, AVG(ys.median_income) AS average_median_income
FROM Countries c
JOIN Yearly_Status ys ON c.iso_code = ys.iso_code
GROUP BY c.name;
