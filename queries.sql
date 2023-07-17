/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals WHERE name LIKE '%mon';
SELECT name FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';
SELECT name FROM animals WHERE neutered = B'1' AND escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name IN ('Agumon', 'Pikachu');
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered = B'1';
SELECT * FROM animals WHERE name <> 'Gabumon';
SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3;

/* Add unspecified to species in using transaction and rollback */

BEGIN;
UPDATE animals SET species = 'unspecified';
SELECT * FROM animals;
ROLLBACK;
SELECT * FROM animals;

/* Add pokemon and digimon to species */

BEGIN;
UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';
UPDATE animals SET species = 'pokemon' WHERE species IS NULL;
Select * from animals;
COMMIT;
Select * from animals;

/* Delete all records */

BEGIN;
DELETE FROM animals;
ROLLBACK;
SELECT * FROM animals;

/* Update weight_kg column and delete animal */

BEGIN;
DELETE FROM animals WHERE date_of_birth > '2022-01-01';
SAVEPOINT last_savepoint;
UPDATE animals SET weight_kg = weight_kg * -1;
ROLLBACK TO last_savepoint;
UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;
COMMIT;

/* */

SELECT COUNT(*) as animals_count FROM animals;
SELECT COUNT(*) as never_escape FROM animals WHERE escape_attempts = 0;
SELECT AVG(weight_kg) FROM animals;
SELECT neutered, SUM(escape_attempts) as escape_times FROM animals GROUP BY neutered ORDER BY escape_times DESC;
SELECT species, MIN(weight_kg) as min_weight, MAX(weight_kg) as max_weight FROM animals GROUP BY species;
SELECT species, AVG(escape_attempts) as avg_escape_attempts FROM animals WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31' GROUP BY species;

/* Queries using JOIN */

SELECT name FROM animals JOIN owners ON animals.owner_id = owners.id WHERE owners.full_name = 'Melody Pond';
SELECT animals.name, species.name FROM animals JOIN species ON animals.species_id = species.id WHERE species.name = 'Pokemon';
SELECT full_name, animals.name FROM owners LEFT JOIN animals ON owners.id = animals.owner_id;
SELECT species.name, COUNT(species_id) FROM animals JOIN species ON animals.species_id = species.id GROUP BY species.name;
SELECT animals.name FROM animals JOIN owners ON animals.owner_id = owners.id JOIN species ON animals.species_id = species.id WHERE species.name = 'Digimon' AND owners.full_name = 'Jennifer Orwell';
SELECT animals.name FROM animals JOIN owners ON animals.owner_id = owners.id WHERE escape_attempts = 0 AND owners.full_name = 'Dean Winchester';
SELECT owners.full_name, COUNT(owner_id) as max_animals FROM animals JOIN owners ON animals.owner_id = owners.id GROUP BY owners.full_name ORDER BY max_animals DESC LIMIT 1;


-- Day 1 Week 2

SELECT COUNT(*) FROM visits where animal_id = 4;