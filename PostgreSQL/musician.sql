CREATE TABLE IF NOT EXISTS Genre (
	genre_id SERIAL PRIMARY KEY,
	genre_name TEXT
);

CREATE TABLE IF NOT EXISTS Singer (
	singer_id SERIAL PRIMARY KEY,
	singer_name TEXT
);

CREATE TABLE IF NOT EXISTS singer_genre (
	singer_genre_id SERIAL PRIMARY KEY,
	singer_id INTEGER NOT NULL REFERENCES Singer(singer_id),
	genre_id INTEGER NOT NULL REFERENCES Genre(genre_id)
);

CREATE TABLE IF NOT EXISTS Album (
	album_id SERIAL PRIMARY KEY,
	album_name TEXT,
	album_year INTEGER
);

CREATE TABLE IF NOT EXISTS singer_album (
	singer_album_id SERIAL PRIMARY KEY,
	singer_id INTEGER NOT NULL REFERENCES Singer(singer_id),
	album_id INTEGER NOT NULL REFERENCES Album(album_id)
);

CREATE TABLE IF NOT EXISTS Collection (
	collection_id SERIAL PRIMARY KEY,
	collection_name TEXT,
	collection_year INTEGER
);

CREATE TABLE IF NOT EXISTS Track (
	track_id SERIAL PRIMARY KEY,
	track_name TEXT,
	track_time INTEGER,
	album TEXT NOT NULL REFERENCES Album(album_id)
);

CREATE TABLE IF NOT EXISTS track_collection (
	track_collection_id SERIAL PRIMARY KEY,
	track_id INTEGER NOT NULL REFERENCES Track(track_id),
	collection_id INTEGER NOT NULL REFERENCES Collection(collection_id)
);
