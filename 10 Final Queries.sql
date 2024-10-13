use cs_ajr70185;

# Which movies have mentees of Leonardo DiCaprio acted in and what role did they play?
select mentor.firstName, mentor.lastName, mentee.firstName, mentee.lastName, movie.movieName, actorMovie.roleName
from Actor as mentor
join Actor as mentee on mentor.idActor = mentee.idMentor
join Actor_has_Movie as actorMovie on mentee.idActor = actorMovie.idActor
join Movie as movie on actorMovie.idMovie = movie.idMovie
where mentor.firstName = 'Leonardo' and mentor.lastName = 'DiCaprio';

# Find the highest rated movies based on average review scores from all sources
select movieName, avg(Rating.score) as average_rating
from Movie 
join Rating on Movie.idMovie = Rating.idMovie
group by movieName
order by average_rating desc;

# Find the total box office revenue generated for each movie, including number of tickets sold and average ticket price
select movieName, sum(ticketsSold * ticketPrice) as total_revenue, avg(ticketPrice) as avg_ticket_price, sum(ticketsSold) as total_tickets_sold
from Revenue 
join Box_Office on Revenue.idRevenue = Box_Office.idRevenue
join Movie on Box_Office.idMovie = Movie.idMovie
group by movieName;

# Find the Streaming Platforms that have action movies and the amount
select platformName, count(Movie.idMovie) as movie_count
from Movie_Platform 
join Movie on Movie_Platform.idMovie = Movie.idMovie
join Genre on Movie.idGenre = Genre.idGenre
join Streaming_Platform on Movie_Platform.idStreamingPlatform = Streaming_Platform.idStreamingPlatform
where genreName = 'Action'
group by platformName
order by movie_count desc;

# Count the number of movies directed by each director only including directors that have directed more than 1 movie
select firstName, lastName, count(Movie.idMovie) as movie_count
from Director
join Movie on Director.idDirector = Movie.idDirector
group by Director.idDirector
having count(Movie.idMovie) > 1
order by movie_count desc;

# Which movie genres have an average rating greater than 70, and what are the individual movies within those genres along with their average ratings
select genreName, movieName, avg(Rating.score) as average_rating
from Movie
join Genre on Movie.idGenre = Genre.idGenre
join Rating on Rating.idMovie = Movie.idMovie
group by genreName, Movie.idMovie
having avg(Rating.Score) > 7
order by genreName, average_rating desc;

# List all the movies that feature Leonardo DiCaprio, along with his role name and total revenue
select firstName, lastName, movieName, roleName, sum(ticketsSold * ticketPrice) as total_revenue
from Actor
join Actor_has_Movie on Actor.idActor = Actor_has_Movie.idActor
join Movie on Actor_has_Movie.idMovie = Movie.idMovie
join Box_Office on Movie.idMovie = Box_Office.idMovie
join Revenue on Revenue.idRevenue = Box_Office.idRevenue
group by Actor.idActor, movieName, roleName
having firstName = "Leonardo" and lastName = "DiCaprio";

# List all actors who have never worked with Christopher Nolan
select Actor.firstName, Actor.lastName
from Actor
where not exists(select * 
	from Actor_has_Movie
    join Movie on Actor_has_Movie.idMovie = Movie.idMovie
    join Director on Movie.idDirector = Director.idDirector
    where Actor.idActor = Actor_has_Movie.idActor
    and Director.firstName = "Christopher" and Director.lastName = "Nolan");
	
# List all directors who have directed movies available on more than 1 streaming platforms
select firstName, lastName, count(distinct Movie_Platform.idStreamingPlatform) as platform_count
from Director
join Movie on Director.idDirector = Movie.idDirector
join Movie_Platform on Movie.idMovie = Movie_Platform.idMovie
group by Director.idDirector
having count(distinct Movie_Platform.idStreamingPlatform) > 1;

# find all workers who have worked with Steven Spielberg in the role of "cinematographer"
select Worker.firstName, Worker.lastName, Worker.role
from Worker
join Director on Worker.idDirector = Director.idDirector
where Director.firstName = "Steven"
and Director.lastName = "Spielberg"
and Worker.role in ("Cinematographer");