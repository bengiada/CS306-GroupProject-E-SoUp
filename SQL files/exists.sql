SELECT *
FROM Countries c
WHERE EXISTS (
  SELECT 1
  FROM high_electricity_access_countries heac
  WHERE heac.iso_code = c.iso_code
);
