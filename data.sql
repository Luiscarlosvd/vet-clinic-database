/* Populate database with sample data. */

/* Animals info */

INSERT INTO animals VALUES (1, 'Agumon', '2020-02-03', 0, B'1', 10.23);
INSERT INTO animals VALUES (2, 'Gabumon', '2018-11-15', 2, B'1', 8.00);
INSERT INTO animals VALUES (3, 'Pikachu', '2021-01-07', 1, B'0', 15.04);
INSERT INTO animals VALUES (4, 'Devimon', '2017-05-12', 5, B'1', 11.00);
INSERT INTO animals VALUES (5, 'Charmander', '2020-02-08', 0, B'0', -11.00);
INSERT INTO animals VALUES (6, 'Plantmon', '2021-11-15', 2, B'1', -5.7);
INSERT INTO animals VALUES (7, 'Squirtle', '1993-04-02', 3, B'0', -12.13);
INSERT INTO animals VALUES (8, 'Angemon', '2005-06-12', 1, B'1', -45);
INSERT INTO animals VALUES (9, 'Boarmon', '2005-06-07', 7, B'1', 20.4);
INSERT INTO animals VALUES (10, 'Blossom', '1998-10-13', 3, B'1', 17);
INSERT INTO animals VALUES (11, 'Ditto', '2022-05-14', 4, B'1', 22);

/* OWNERS */

INSERT INTO owners (full_name, age)
VALUES
    ('Sam Smith', 34),
    ('Jennifer Orwell', 19),
    ('Bob', 45),
    ('Melody Pond', 77),
    ('Dean Winchester', 14),
    ('Jodie Whittaker', 38);

/* SPECIES */

INSERT INTO species (name)
VALUES
    ('Pokemon'),
    ('Digimon');

/* Update animals species_id */

UPDATE animals SET species_id = (SELECT id FROM species WHERE name = 'Digimon') WHERE name LIKE '%mon';
UPDATE animals SET species_id = (SELECT id FROM species WHERE name = 'Pokemon') WHERE species_id IS NULL;

/* Update animals owners_id */

UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Sam Smith') WHERE name = 'Agumon';
UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Jennifer Orwell') WHERE name IN ('Gabumon', 'Pikachu');
UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Bob') WHERE name IN ('Devimon', 'Plantmon');
UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Melody Pond') WHERE name IN ('Charmander', 'Squirtle', 'Blossom');
UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Dean Winchester') WHERE name IN ('Angemon', 'Boarmon');

/* Add vets information */

INSERT INTO vets (name, age, date_of_graduation) VALUES ('William Tatcher', 45, '2000-04-23');
INSERT INTO vets (name, age, date_of_graduation) VALUES ('Maisy Smith', 26, '2019-01-17');
INSERT INTO vets (name, age, date_of_graduation) VALUES ('Stephanie Mendez', 64, '1981-05-04');
INSERT INTO vets (name, age, date_of_graduation) VALUES ('Jack Harkness', 38, '2008-06-08');

/* Add specializations information */

INSERT INTO specializations (vet_id, species_id)
VALUES 
  ((SELECT id FROM vets WHERE name = 'William Tatcher'), 
  (SELECT id FROM species WHERE name = 'Pokemon')),
  ((SELECT id FROM vets WHERE name = 'Stephanie Mendez'), 
  (SELECT id FROM species WHERE name = 'Digimon')),
  ((SELECT id FROM vets WHERE name = 'Stephanie Mendez'), 
  (SELECT id FROM species WHERE name = 'Pokemon')),
  ((SELECT id FROM vets WHERE name = 'Jack Harkness'), 
  (SELECT id FROM species WHERE name = 'Digimon'));

/* Add information for visits table */

INSERT INTO visits (animal_id, vet_id, visit_date)
VALUES 
  ((SELECT id FROM animals WHERE name = 'Agumon'), 
  (SELECT id FROM vets WHERE name = 'William Tatcher'), 
  '2020-05-24'),
  ((SELECT id FROM animals WHERE name = 'Agumon'), 
  (SELECT id FROM vets WHERE name = 'Stephanie Mendez'), 
  '2020-07-22'),
  ((SELECT id FROM animals WHERE name = 'Gabumon'), 
  (SELECT id FROM vets WHERE name = 'Jack Harkness'), 
  '2021-02-02'),
  ((SELECT id FROM animals WHERE name = 'Pikachu'), 
  (SELECT id FROM vets WHERE name = 'Maisy Smith'), 
  '2020-01-05'),
  ((SELECT id FROM animals WHERE name = 'Pikachu'), 
  (SELECT id FROM vets WHERE name = 'Maisy Smith'), 
  '2020-03-08'),
  ((SELECT id FROM animals WHERE name = 'Pikachu'), 
  (SELECT id FROM vets WHERE name = 'Maisy Smith'), 
  '2020-05-14'),
  ((SELECT id FROM animals WHERE name = 'Devimon'), 
  (SELECT id FROM vets WHERE name = 'Stephanie Mendez'), 
  '2021-05-04'),
  ((SELECT id FROM animals WHERE name = 'Charmander'), 
  (SELECT id FROM vets WHERE name = 'Jack Harkness'), 
  '2021-02-24'),
  ((SELECT id FROM animals WHERE name = 'Plantmon'), 
  (SELECT id FROM vets WHERE name = 'Maisy Smith'), 
  '2019-12-21'),
  ((SELECT id FROM animals WHERE name = 'Plantmon'), 
  (SELECT id FROM vets WHERE name = 'William Tatcher'), 
  '2020-08-10'),
  ((SELECT id FROM animals WHERE name = 'Plantmon'), 
  (SELECT id FROM vets WHERE name = 'Maisy Smith'), 
  '2021-04-07'),
  ((SELECT id FROM animals WHERE name = 'Squirtle'), 
  (SELECT id FROM vets WHERE name = 'Stephanie Mendez'), 
  '2019-09-29'),
  ((SELECT id FROM animals WHERE name = 'Angemon'), 
  (SELECT id FROM vets WHERE name = 'Jack Harkness'), 
  '2020-10-03'),
  ((SELECT id FROM animals WHERE name = 'Angemon'), 
  (SELECT id FROM vets WHERE name = 'Jack Harkness'), 
  '2020-11-04'),
  ((SELECT id FROM animals WHERE name = 'Boarmon'), 
  (SELECT id FROM vets WHERE name = 'Maisy Smith'), 
  '2019-01-24'),
  ((SELECT id FROM animals WHERE name = 'Boarmon'), 
  (SELECT id FROM vets WHERE name = 'Maisy Smith'), 
  '2019-05-15'),
  ((SELECT id FROM animals WHERE name = 'Boarmon'), 
  (SELECT id FROM vets WHERE name = 'Maisy Smith'), 
  '2020-02-27'),
  ((SELECT id FROM animals WHERE name = 'Boarmon'), 
  (SELECT id FROM vets WHERE name = 'Maisy Smith'), 
  '2020-08-03'),
  ((SELECT id FROM animals WHERE name = 'Blossom'), 
  (SELECT id FROM vets WHERE name = 'Stephanie Mendez'), 
  '2020-05-24'),
  ((SELECT id FROM animals WHERE namede 'Blossom'), 
  (SELECT id FROM vets WHERE name = 'William Tatcher'), 
  '2021-01-11');
