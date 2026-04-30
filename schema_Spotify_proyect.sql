CREATE SCHEMA Spotify_proyect;
USE Spotify_proyect;

DROP TABLE IF EXISTS country;
CREATE TABLE IF NOT EXISTS Spotify_proyect.country (
country_id INT PRIMARY KEY AUTO_INCREMENT,
country VARCHAR(30)
);

DROP TABLE IF EXISTS artist;
CREATE TABLE IF NOT EXISTS Spotify_proyect.artist (
artist_id INT PRIMARY KEY AUTO_INCREMENT,
artist VARCHAR(100)
);

DROP TABLE IF EXISTS genre;
CREATE TABLE IF NOT EXISTS Spotify_proyect.genre (
genre_id INT PRIMARY KEY AUTO_INCREMENT,
genre VARCHAR (30)
);

DROP TABLE IF EXISTS top50_country;
CREATE TABLE IF NOT EXISTS Spotify_proyect.top50_country (
id INT PRIMARY KEY AUTO_INCREMENT,
title VARCHAR(200),
artist_id INT NOT NULL,
FOREIGN KEY (artist_id) REFERENCES artist (artist_id) ON DELETE CASCADE, 
genre_id INT NOT NULL,
FOREIGN KEY (genre_id) REFERENCES genre (genre_id) ON DELETE CASCADE,
year INT,
CONSTRAINT check_year CHECK(year >= 1800 AND year <= 9999),
added VARCHAR(20),
bpm FLOAT,
nrgy FLOAT,
dnce FLOAT,
dB FLOAT,
live FLOAT,
val FLOAT,
dur FLOAT,
acous FLOAT,
spch FLOAT,
pop INT,
country_id INT NOT NULL,
FOREIGN KEY (country_id) REFERENCES country (country_id) ON DELETE CASCADE
);

