DROP DATABASE IF EXISTS outer_space;

CREATE DATABASE outer_space;

\c outer_space

CREATE TABLE galaxy(
  id SERIAL PRIMARY KEY,
  name_galaxy TEXT NOT NULL
);

CREATE TABLE stars(
  id SERIAL PRIMARY KEY,
  name_star TEXT NOT NULL
);

CREATE TABLE planets
(
  id SERIAL PRIMARY KEY,
  name_planet TEXT NOT NULL,
  orbital_period_in_years FLOAT NOT NULL,
  galaxy_id INTEGER REFERENCES galaxy
);

CREATE TABLE moons(
  id SERIAL PRIMARY KEY,
  name_moon TEXT NOT NULL,
  planet_id INTEGER REFERENCES planets
);

CREATE TABLE star_planet(
  id SERIAL PRIMARY KEY,
  star_id INTEGER REFERENCES stars,
  planet_id INTEGER REFERENCES planets
);

INSERT INTO galaxy
  (name_galaxy)
VALUES
  ('Milky Way');

INSERT INTO stars
  (name_star)
VALUES
  ('The Sun'),
  ('Proxima Centauri'),
  ('Gliese 876');

INSERT INTO planets
  (name_planet, orbital_period_in_years, galaxy_id)
VALUES
  ('Earth', 1.00, 1),
  ('Mars', 1.88, 1),
  ('Venus', 0.62, 1),
  ('Neptune', 164.8, 1),
  ('Proxima Centauri b', 0.03, 1),
  ('Gliese 876 b', 0.23, 1);

INSERT INTO moons
  (name_moon, planet_id)
VALUES
  ('The Moon', 1),
  ('Phobos', 2),
  ('Deimos', 2),
  ('Naiad', 4),
  ('Thalassa', 4), 
  ('Despina', 4), 
  ('Galatea', 4), 
  ('Larissa', 4), 
  ('S/2004 N 1', 4), 
  ('Proteus', 4), 
  ('Triton', 4), 
  ('Nereid', 4), 
  ('Halimede', 4), 
  ('Sao', 4), 
  ('Laomedeia', 4), 
  ('Psamathe', 4), 
  ('Neso', 4);

INSERT INTO star_planet
  (star_id, planet_id)
VALUES
  (1,1),
  (1,2),
  (1,3),
  (1,4),
  (2,5),
  (3,6);