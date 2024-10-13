# Project1-MIST4610

# Team Name and Members:
Primary Keys - 
Andrew Rhodes (LINK), Cory Abrams, Jack (John) Gallagher, Gracie (Virginia) Young, Logan Miller

# Scenario Description: 
A description of the scenario that you are modeling describing it in sufficient detail that makes
sense in the context of your data model. This should be reflective of your conversation with
your group and instructor (if you reach out for help).

# Data Model:
![Data Model UPDATED](https://github.com/user-attachments/assets/ef785fd3-e674-4eb5-92b1-c38aba0b25af)

Explanation: Our main entity is the Movie entity. In here, it stores the attributes that would describe a movie including its ID, the movie name, the release date, and the duration with foreign keys from the Director entity, as well as the Genre entity. There are many movies that has the same director, so this would be a non-identifying one to many relationship. Additionally, there can be many movies with the same genre, so this is also a non-identifying one to many relationship. Off of the Director entity, we have the Worker entity that stores the information of the many workers for each director (non-identifying one to many relationship) whose primary key feeds into the Director table. Next, we have the Actor entity that stores the information of the actors, with their first name and last name. It has a recursive one to many relationship, as many actors can only have one mentor. Additionally, there is a many to many relationship between the Actor and Movie entities, as many different actors can be in many different movies. This creates the Actor_has_Movie table, which stores which actors are in which movies. Moreover, the Movie and Streaming_Platform (which stores its ID and the name of the platform) have a many to many relationship, forming the Movie_Platform entity which stores the movies on each streaming service. Moving upwards, we have the Rating table which stores its ID, the source, the score, and the foreign key from the Movie entity, as this is a one to many relationship. This entity is focused on professional reviews from companies and its corresponding rating. Similarly, the Reviews entity tracks the reviews from fans, as well as the foreign key from the Movies entity (since this is a non-identifying one to many relationship). Lastly, we have the Box Office entity that is a non-identifying one to many relationship with Movie, since there is a different Box Office by country. Off of Box Office, there is one more non-dentifying one to many relationship with the Revenue entity, where we can learn more about specific ticket sales per movie, including the amount of tickets sold and ticket price. Overall, this database supports storage of movies and its relating entities.

# Data Dictionary:
The data dictionary explains the different columns in the different tables including data types
and their roles. Please refer to sample present on ELC.

# Ten Queries:

# Which movies have mentees of Leonardo DiCaprio acted in and what role did they play?
select mentor.firstName, mentor.lastName, mentee.firstName, mentee.lastName, movie.movieName, actorMovie.roleName
from Actor as mentor
join Actor as mentee on mentor.idActor = mentee.idMentor
join Actor_has_Movie as actorMovie on mentee.idActor = actorMovie.idActor
join Movie as movie on actorMovie.idMovie = movie.idMovie
where mentor.firstName = 'Leonardo' and mentor.lastName = 'DiCaprio';

<img width="444" alt="Screenshot 2024-10-13 at 5 52 13 PM" src="https://github.com/user-attachments/assets/0c533dcb-5649-425f-a325-7ef6af12757c">

Justification: why each query is
relevant from a managerial perspective (why would a manager be interested in the query
results?)

# Find the highest rated movies based on average review scores from all sources
select movieName, avg(Rating.score) as average_rating
from Movie 
join Rating on Movie.idMovie = Rating.idMovie
group by movieName
order by average_rating desc;

<img width="188" alt="Screenshot 2024-10-13 at 5 52 44 PM" src="https://github.com/user-attachments/assets/2f738bf6-9aef-4140-b76d-bc2225b9b74d">

Justification: why each query is
relevant from a managerial perspective (why would a manager be interested in the query
results?)

# Find the total box office revenue generated for each movie, including number of tickets sold and average ticket price
select movieName, sum(ticketsSold * ticketPrice) as total_revenue, avg(ticketPrice) as avg_ticket_price, sum(ticketsSold) as total_tickets_sold
from Revenue 
join Box_Office on Revenue.idRevenue = Box_Office.idRevenue
join Movie on Box_Office.idMovie = Movie.idMovie
group by movieName;

<img width="365" alt="Screenshot 2024-10-13 at 5 53 05 PM" src="https://github.com/user-attachments/assets/5a216c9d-d392-4195-b986-c947d36b6745">

Justification: why each query is
relevant from a managerial perspective (why would a manager be interested in the query
results?)

# Find the Streaming Platforms that have action movies and the amount
select platformName, count(Movie.idMovie) as movie_count
from Movie_Platform 
join Movie on Movie_Platform.idMovie = Movie.idMovie
join Genre on Movie.idGenre = Genre.idGenre
join Streaming_Platform on Movie_Platform.idStreamingPlatform = Streaming_Platform.idStreamingPlatform
where genreName = 'Action'
group by platformName
order by movie_count desc;

<img width="165" alt="Screenshot 2024-10-13 at 5 53 26 PM" src="https://github.com/user-attachments/assets/eb484fa1-79b4-4971-a181-006611dfaf52">

Justification: why each query is
relevant from a managerial perspective (why would a manager be interested in the query
results?)

# Count the number of movies directed by each director only including directors that have directed more than 1 movie
select firstName, lastName, count(Movie.idMovie) as movie_count
from Director
join Movie on Director.idDirector = Movie.idDirector
group by Director.idDirector
having count(Movie.idMovie) > 1
order by movie_count desc;

<img width="212" alt="Screenshot 2024-10-13 at 5 53 39 PM" src="https://github.com/user-attachments/assets/d6916f5d-02b6-4aef-9309-fb9b1ae15ef6">

Justification: why each query is
relevant from a managerial perspective (why would a manager be interested in the query
results?)

# Which movie genres have an average rating greater than 70, and what are the individual movies within those genres along with their average ratings
select genreName, movieName, avg(Rating.score) as average_rating
from Movie
join Genre on Movie.idGenre = Genre.idGenre
join Rating on Rating.idMovie = Movie.idMovie
group by genreName, Movie.idMovie
having avg(Rating.Score) > 70
order by genreName, average_rating desc;

<img width="250" alt="Screenshot 2024-10-13 at 5 54 37 PM" src="https://github.com/user-attachments/assets/c86ddb29-ce14-4d9b-9289-3f5083529bf5">

Justification: why each query is
relevant from a managerial perspective (why would a manager be interested in the query
results?)

# List all the movies that feature Leonardo DiCaprio, along with his role name and total revenue
select firstName, lastName, movieName, roleName, sum(ticketsSold * ticketPrice) as total_revenue
from Actor
join Actor_has_Movie on Actor.idActor = Actor_has_Movie.idActor
join Movie on Actor_has_Movie.idMovie = Movie.idMovie
join Box_Office on Movie.idMovie = Box_Office.idMovie
join Revenue on Revenue.idRevenue = Box_Office.idRevenue
group by Actor.idActor, movieName, roleName
having firstName = "Leonardo" and lastName = "DiCaprio";

<img width="384" alt="Screenshot 2024-10-13 at 5 54 55 PM" src="https://github.com/user-attachments/assets/93a0a360-88fa-448d-8ea2-bb6badcd1da9">

Justification: why each query is
relevant from a managerial perspective (why would a manager be interested in the query
results?)

# List all actors who have never worked with Christopher Nolan
select Actor.firstName, Actor.lastName
from Actor
where not exists(select * 
	from Actor_has_Movie
    join Movie on Actor_has_Movie.idMovie = Movie.idMovie
    join Director on Movie.idDirector = Director.idDirector
    where Actor.idActor = Actor_has_Movie.idActor
    and Director.firstName = "Christopher" and Director.lastName = "Nolan");

<img width="143" alt="Screenshot 2024-10-13 at 5 55 08 PM" src="https://github.com/user-attachments/assets/599f046f-e113-440a-8e42-5174066b5073">

Justification: why each query is
relevant from a managerial perspective (why would a manager be interested in the query
results?)
	
# List all directors who have directed movies available on more than 1 streaming platforms
select firstName, lastName, count(distinct Movie_Platform.idStreamingPlatform) as platform_count
from Director
join Movie on Director.idDirector = Movie.idDirector
join Movie_Platform on Movie.idMovie = Movie_Platform.idMovie
group by Director.idDirector
having count(distinct Movie_Platform.idStreamingPlatform) > 1;

<img width="218" alt="Screenshot 2024-10-13 at 5 55 25 PM" src="https://github.com/user-attachments/assets/207051e0-eee9-4acc-9f36-c55323aebea7">

Justification: why each query is
relevant from a managerial perspective (why would a manager be interested in the query
results?)

# Find all workers who have worked with Steven Spielberg in the role of "cinematographer"
select Worker.firstName, Worker.lastName, Worker.role
from Worker
join Director on Worker.idDirector = Director.idDirector
where Director.firstName = "Steven"
and Director.lastName = "Spielberg"
and Worker.role in ("Cinematographer");

<img width="221" alt="Screenshot 2024-10-13 at 5 55 43 PM" src="https://github.com/user-attachments/assets/9f262259-f793-4150-aec0-5d965b5e3599">

Justification: why each query is
relevant from a managerial perspective (why would a manager be interested in the query
results?)
