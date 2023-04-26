SELECT c.name, MIN(ep.total_production) AS min_total_energy_production
FROM Countries c
JOIN Energy_Production ep ON c.iso_code = ep.iso_code
GROUP BY c.name;
