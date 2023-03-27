CREATE TABLE Countries (
    iso_code VARCHAR(5) NOT NULL UNIQUE,
    name VARCHAR(45),
    PRIMARY KEY (iso_code)
);

CREATE TABLE Yearly_Status (
    date INT NOT NULL,
    population INT,
    GDP BIGINT,
    median_income INT,
    iso_code VARCHAR(5) NOT NULL,
    PRIMARY KEY (iso_code ,date),
    FOREIGN KEY (iso_code) REFERENCES Countries(iso_code) ON DELETE CASCADE
);

CREATE TABLE Access_to_Electricity (
    date INT NOT NULL,
    percentage INT,
    iso_code VARCHAR(5) NOT NULL,
    PRIMARY KEY (iso_code, date),
    FOREIGN KEY (iso_code) REFERENCES Countries(iso_code) ON DELETE CASCADE
);

CREATE TABLE CO2_emissions (
    date INT NOT NULL,
    volume BIGINT,
    iso_code VARCHAR(5) NOT NULL,
    PRIMARY KEY (iso_code, date),
    FOREIGN KEY (iso_code) REFERENCES Countries(iso_code) ON DELETE CASCADE
);

CREATE TABLE Energy_Production (
    date INT NOT NULL,
    total_production INT,
    fossil INT,
    nuclear INT,
    renewable INT,
    iso_code VARCHAR(5) NOT NULL,
    PRIMARY KEY (iso_code, date),
    FOREIGN KEY (iso_code) REFERENCES Countries(iso_code) ON DELETE CASCADE
);

CREATE TABLE Energy_Consumption (
    date INT NOT NULL,
    amount INT,
    iso_code VARCHAR(5) NOT NULL,
    PRIMARY KEY (iso_code, date),
    FOREIGN KEY (iso_code) REFERENCES Countries(iso_code) ON DELETE CASCADE
);

