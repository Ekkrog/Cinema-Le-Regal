-- Active: 1785411555314@@127.0.0.1@5433@le_regal

CREATE DATABASE le_regal;

CREATE TYPE type_langue AS ENUM ('VOST', 'VF');

CREATE TABLE film (
    idFilm INT PRIMARY KEY,
    titreFilm VARCHAR(100) NOT NULL,
    dureeMin INT NOT NULL,
    anneeSortie DATE NOT NULL
);
CREATE TABLE salle (
    numSalle INT PRIMARY KEY,
    capacite INTEGER NOT NULL
);

CREATE TABLE seance (
    idSeance INT PRIMARY KEY,
    dateSeance DATE NOT NULL,
    heureSeance TIME NOT NULL,
    langue type_langue NOT NULL,
    idFilm INT,
    numSalle INT,
    FOREIGN KEY (idFilm) REFERENCES film (idFilm),
    FOREIGN KEY (numSalle) REFERENCES salle (numSalle)
);
CREATE TABLE spectateur (
    numCarte INT PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    prenom VARCHAR(100) NOT NULL,
    mailSpectateur VARCHAR(100) NOT NULL
);

CREATE TABLE reservation (
    numReservation INT PRIMARY KEY,
    nbPlaces INTEGER NOT NULL,
    dateReservation DATE NOT NULL,
    idSpectateur INT,
    idSeance INT,
    FOREIGN KEY (idSpectateur) REFERENCES spectateur (numCarte),
    FOREIGN KEY (idSeance) REFERENCES seance (idSeance)
);