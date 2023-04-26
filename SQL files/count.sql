SELECT c.name, COUNT(co2.volume) AS count_co2_emissions
FROM Countries c
JOIN CO2_emissions co2 ON c.iso_code = co2.iso_code
GROUP BY c.name;
