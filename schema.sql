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
