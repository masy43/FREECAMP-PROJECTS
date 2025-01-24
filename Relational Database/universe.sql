-- Create table: galaxy
CREATE TABLE galaxy (
    galaxy_id SERIAL PRIMARY KEY,
    name VARCHAR(100) UNIQUE NOT NULL,
    type TEXT NOT NULL,
    number_of_stars INT NOT NULL,
    is_spiral BOOLEAN NOT NULL
);

-- Create table: star
CREATE TABLE star (
    star_id SERIAL PRIMARY KEY,
    name VARCHAR(100) UNIQUE NOT NULL,
    galaxy_id INT NOT NULL REFERENCES galaxy(galaxy_id),
    luminosity NUMERIC NOT NULL,
    mass INT NOT NULL,
    is_main_sequence BOOLEAN NOT NULL
);

-- Create table: planet
CREATE TABLE planet (
    planet_id SERIAL PRIMARY KEY,
    name VARCHAR(100) UNIQUE NOT NULL,
    star_id INT NOT NULL REFERENCES star(star_id),
    radius INT NOT NULL,
    distance_from_star NUMERIC NOT NULL,
    has_life BOOLEAN NOT NULL
);

-- Create table: moon
CREATE TABLE moon (
    moon_id SERIAL PRIMARY KEY,
    name VARCHAR(100) UNIQUE NOT NULL,
    planet_id INT NOT NULL REFERENCES planet(planet_id),
    diameter INT NOT NULL,
    is_spherical BOOLEAN NOT NULL,
    surface_composition TEXT NOT NULL
);

-- Create table: asteroid_belt (extra table)
CREATE TABLE asteroid_belt (
    asteroid_belt_id SERIAL PRIMARY KEY,
    name VARCHAR(100) UNIQUE NOT NULL,
    star_id INT NOT NULL REFERENCES star(star_id),
    number_of_asteroids INT NOT NULL,
    contains_metal BOOLEAN NOT NULL
);

-- Insert data into galaxy
INSERT INTO galaxy (name, type, number_of_stars, is_spiral) VALUES
('Milky Way', 'Spiral', 1000000000, TRUE),
('Andromeda', 'Spiral', 1000000000, TRUE),
('Triangulum', 'Spiral', 400000000, TRUE),
('Whirlpool', 'Spiral', 300000000, TRUE),
('Sombrero', 'Elliptical', 800000000, FALSE),
('Black Eye', 'Spiral', 500000000, TRUE);

-- Insert data into star
INSERT INTO star (name, galaxy_id, luminosity, mass, is_main_sequence) VALUES
('Sun', 1, 1.0, 1, TRUE),
('Proxima Centauri', 1, 0.0017, 0.12, TRUE),
('Sirius', 1, 25.4, 2, TRUE),
('Vega', 2, 40.1, 2.1, TRUE),
('Betelgeuse', 3, 120000.0, 18, FALSE),
('Rigel', 4, 85000.0, 18, FALSE);

-- Insert data into planet
INSERT INTO planet (name, star_id, radius, distance_from_star, has_life) VALUES
('Earth', 1, 6371, 1.0, TRUE),
('Mars', 1, 3389, 1.5, FALSE),
('Jupiter', 1, 69911, 5.2, FALSE),
('Proxima b', 2, 7200, 0.05, TRUE),
('Sirius b1', 3, 5400, 0.2, FALSE),
('Sirius b2', 3, 6000, 0.3, FALSE),
('Vega b1', 4, 7000, 0.4, FALSE),
('Vega b2', 4, 7200, 0.6, FALSE),
('Betelgeuse b1', 5, 10000, 0.7, FALSE),
('Betelgeuse b2', 5, 11000, 1.0, FALSE),
('Rigel b1', 6, 9500, 1.2, FALSE),
('Rigel b2', 6, 9700, 1.5, FALSE);

-- Insert data into moon
INSERT INTO moon (name, planet_id, diameter, is_spherical, surface_composition) VALUES
('Moon', 1, 3474, TRUE, 'Rocky'),
('Phobos', 2, 22, FALSE, 'Rocky'),
('Deimos', 2, 12, FALSE, 'Rocky'),
('Europa', 3, 3121, TRUE, 'Icy'),
('Ganymede', 3, 5262, TRUE, 'Icy'),
('Io', 3, 3643, TRUE, 'Volcanic'),
('Callisto', 3, 4820, TRUE, 'Icy'),
('Proxima b Moon 1', 4, 2000, TRUE, 'Rocky'),
('Sirius b1 Moon 1', 5, 3500, TRUE, 'Rocky'),
('Sirius b2 Moon 1', 6, 4000, TRUE, 'Rocky'),
('Vega b1 Moon 1', 7, 1500, TRUE, 'Rocky'),
('Vega b2 Moon 1', 8, 2000, TRUE, 'Rocky'),
('Betelgeuse b1 Moon 1', 9, 5000, TRUE, 'Icy'),
('Betelgeuse b2 Moon 1', 10, 5500, TRUE, 'Rocky'),
('Rigel b1 Moon 1', 11, 1800, TRUE, 'Rocky'),
('Rigel b2 Moon 1', 12, 2500, TRUE, 'Rocky'),
('Extra Moon 1', 1, 1200, FALSE, 'Volcanic'),
('Extra Moon 2', 2, 1000, FALSE, 'Rocky'),
('Extra Moon 3', 3, 1300, FALSE, 'Icy'),
('Extra Moon 4', 4, 900, FALSE, 'Rocky');

-- Insert data into asteroid_belt
INSERT INTO asteroid_belt (name, star_id, number_of_asteroids, contains_metal) VALUES
('Main Belt', 1, 1000000, TRUE),
('Kuiper Belt', 1, 2000000, FALSE),
('Andromeda Belt', 2, 150000, TRUE),
('Triangulum Belt', 3, 100000, FALSE),
('Whirlpool Belt', 4, 50000, TRUE);
