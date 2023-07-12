/* Database schema to keep the structure of entire database. */

/* Animals Table */

CREATE TABLE animals (
  id INT, 
  name TEXT, 
  date_of_birth DATE, 
  escape_attempts INT, 
  neutered BIT, 
  weight_kg DECIMAL(10, 2)
);

ALTER TABLE animals ADD COLUMN species VARCHAR(100);

/* Owners Table */

CREATE TABLE owners (
	id INT GENERATED ALWAYS AS IDENTITY,
	full_name VARCHAR(100),
	age INT,
	PRIMARY KEY(id)
);

/* Species Table */

CREATE TABLE species (
    id INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(100),
    PRIMARY KEY(id)
);
