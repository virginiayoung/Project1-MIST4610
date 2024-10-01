use cs_ajr70185;

INSERT INTO Genre (idGenre, genreName)
VALUES (1, 'Action'), (2, 'Drama'), (3, 'Comedy'), (4, 'Thriller'), 
       (5, 'Horror'), (6, 'Romance'), (7, 'Sci-Fi'), (8, 'Fantasy'), 
       (9, 'Documentary'), (10, 'Animation');
       
INSERT INTO Director (idDirector, firstName, lastName)
VALUES (1, 'Steven', 'Spielberg'), (2, 'Christopher', 'Nolan'), (3, 'Martin', 'Scorsese'), 
       (4, 'Quentin', 'Tarantino'), (5, 'Kathryn', 'Bigelow'), (6, 'Greta', 'Gerwig'), 
       (7, 'James', 'Cameron'), (8, 'Peter', 'Jackson'), (9, 'Guillermo', 'del Toro'), 
       (10, 'Sofia', 'Coppola');
       
INSERT INTO Awards (idAwards, category, year)
VALUES (1, 'Best Director', 2010), (2, 'Best Actor', 1997), (3, 'Best Picture', 2010), 
       (4, 'Best Actress', 2017), (5, 'Best Director', 1997), (6, 'Best Screenplay', 1994), 
       (7, 'Best Picture', 2017), (8, 'Best Visual Effects', 2009), (9, 'Best Score', 2008), 
       (10, 'Best Picture', 2019);

INSERT INTO Streaming_Platform (idStreamingPlatform, platformName)
VALUES (1, 'Netflix'), (2, 'Hulu'), (3, 'Amazon Prime'), (4, 'Disney+'), (5, 'HBO Max'), 
       (6, 'Peacock'), (7, 'Apple TV+'), (8, 'Paramount+'), (9, 'Mubi'), (10, 'Shudder');

INSERT INTO Worker (idWorkers, firstName, lastName, idDirector)
VALUES (1, 'John', 'Doe', 1), (2, 'Jane', 'Smith', 2), (3, 'Robert', 'Johnson', 3), 
       (4, 'Emily', 'Brown', 4), (5, 'Michael', 'Williams', 5), (6, 'Sarah', 'Jones', 6), 
       (7, 'David', 'Miller', 7), (8, 'Emma', 'Davis', 8), (9, 'Chris', 'Garcia', 9), 
       (10, 'Olivia', 'Johnson', 10);

UPDATE Worker SET role = 'Director Assistant' WHERE idWorkers = 1;
UPDATE Worker SET role = 'Production Manager' WHERE idWorkers = 2;
UPDATE Worker SET role = 'Cinematographer' WHERE idWorkers = 3;
UPDATE Worker SET role = 'Script Supervisor' WHERE idWorkers = 4;
UPDATE Worker SET role = 'Casting Director' WHERE idWorkers = 5;
UPDATE Worker SET role = 'Makeup Artist' WHERE idWorkers = 6;
UPDATE Worker SET role = 'Costume Designer' WHERE idWorkers = 7;
UPDATE Worker SET role = 'Sound Engineer' WHERE idWorkers = 8;
UPDATE Worker SET role = 'Lighting Technician' WHERE idWorkers = 9;
UPDATE Worker SET role = 'Production Coordinator' WHERE idWorkers = 10;

INSERT INTO Movie (idMovie, movieName, releaseDate, duration, idDirector, idGenre, idAwards)
VALUES (1, 'Inception', '2010-07-16', 148, 2, 7, 3), (2, 'Titanic', '1997-12-19', 195, 7, 6, 5), 
       (3, 'Pulp Fiction', '1994-10-14', 154, 4, 4, 6), (4, 'The Shape of Water', '2017-12-01', 123, 9, 8, 7), 
       (5, 'Avatar', '2009-12-18', 162, 7, 7, 8), (6, 'The Dark Knight', '2008-07-18', 152, 2, 1, 9), 
       (7, 'Jaws', '1975-06-20', 124, 1, 1, 2), (8, 'The Irishman', '2019-11-27', 209, 3, 2, 10), 
       (9, 'Lady Bird', '2017-11-03', 94, 6, 2, 4), (10, 'The Hurt Locker', '2008-10-10', 131, 5, 1, 1);
       
