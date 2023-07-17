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

/* UPDATE animals table */

ALTER TABLE animals ALTER COLUMN id SET NOT NULL;
ALTER TABLE animals ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (START WITH 11);

ALTER TABLE animals
DROP COLUMN species,
ADD COLUMN species_id INT,
ADD COLUMN owner_id INT,
ADD PRIMARY KEY (id),
ADD CONSTRAINT fk_animals_species FOREIGN KEY (species_id) REFERENCES species (id),
ADD CONSTRAINT fk_animals_owners FOREIGN KEY (owner_id) REFERENCES owners (id);


-- Day 1 week 2
-- Add an email column to your owners table
ALTER TABLE owners ADD COLUMN email VARCHAR(120);

CREATE INDEX animal_id_desc ON visits(animal_id);

CREATE INDEX vet_id_desc ON visits(vet_id);

CREATE INDEX visit_id_desc ON visits(id);

CREATE INDEX visit_vet_id_desc ON visits(id, vet_id);
