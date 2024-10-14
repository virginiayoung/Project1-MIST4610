# Project1-MIST4610

# Team Name and Members:
Primary Keys - 
Andrew Rhodes (https://github.com/ajr70185) , Cory Abrams https://github.com/coryabrams, Jack (John) Gallagher https://github.com/jackgallagher15, Gracie (Virginia) Young https://github.com/virginiayoung, Logan Miller https://github.com/lem33453

# Scenario Description: 
This project involves building a relational database to manage the operations of a movie production and distribution company. At the center of the model is the Movie entity, representing the films produced by the company and distributed across various channels, including theaters and streaming platforms. The database will also track related elements such as actors, directors, revenue, reviews, and ratings.
The objective is to design an accurate representation of the relationships between these entities, generate sample data to populate the database, and execute queries that provide insights into the performance and public reception of the company's films.
Our main goal is to monitor the success of films across different distribution channels, analyze audience reception through reviews and aggregate ratings, track box office revenue and analyze financial performance by country, and identify trends in director and actor collaborations, as well as popular genres. 
Using this data we are able to identify top grossing films by country and genre, determine which streaming platforms are most profitable for each genre, and most importantly analyze the relationship between film reviews/ratings and overall box office success.
We are hoping that this database can serve as a helpful tool for business analysis and profitability forecasting, and can help companies confidently make decisions backed by data in areas such as production, marketing, and distribution. Our database offers in depth analytics, such as the ability to compare box office performance across multiple countries (which could be helpful in international market campaigns). Additionally, this database could be used to track actors' success across multiple genres, under center directors, and identify who is a star in the industry. 
Another problem our database solves is consumer engagement. By integrating personalized from customers using data from ratings, reviews, viewing patterns, etc companies are able to boost overall customer satisfaction. 


# Data Model:
![DATA MODEL UPDATED 1](https://github.com/user-attachments/assets/a0d932e2-085b-41c5-b968-56acf9c00e92)


Explanation: Our main entity is the Movie entity. In here, it stores the attributes that would describe a movie including its ID, the movie name, the release date, and the duration with foreign keys from the Director entity, as well as the Genre entity. There are many movies that has the same director, so this would be a non-identifying one to many relationship. Additionally, there can be many movies with the same genre, so this is also a non-identifying one to many relationship. The Director entity consists of the ID along with the director's name. Off of the Director entity, we have the Worker entity that stores the information of the many workers for each director (non-identifying one to many relationship) whose primary key feeds into the Director table. Next, we have the Actor entity that stores the information of the actors, with their first name and last name. It has a recursive one to many relationship, as many actors can only have one mentor, creating the idMentor foreign key. Additionally, there is a many to many relationship between the Actor and Movie entities, as many different actors can be in many different movies. This creates the Actor_has_Movie table, which stores which actors are in which movies. Moreover, the Movie and Streaming_Platform (which stores its ID and the name of the platform) have a many to many relationship, forming the Movie_Platform entity which stores the movies on each streaming service. We made both sides identifying, creating a composite foreign key in this entity. Moving upwards, we have the Rating table which stores its ID, the source, the score, and the foreign key from the Movie entity, as this is a one to many relationship. This entity is focused on professional reviews from companies and its corresponding rating. Similarly, the Reviews entity tracks the reviews from fans, as well as the foreign key from the Movies entity (since this is a non-identifying one to many relationship). Lastly, we have the Box Office entity that is a non-identifying one to many relationship with Movie, since there is a different Box Office by country. Off of Box Office, there is one more non-dentifying one to many relationship with the Revenue entity, where we can learn more about specific ticket sales per movie, including the amount of tickets sold and ticket price. Overall, this database supports storage of movies and its relating entities.

# Data Dictionary:
<img width="633" alt="Screenshot 2024-10-13 at 8 43 27 PM" src="https://github.com/user-attachments/assets/420871ae-ec22-406e-b07f-b95cca79a909">
<img width="632" alt="Screenshot 2024-10-13 at 8 43 58 PM" src="https://github.com/user-attachments/assets/ec6f1e45-18ac-4d3f-910b-fdee2a3ce6f6">
<img width="632" alt="Screenshot 2024-10-13 at 8 44 25 PM" src="https://github.com/user-attachments/assets/6885a707-8765-44ce-b317-c20108132f1a">
<img width="634" alt="Screenshot 2024-10-13 at 8 44 50 PM" src="https://github.com/user-attachments/assets/3caf20d9-8755-42c9-abbf-0db561f290e3">
<img width="634" alt="Screenshot 2024-10-13 at 8 45 02 PM" src="https://github.com/user-attachments/assets/278468ac-e13e-4fbc-b17f-b300a5c78e08">
<img width="633" alt="Screenshot 2024-10-13 at 8 45 26 PM" src="https://github.com/user-attachments/assets/ed0c2fb9-d88b-4ff2-88d8-6c6fe6270a88">
<img width="634" alt="Screenshot 2024-10-13 at 8 45 43 PM" src="https://github.com/user-attachments/assets/0c52deac-0c8f-4082-af74-459a482bb2d5">
<img width="639" alt="Screenshot 2024-10-13 at 8 46 08 PM" src="https://github.com/user-attachments/assets/1b632193-21c0-466c-9084-d95551ee7757">


# Ten Queries:

# Which movies have mentees of Leonardo DiCaprio acted in and what role did they play?
select mentor.firstName, mentor.lastName, mentee.firstName, mentee.lastName, movie.movieName, actorMovie.roleName
from Actor as mentor
join Actor as mentee on mentor.idActor = mentee.idMentor
join Actor_has_Movie as actorMovie on mentee.idActor = actorMovie.idActor
join Movie as movie on actorMovie.idMovie = movie.idMovie
where mentor.firstName = 'Leonardo' and mentor.lastName = 'DiCaprio';

<img width="444" alt="Screenshot 2024-10-13 at 5 52 13 PM" src="https://github.com/user-attachments/assets/0c533dcb-5649-425f-a325-7ef6af12757c">

Justification: Tracking which movies Leonardo DiCaprio's mentees have acted in and the roles they played allows a manager to evaluate the influence of mentorship on their career development. The data assists in planning future collaborations to help mentees reach new milestones in their careers and informs us which actors use Leonardo DiCaprio as their mentor.

# Find the highest rated movies based on average review scores from all sources
select movieName, avg(Rating.score) as average_rating
from Movie 
join Rating on Movie.idMovie = Rating.idMovie
group by movieName
order by average_rating desc;

<img width="188" alt="Screenshot 2024-10-13 at 5 52 44 PM" src="https://github.com/user-attachments/assets/2f738bf6-9aef-4140-b76d-bc2225b9b74d">

Justification: Identifying the highest-rated movies based on average review scores from all sources allows a manager to recognize films that have achieved success across audiences and reviewers. This information helps in making strategic decisions about potential future films that have lasting appeal and credibility in the industry.

# Find the total box office revenue generated for each movie, including number of tickets sold and average ticket price
select movieName, sum(ticketsSold * ticketPrice) as total_revenue, avg(ticketPrice) as avg_ticket_price, sum(ticketsSold) as total_tickets_sold
from Revenue 
join Box_Office on Revenue.idRevenue = Box_Office.idRevenue
join Movie on Box_Office.idMovie = Movie.idMovie
group by movieName;

<img width="365" alt="Screenshot 2024-10-13 at 5 53 05 PM" src="https://github.com/user-attachments/assets/5a216c9d-d392-4195-b986-c947d36b6745">

Justification: Calculating the total box office revenue for each movie along with the number of tickets sold and the average ticket price gives a manager comprehensive insights into a film's financial performance. This data helps assess the film's profitability, providing key information for making future movie decisions.

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

Justification: Identifying streaming platforms that offer action movies, along with the number of titles available, is essential for a manager to understand market trends in the genre and which streaming platforms offer the most action movies. This information helps in making strategic decisions about partnerships and additionally helps movie producers in terms of which streaming platforms they might want their new action movie on.

# Count the number of movies directed by each director only including directors that have directed more than 1 movie
select firstName, lastName, count(Movie.idMovie) as movie_count
from Director
join Movie on Director.idDirector = Movie.idDirector
group by Director.idDirector
having count(Movie.idMovie) > 1
order by movie_count desc;

<img width="212" alt="Screenshot 2024-10-13 at 5 53 39 PM" src="https://github.com/user-attachments/assets/d6916f5d-02b6-4aef-9309-fb9b1ae15ef6">

Justification: Counting the number of movies directed by directors with more than one film helps a manager identify which directors have proven success in the movie industry. This data can help when selecting directors for future projects, since directors with multiple films are more likely to have experience managing productions which can deliver successful results.

# Which movie genres have an average rating greater than 70, and what are the individual movies within those genres along with their average ratings
select genreName, movieName, avg(Rating.score) as average_rating
from Movie
join Genre on Movie.idGenre = Genre.idGenre
join Rating on Rating.idMovie = Movie.idMovie
group by genreName, Movie.idMovie
having avg(Rating.Score) > 70
order by genreName, average_rating desc;

<img width="250" alt="Screenshot 2024-10-13 at 5 54 37 PM" src="https://github.com/user-attachments/assets/c86ddb29-ce14-4d9b-9289-3f5083529bf5">

Justification: Identifying movie genres with an average rating above 70, along with the individual movies and their ratings, is valuable for a manager because it highlights successful genres and films within those categories. This data helps in making informed decisions about future projects, which allows managers to focus on genres that are successful in terms of ratings.

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

Justification: Listing all movies featuring Leonardo DiCaprio, along with his role name and total revenue, provides a manager with critical data on his box office impact and the types of roles that generate the most revenue. This can help him negotiate future deals and determine which projects align with his past successes.

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

Justification: Listing all actors who have never worked with Christopher Nolan can help a manager identify potential new collaborations for future projects. A manager can explore new dynamics and create unique casting opportunities that could appeal to both the director and the audience.
	
# List all directors who have directed movies available on more than 1 streaming platforms
select firstName, lastName, count(distinct Movie_Platform.idStreamingPlatform) as platform_count
from Director
join Movie on Director.idDirector = Movie.idDirector
join Movie_Platform on Movie.idMovie = Movie_Platform.idMovie
group by Director.idDirector
having count(distinct Movie_Platform.idStreamingPlatform) > 1;

<img width="218" alt="Screenshot 2024-10-13 at 5 55 25 PM" src="https://github.com/user-attachments/assets/207051e0-eee9-4acc-9f36-c55323aebea7">

Justification: Listing all directors who have movies available on more than one streaming platform is crucial for a manager to assess the reach of a director’s work. It can be assumed that directors with movies on multiple platforms will have higher audience access and potentially views. This increases their market influence and potential for higher viewership.

# Find all workers who have worked with Steven Spielberg in the role of "cinematographer"
select Worker.firstName, Worker.lastName, Worker.role
from Worker
join Director on Worker.idDirector = Director.idDirector
where Director.firstName = "Steven"
and Director.lastName = "Spielberg"
and Worker.role in ("Cinematographer");

<img width="221" alt="Screenshot 2024-10-13 at 5 55 43 PM" src="https://github.com/user-attachments/assets/9f262259-f793-4150-aec0-5d965b5e3599">

Justification: Finding all workers who have served as cinematographers on Steven Spielberg’s films helps a manager identify top-tier talent in the industry. Knowing which cinematographers have collaborated with Spielberg provides insights into their technical expertise, visual style, and ability to meet the demands of large-scale productions.

# Database Information:
<img width="1142" alt="Screenshot 2024-10-13 at 7 21 28 PM" src="https://github.com/user-attachments/assets/e4d150a6-5626-4350-94c2-b8c6345bab04">


