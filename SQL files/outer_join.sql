SELECT hgc.iso_code
FROM high_gdp_countries hgc
LEFT JOIN low_co2_emissions_countries lcec ON hgc.iso_code = lcec.iso_code
WHERE lcec.iso_code IS NULL;