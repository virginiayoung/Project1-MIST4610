INSERT INTO Genre (idGenre, genreName)
VALUES
(1, 'Action'),
(2, 'Comedy'),
(3, 'Drama'),
(4, 'Horror'),
(5, 'Sci-Fi'),
(6, 'Romance'),
(7, 'Thriller'),
(8, 'Documentary'),
(9, 'Animation'),
(10, 'Fantasy');

INSERT INTO Director (idDirector, firstName, lastName)
VALUES
(1, 'Steven', 'Spielberg'),
(2, 'Christopher', 'Nolan'),
(3, 'Martin', 'Scorsese'),
(4, 'James', 'Cameron'),
(5, 'Quentin', 'Tarantino'),
(6, 'Peter', 'Jackson'),
(7, 'Ridley', 'Scott'),
(8, 'Alfred', 'Hitchcock'),
(9, 'Francis', 'Coppola'),
(10, 'Stanley', 'Kubrick');

INSERT INTO Movie (idMovie, movieName, releaseDate, duration, idDirector, idGenre)
VALUES
(1, 'Inception', '2010-07-16', 148, 2, 5),
(2, 'Titanic', '1997-12-19', 195, 4, 6),
(3, 'The Godfather', '1972-03-24', 175, 9, 3),
(4, 'Pulp Fiction', '1994-10-14', 154, 5, 2),
(5, 'The Dark Knight', '2008-07-18', 152, 2, 1),
(6, 'Schindler’s List', '1993-12-15', 195, 1, 3),
(7, 'Avatar', '2009-12-18', 162, 4, 5),
(8, 'The Matrix', '1999-03-31', 136, 10, 1),
(9, 'Gladiator', '2000-05-05', 155, 7, 1),
(10, 'Jurassic Park', '1993-06-11', 127, 1, 1);

INSERT INTO Revenue (idRevenue, ticketsSold, ticketPrice)
VALUES
(1, 500000, 10),
(2, 400000, 9),
(3, 350000, 8),
(4, 450000, 11),
(5, 300000, 12),
(6, 550000, 10),
(7, 600000, 9),
(8, 700000, 8),
(9, 650000, 11),
(10, 750000, 12);

INSERT INTO Box_Office (idBox_Office, Country, noTheaters, idMovie, idRevenue)
VALUES
(1, 'USA', 4000, 1, 1),
(2, 'UK', 3500, 2, 2),
(3, 'Canada', 3000, 3, 3),
(4, 'Germany', 2500, 4, 4),
(5, 'France', 2000, 5, 5),
(6, 'Australia', 1800, 6, 6),
(7, 'India', 5000, 7, 7),
(8, 'China', 6000, 8, 8),
(9, 'Japan', 4500, 9, 9),
(10, 'Brazil', 2800, 10, 10);

INSERT INTO Reviews (idReviews, reviewerName, reviewerRating, reviewDate, Movie_idMovie)
VALUES
(1, 'Roger Ebert', 9, '2010-07-18', 1),
(2, 'Peter Travers', 8, '1997-12-20', 2),
(3, 'Richard Roeper', 10, '1972-03-25', 3),
(4, 'A.O. Scott', 9, '1994-10-15', 4),
(5, 'Owen Gleiberman', 10, '2008-07-19', 5),
(6, 'Todd McCarthy', 8, '1993-12-16', 6),
(7, 'Ann Hornaday', 9, '2009-12-19', 7),
(8, 'Michael Phillips', 10, '1999-04-01', 8),
(9, 'Claudia Puig', 9, '2000-05-06', 9),
(10, 'Manohla Dargis', 8, '1993-06-12', 10);

INSERT INTO Rating (idRating, Source, Score, idMovie)
VALUES
(1, 'IMDb', 80, 1),
(2, 'Rotten Tomatoes', 87, 2),
(3, 'Metacritic', 92, 3),
(4, 'IMDb', 90, 4),
(5, 'Rotten Tomatoes', 94, 5),
(6, 'Metacritic', 88, 6),
(7, 'IMDb', 70, 7),
(8, 'Rotten Tomatoes', 84, 8),
(9, 'Metacritic', 90, 9),
(10, 'IMDb', 80, 10);

INSERT INTO Streaming_Platform (idStreamingPlatform, platformName)
VALUES
(1, 'Netflix'),
(2, 'Amazon Prime'),
(3, 'Disney+'),
(4, 'HBO Max'),
(5, 'Hulu'),
(6, 'Apple TV+'),
(7, 'Paramount+'),
(8, 'Peacock'),
(9, 'Starz'),
(10, 'Showtime');

INSERT INTO Movie_Platform (idMovie, idStreamingPlatform)
VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);

INSERT INTO Worker (idWorkers, firstName, lastName, role, idDirector)
VALUES
(1, 'John', 'Doe', 'Cinematographer', 1),
(2, 'Jane', 'Smith', 'Screenwriter', 2),
(3, 'Robert', 'Johnson', 'Editor', 3),
(4, 'Emily', 'Brown', 'Composer', 4),
(5, 'Michael', 'Williams', 'Producer', 5),
(6, 'Sarah', 'Jones', 'Costume Designer', 6),
(7, 'David', 'Miller', 'Art Director', 7),
(8, 'Emma', 'Davis', 'Makeup Artist', 8),
(9, 'Chris', 'Garcia', 'Visual Effects Supervisor', 9),
(10, 'Olivia', 'Johnson', 'Sound Engineer', 10);

SET FOREIGN_KEY_CHECKS = 0;

INSERT INTO Actor (idActor, firstName, lastName, idMentor)
VALUES
(1, 'Leonardo', 'DiCaprio', null),
(2, 'Robert', 'De Niro', 3),
(3, 'Brad', 'Pitt', 1),
(4, 'Scarlett', 'Johansson', 6),
(5, 'Tom', 'Hanks', 7),
(6, 'Natalie', 'Portman', 9),
(7, 'Johnny', 'Depp', 10),
(8, 'Morgan', 'Freeman', null),
(9, 'Denzel', 'Washington', 5),
(10, 'Meryl', 'Streep', null);

SET FOREIGN_KEY_CHECKS = 1;

INSERT INTO Actor_has_Movie (idMovieActor, roleName, idMovie, idActor)
VALUES
(1, 'Dom Cobb', 1, 1),
(2, 'Jack Dawson', 2, 2),
(3, 'Michael Corleone', 3, 3),
(4, 'Vincent Vega', 4, 4),
(5, 'Bruce Wayne', 5, 1),
(6, 'Oskar Schindler', 6, 5),
(7, 'Jake Sully', 7, 6),
(8, 'Neo', 8, 7),
(9, 'Maximus', 9, 8),
(10, 'Dr. Alan Grant', 10, 9);