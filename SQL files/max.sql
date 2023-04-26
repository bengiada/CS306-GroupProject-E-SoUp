SELECT c.name, MAX(ec.amount) AS max_energy_consumption
FROM Countries c
JOIN Energy_Consumption ec ON c.iso_code = ec.iso_code
GROUP BY c.name;
