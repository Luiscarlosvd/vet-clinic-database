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

-- Day 1 week 2

-- This will add 3.594.280 visits considering you have 10 animals, 4 vets, and it will use around ~87.000 timestamps (~4min approx.)
INSERT INTO visits (animal_id, vet_id, date_of_visit) SELECT * FROM (SELECT id FROM animals) animal_ids, (SELECT id FROM vets) vets_ids, generate_series('1980-01-01'::timestamp, '2021-01-01', '4 hours') visit_timestamp;

-- This will add 2.500.000 owners with full_name = 'Owner <X>' and email = 'owner_<X>@email.com' (~2min approx.)
insert into owners (full_name, email) 
select 'Owner ' || generate_series(1,2500000), 
'owner_' || generate_series(1,2500000) || '@mail.com';

-- This will add 2.500.000 owners with full_name = 'Owner <X>' and email = 'owner_<X>@email.com' (~2min approx.)
insert into owners (full_name, email) 
select 'Owner ' || generate_series(1,2500000), 
'owner_' || generate_series(1,2500000) || '@mail.com';
