DROP DATABASE IF EXISTS craiglist;
CREATE DATABASE craiglist;

\c craiglist

CREATE TABLE regions(
    id SERIAL PRIMARY KEY,
    region VARCHAR(255) NOT NULL
);

CREATE TABLE users(
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(15) NOT NULL,
    last_name VARCHAR(15) NOT NULL,
    phone_number VARCHAR(15) UNIQUE,
    email VARCHAR(64) UNIQUE,
    mail_address TEXT NOT NULL
);

CREATE TABLE posts(
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    text_description TEXT NOT NULL,
    post_date TIMESTAMP NOT NULL
);

CREATE TABLE users_posts(
    id SERIAL PRIMARY KEY,
    user_id INTEGER REFERENCES users,
    post_id INTEGER REFERENCES posts,
    location_id INTEGER REFERENCES regions
);

CREATE TABLE categories(
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL
);

CREATE TABLE category_post(
    id SERIAL PRIMARY KEY,
    category_id INTEGER REFERENCES categories,
    post_id INTEGER REFERENCES posts
);