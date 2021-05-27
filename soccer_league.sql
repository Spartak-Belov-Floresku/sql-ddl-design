DROP DATABASE IF EXISTS soccer;
CREATE DATABASE soccer;

\c soccer

CREATE TABLE matches(
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL
);

CREATE TABLE teams(
    id SERIAL PRIMARY KEY,
    title VARCHAR(65) NOT NULL,
    country VARCHAR(3) NOT NULL,
    rank_team INTEGER DEFAULT NULL
);

CREATE TABLE players(
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(15) NOT NULL,
    last_name VARCHAR(15) NOT NULL,
    country VARCHAR(3) NOT NULL,
    team_id INTEGER REFERENCES teams
);

CREATE TABLE gols(
    id SERIAL PRIMARY KEY,
    amount_gols INTEGER NOT NULL
);

CREATE TABLE players_gols(
    id SERIAL PRIMARY KEY,
    player_id INTEGER REFERENCES players,
    gols_id INTEGER REFERENCES gols,
    match_id INTEGER REFERENCES matches
);

CREATE TABLE referees(
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(15) NOT NULL,
    last_name VARCHAR(15) NOT NULL,
    country VARCHAR(3) NOT NULL
);

CREATE TABLE seasons(
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    beginning_date DATE NOT NULL,
    finish_date DATE DEFAULT NULL
);

CREATE TABLE matches_seasons(
    id SERIAL PRIMARY KEY,
    team_id INTEGER REFERENCES teams,
    match_id INTEGER REFERENCES matches,
    season_id INTEGER REFERENCES seasons,
    refere_id INTEGER REFERENCES referees
);