-- only NOT NULL is customer age, they can just buy a ticket without being a member if they would like, but need to know age so we can know what movies they are allowed to see
CREATE TABLE IF NOT EXISTS customer (
	customer_id SERIAL PRIMARY KEY,
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	email VARCHAR(50),
	membership BOOLEAN,
	username VARCHAR(50) UNIQUE,
	pw_hash VARCHAR(50),
	rewards INTEGER,
	customer_age INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS movie (
	movie_id SERIAL PRIMARY KEY,
	title VARCHAR NOT NULL,
	description VARCHAR,
	duration INTERVAL HOUR TO MINUTE NOT NULL,
	rating VARCHAR NOT NULL,
	imdb INTEGER
);

CREATE TABLE IF NOT EXISTS theater (
	theater_id SERIAL PRIMARY KEY,
	address VARCHAR NOT NULL,
	city VARCHAR NOT NULL,
	district VARCHAR,
	country VARCHAR NOT NULL
);

CREATE TABLE IF NOT EXISTS ticket (
	ticket_id SERIAL PRIMARY KEY,
	customer_id INTEGER NOT NULL,
	FOREIGN KEY(customer_id) REFERENCES customer(customer_id),
	movie_id INTEGER NOT NULL,
	FOREIGN KEY(movie_id) REFERENCES movie(movie_id),
	theater_id INTEGER NOT NULL,
	FOREIGN KEY(theater_id) REFERENCES theater(theater_id),
	theater_number INTEGER NOT NULL,
	title VARCHAR NOT NULL,
	rating VARCHAR NOT NULL
);

ALTER TABLE ticket
ADD COLUMN movie_date TIMESTAMP NOT NULL;

ALTER TABLE ticket 
ADD COLUMN price INTEGER NOT NULL;

SELECT *
FROM ticket;