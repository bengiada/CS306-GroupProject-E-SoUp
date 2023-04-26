SELECT *
FROM Countries
WHERE iso_code IN (
  SELECT iso_code
  FROM high_electricity_access_countries
);
