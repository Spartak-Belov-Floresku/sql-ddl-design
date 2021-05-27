DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic

CREATE TABLE airlines
(
  id SERIAL PRIMARY KEY,
  airline_name TEXT NOT NULL
);

CREATE TABLE locations(
  id SERIAL PRIMARY KEY,
  city TEXT NOT NULL,
  country TEXT NOT NULL
);

CREATE TABLE flights
(
  id SERIAL PRIMARY KEY,
  departure TIMESTAMP NOT NULL,
  arrival TIMESTAMP NOT NULL,
  flight_from INTEGER REFERENCES locations,
  flight_to INTEGER REFERENCES locations
);

CREATE TABLE seats
(
  id SERIAL PRIMARY KEY,
  seat_number VARCHAR(3) NOT NULL
);

CREATE TABLE passengers
(
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL
);

CREATE TABLE airline_tickets
(
  id SERIAL PRIMARY KEY,
  airline_id INTEGER REFERENCES airlines,
  flight_number INTEGER REFERENCES flights,
  seat_number INTEGER REFERENCES seats
);

CREATE TABLE passengers_ticket
(
  id SERIAL PRIMARY KEY,
  passenger_id INTEGER REFERENCES passengers,
  ticket_number INTEGER REFERENCES airline_tickets
);

--INSERT INTO tickets
  --(first_name, last_name, seat, departure, arrival, airline, from_city, from_country, to_city, to_country)
--VALUES
  --('Jennifer', 'Finch', '33B', '2018-04-08 09:00:00', '2018-04-08 12:00:00', 'United', 'Washington DC', 'United States', 'Seattle', 'United States'),
  --('Thadeus', 'Gathercoal', '8A', '2018-12-19 12:45:00', '2018-12-19 16:15:00', 'British Airways', 'Tokyo', 'Japan', 'London', 'United Kingdom'),
  --('Sonja', 'Pauley', '12F', '2018-01-02 07:00:00', '2018-01-02 08:03:00', 'Delta', 'Los Angeles', 'United States', 'Las Vegas', 'United States'),
  --('Jennifer', 'Finch', '20A', '2018-04-15 16:50:00', '2018-04-15 21:00:00', 'Delta', 'Seattle', 'United States', 'Mexico City', 'Mexico'),
  --('Waneta', 'Skeleton', '23D', '2018-08-01 18:30:00', '2018-08-01 21:50:00', 'TUI Fly Belgium', 'Paris', 'France', 'Casablanca', 'Morocco'),
  --('Thadeus', 'Gathercoal', '18C', '2018-10-31 01:15:00', '2018-10-31 12:55:00', 'Air China', 'Dubai', 'UAE', 'Beijing', 'China'),
  --('Berkie', 'Wycliff', '9E', '2019-02-06 06:00:00', '2019-02-06 07:47:00', 'United', 'New York', 'United States', 'Charlotte', 'United States'),
  --('Alvin', 'Leathes', '1A', '2018-12-22 14:42:00', '2018-12-22 15:56:00', 'American Airlines', 'Cedar Rapids', 'United States', 'Chicago', 'United States'),
  --('Berkie', 'Wycliff', '32B', '2019-02-06 16:28:00', '2019-02-06 19:18:00', 'American Airlines', 'Charlotte', 'United States', 'New Orleans', 'United States'),
  --('Cory', 'Squibbes', '10D', '2019-01-20 19:30:00', '2019-01-20 22:45:00', 'Avianca Brasil', 'Sao Paolo', 'Brazil', 'Santiago', 'Chile');

INSERT INTO airlines
  (airline_name)
VALUES
  ('United'),
  ('British Airways'),
  ('Delta'),
  ('TUI Fly Belgium'),
  ('Air China'),
  ('American Airlines'),
  ('Avianca Brasil');

INSERT INTO locations
  (city, country)
VALUES
  ('Washington DC', 'United States'),
  ('Seattle', 'United States'),
  ('Tokyo', 'Japan'),
  ('London', 'United Kingdom'),
  ('Los Angeles', 'United States'),
  ('Las Vegas', 'United States'),
  ('Mexico City', 'Mexico'),
  ('Paris', 'France'),
  ('Casablanca', 'Morocco'),
  ('Dubai', 'UAE'),
  ('Beijing', 'China'),
  ('New York', 'United States'),
  ('Charlotte', 'United States'),
  ('Cedar Rapids', 'United States'),
  ('Chicago', 'United States'),
  ('New Orleans', 'United States'),
  ('Santiago', 'Chile'),
  ('Sao Paolo', 'Brazil');

INSERT INTO flights
  (departure, arrival, flight_from, flight_to)
VALUES
  ('2018-04-08 09:00:00', '2018-04-08 12:00:00', 1, 2),
  ('2018-12-19 12:45:00', '2018-12-19 16:15:00', 3, 4),
  ('2018-01-02 07:00:00', '2018-01-02 08:03:00',  5, 6),
  ('2018-04-15 16:50:00', '2018-04-15 21:00:00', 2, 7),
  ('2018-08-01 18:30:00', '2018-08-01 21:50:00', 8, 9),
  ('2018-10-31 01:15:00', '2018-10-31 12:55:00', 10, 11),
  ('2019-02-06 06:00:00', '2019-02-06 07:47:00', 12, 13),
  ('2018-12-22 14:42:00', '2018-12-22 15:56:00', 14, 15),
  ('2019-02-06 16:28:00', '2019-02-06 19:18:00', 13, 16),
  ('2019-01-20 19:30:00', '2019-01-20 22:45:00', 18, 17);

INSERT INTO seats
  (seat_number)
VALUES
  ('33B'),
  ('8A'),
  ('12F'),
  ('20A'),
  ('23D'),
  ('18C'),
  ('9E'),
  ('1A'),
  ('10D'),
  ('32B');

INSERT INTO passengers
  (first_name, last_name)
VALUES
  ('Jennifer', 'Finch'),
  ('Thadeus', 'Gathercoal'),
  ('Sonja', 'Pauley'),
  ('Waneta', 'Skeleton'),
  ('Berkie', 'Wycliff'),
  ('Alvin', 'Leathes'),
  ('Cory', 'Squibbes');

INSERT INTO airline_tickets
  (airline_id, flight_number, seat_number)
VALUES
  (1, 1, 1),
  (2, 2, 2),
  (3, 3, 3),
  (3, 4, 4),
  (4, 5, 5),
  (5, 6, 6),
  (1, 7, 7),
  (6, 8, 8),
  (6, 9, 10),
  (7, 10, 9);

INSERT INTO passengers_ticket
  (passenger_id, ticket_number)
VALUES
  (1, 1),
  (2, 2),
  (3, 3),
  (1, 4),
  (4, 5),
  (2, 6),
  (5, 7),
  (6, 8),
  (5, 9),
  (7, 10);