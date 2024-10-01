use cs_ajr70185;

# Query 1
# Which actors who have won an award are starring in a movie that has generated over $100 million in total revenue
SELECT firstName, lastName, movieName, totalRevenue
FROM Actor
JOIN Actor_has_Movie ON Actor.idActor = Actor_has_Movie.idActor
JOIN Movie ON Actor_has_Movie.idMovie = Movie.idMovie
JOIN Awards ON Movie.idAwards = Awards.idAwards
JOIN Box_Office ON Movie.idMovie = Box_Office.idMovie
WHERE Box_Office.totalRevenue > 100000;

# Query 2
# Which streaming platforms offer movies that have generated at least $50 million in revenue?
SELECT Streaming_Platform.platformName, Movie.movieName, Box_Office.totalRevenue
FROM Streaming_Platform
JOIN Movie_Platform ON Streaming_Platform.idStreamingPlatform = Movie_Platform.idStreamingPlatform
JOIN Movie ON Movie_Platform.idMovie = Movie.idMovie
JOIN Box_Office ON Movie.idMovie = Box_Office.idMovie
WHERE Box_Office.totalRevenue > 50000;

# Query 3
# Which genres have the highest average box office revenue across all movies?
SELECT Genre.genreName, AVG(Box_Office.totalRevenue) AS average_revenue
FROM Genre
JOIN Movie ON Genre.idGenre = Movie.idGenre
JOIN Box_Office ON Movie.idMovie = Box_Office.idMovie
GROUP BY Genre.idGenre
ORDER BY average_revenue DESC;