INSERT INTO Box_Office (idBox_Office, Country, totalRevenue, noTheaters, idMovie)
VALUES (1, 'USA', 829895, 3000, 1), (2, 'USA', 2187463, 3500, 2), (3, 'USA', 213928, 2500, 3), 
       (4, 'USA', 195243, 2000, 4), (5, 'USA', 2847246, 4000, 5), (6, 'USA', 1004558, 4500, 6), 
       (7, 'USA', 470653, 1200, 7), (8, 'USA', 80000, 1200, 8), (9, 'USA', 789384, 2100, 9), 
       (10, 'USA', 150000, 1500, 10);
       
INSERT INTO Reviews (idReviews, reviewerName, reviewerRating, reviewDate, Movie_idMovie)
VALUES (1, 'Roger Ebert', '4/4', '2010-07-16', 1), (2, 'Peter Travers', '5/5', '1997-12-19', 2), 
       (3, 'A.O. Scott', 'A+', '1994-10-14', 3), (4, 'Richard Roeper', '4/4', '2017-12-01', 4), 
       (5, 'Manohla Dargis', 'B+', '2009-12-18', 5), (6, 'David Denby', 'A-', '2008-07-18', 6), 
       (7, 'Joe Morgenstern', '3.5/4', '1975-06-20', 7), (8, 'Rex Reed', 'B', '2019-11-27', 8), 
       (9, 'Dana Stevens', '4/5', '2017-11-03', 9), (10, 'Stephanie Zacharek', '3.5/5', '2008-10-10', 10);
       
INSERT INTO Rating (idRating, Source, Score, idMovie)
VALUES (1, 'Rotten Tomatoes', 87, 1), (2, 'IMDb', 9, 2), (3, 'Metacritic', 95, 3), 
       (4, 'Rotten Tomatoes', 91, 4), (5, 'IMDb', 7, 5), (6, 'Rotten Tomatoes', 94, 6), 
       (7, 'Metacritic', 89, 7), (8, 'IMDb', 8, 8), (9, 'Rotten Tomatoes', 99, 9), 
       (10, 'IMDb', 7.8, 10);
       
INSERT INTO Movie_Platform (idMovie, idStreamingPlatform)
VALUES (1, 1), (2, 4), (3, 2), (4, 3), (5, 4), (6, 1), (7, 2), (8, 5), (9, 6), (10, 7);
       
ALTER TABLE Actor MODIFY idMentor INT NULL;


INSERT INTO Actor (idActor, firstName, lastName, idMentor)
VALUES 
(1, 'Leonardo', 'DiCaprio', NULL),
(2, 'Robert', 'De Niro', NULL),
(3, 'Meryl', 'Streep', NULL),
(4, 'Brad', 'Pitt', NULL),
(5, 'Natalie', 'Portman', NULL),
(6, 'Tom', 'Hanks', NULL),
(7, 'Jennifer', 'Lawrence', NULL),
(8, 'Morgan', 'Freeman', NULL),
(9, 'Viola', 'Davis', NULL),
(10, 'Emma', 'Stone', NULL);
       
UPDATE Actor SET idMentor = 1 WHERE idActor = 4;  
UPDATE Actor SET idMentor = 3 WHERE idActor = 5;  
UPDATE Actor SET idMentor = 2 WHERE idActor = 6;  
UPDATE Actor SET idMentor = 5 WHERE idActor IN (7, 10);  
UPDATE Actor SET idMentor = 6 WHERE idActor = 9;
       
INSERT INTO Actor_has_Movie (idMovieActor, roleName, idMovie, idActor)
VALUES (1, 'Dom Cobb', 1, 1), (2, 'Jack Dawson', 2, 1), (3, 'Vincent Vega', 3, 4), 
       (4, 'Elisa Esposito', 4, 5), (5, 'Jake Sully', 5, 6), (6, 'Bruce Wayne', 6, 4), 
       (7, 'Chief Brody', 7, 8), (8, 'Frank Sheeran', 8, 2), (9, 'Christine', 9, 10), 
       (10, 'William James', 10, 9);
       
       
       
       
       
       
       
       
       


       
