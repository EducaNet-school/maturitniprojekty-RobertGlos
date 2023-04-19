
INSERT INTO actors (first_name, last_name) 
VALUES 
('Tom', 'Hanks'),
('Scarlett', 'Johansson'),
('Leonardo', 'DiCaprio'),
('Cate', 'Blanchett'),
('Benedict', 'Cumberbatch'),
('Meryl', 'Streep'),
('Idris', 'Elba'),
('Emma', 'Thompson');


INSERT INTO movies (movie_name, description, movie_length, release_date)
VALUES 
('Forrest Gump', 'A simple man with a low I.Q. wins over the hearts of people who have direct contact with him', 142, '1994-07-06'),
('Titanic', 'A seventeen-year-old aristocrat falls in love with a kind but poor artist aboard the luxurious, ill-fated R.M.S. Titanic.', 194, '1997-12-19'),
('Shawshank Redemption', 'Two imprisoned men bond over a number of years, finding solace and eventual redemption through acts of common decency.', 142, '1994-09-10'),
('The Grand Budapest Hotel', 'The adventures of Gustave H, a legendary concierge at a famous hotel from the fictional Republic of Zubrowka between the first and second World Wars, and Zero Moustafa, the lobby boy who becomes his most trusted friend.', 99, '2014-02-06'),
('The Social Network', 'Harvard student Mark Zuckerberg creates the social networking site that would become known as Facebook, but is later sued by two brothers who claimed he stole their idea, and the co-founder who was later squeezed out of the business.', 121, '2010-09-24'),
('The Silence of the Lambs', 'A young F.B.I. cadet must receive the help of an incarcerated and manipulative cannibal killer to help catch another serial killer, a madman who skins his victims.', 118, '1991-02-14'),
('A Star is Born', 'A musician helps a young singer find fame as age and alcoholism send his own career into a downward spiral.', 136, '2018-08-31'),
('La La Land', 'While navigating their careers in Los Angeles, a pianist and an actress fall in love while attempting to reconcile their aspirations for the future.', 128, '2016-08-31');


INSERT INTO movie_actors (movie_id, actor_id) 
VALUES 
(1, 1),
(1, 8),
(2, 3),
(2, 2),
(3, 1),
(3, 5),
(4, 6),
(4, 8),
(5, 3),
(5, 5),
(6, 4),
(6, 3),
(7, 2),
(7, 7),
(8, 8),
(8, 4);
INSERT INTO awards (name, description, date, place, film_id)
VALUES ('Academy Award for Best Picture', 'The Academy Award for Best Picture is one of the Academy Awards presented annually by the Academy of Motion Picture Arts and Sciences (AMPAS) since the awards debuted in 1929. This award goes to the producers of the film and is the only category in which every member of the Academy is eligible to submit a nomination and vote on the final ballot.', '1995-03-27', 'Los Angeles', 1),
       ('Golden Globe Award for Best Motion Picture – Drama', 'The Golden Globe Award for Best Motion Picture – Drama is a Golden Globe Award that has been awarded annually since 1952 by the Hollywood Foreign Press Association (HFPA).', '1995-01-21', 'Los Angeles', 1),
       ('BAFTA Award for Best Film', 'The BAFTA Award for Best Film is given annually by the British Academy of Film and Television Arts and presented at the British Academy Film Awards. It has been awarded since the 1st BAFTA Awards ceremony in 1948 and is considered the most prestigious award in the British film industry.', '1995-04-09', 'London', 1),
       ('Academy Award for Best Supporting Actor', 'The Academy Award for Best Supporting Actor is an award presented annually by the Academy of Motion Picture Arts and Sciences (AMPAS). It is given in honor of an actor who has delivered an outstanding performance in a supporting role while working within the film industry. The award was traditionally presented by the previous year''s Best Supporting Actress winner.', '1995-03-27', 'Los Angeles', 1),
       ('Academy Award for Best Adapted Screenplay', 'The Academy Award for Best Adapted Screenplay is one of the Academy Awards, the most prominent film awards in the United States. It is awarded each year to the writer of a screenplay adapted from another source (usually a novel, play, short story, or TV series but sometimes another film).', '1995-03-27', 'Los Angeles', 1),
       ('Academy Award for Best Director', 'The Academy Award for Best Director is an award presented annually by the Academy of Motion Picture Arts and Sciences (AMPAS). It is given in honor of a film director who has exhibited outstanding directing while working in the film industry. The award was traditionally presented by the previous year''s Best Actress winner.', '1995-03-27', 'Los Angeles', 1),
       ('Academy Award for Best Actor', 'The Academy Award for Best Actor is an award presented annually by the Academy of Motion Picture Arts and Sciences (AMPAS). It is given in honor of an actor who has delivered an outstanding performance in a leading role while working within the film industry.', '1995-03-27', 'Los Angeles', 2),
       ('Academy Award for Best Original Screenplay', 'The Academy Award for Best Original Screenplay is a category within the Academy Awards, presented annually by the Academy of Motion Picture Arts and Sciences (AMPAS) to the best screenplay not based upon previously published material.', '1995-03-27', 'Los Angeles', 2),
       ('Golden Globe Award for Best Motion Picture – Musical or Comedy', 'The Golden Globe Award for Best Motion Picture – Musical or Comedy is a Golden Globe Award that has been awarded annually since 1952 by the Hollywood Foreign Press Association (HFPA).', '1995-01-21', 'Los Angeles', 2);
INSERT INTO Category (category_name) VALUES 
('Drama'),
('Comedy'),
('Action'),
('Horror'),
('Romance'),
('Science Fiction'),
('Thriller'),
('Documentary');

-- Inserting data into the `filmCategory` table
INSERT INTO filmCategory (movie_id, category_id) VALUES 
(1, 1), -- The Shawshank Redemption - Drama
(1, 7), -- The Shawshank Redemption - Thriller
(2, 1), -- The Godfather - Drama
(2, 7), -- The Godfather - Thriller
(3, 1), -- The Dark Knight - Drama
(3, 3), -- The Dark Knight - Action
(3, 7), -- The Dark Knight - Thriller
(4, 2), -- The Big Lebowski - Comedy
(4, 7), -- The Big Lebowski - Thriller
(5, 4), -- The Exorcist - Horror
(6, 5), -- Titanic - Romance
(6, 1), -- Titanic - Drama
(7, 3), -- The Matrix - Action
(7, 6), -- The Matrix - Science Fiction
(7, 7), -- The Matrix - Thriller
(8, 8), -- An Inconvenient Truth - Documentary
(9, 3), -- Die Hard - Action
(9, 7), -- Die Hard - Thriller
(10, 2), -- Airplane! - Comedy
(10, 7), -- Airplane! - Thriller
(11, 1), -- Schindler's List - Drama
(11, 7), -- Schindler's List - Thriller
(12, 1), -- Forrest Gump - Drama
(12, 2), -- Forrest Gump - Comedy
(12, 7), -- Forrest Gump - Thriller
(13, 1), -- One Flew Over the Cuckoo's Nest - Drama
(13, 2), -- One Flew Over the Cuckoo's Nest - Comedy
(13, 7), -- One Flew Over the Cuckoo's Nest - Thriller
(14, 3), -- Lethal Weapon - Action
(14, 7), -- Lethal Weapon - Thriller
(15, 6), -- Interstellar - Science Fiction
(15, 7), -- Interstellar - Thriller
(16, 1), -- The Green Mile - Drama
(16, 7), -- The Green Mile - Thriller
(17, 2), -- The Hangover - Comedy
(17, 7), -- The Hangover - Thriller
(18, 1), -- The Godfather: Part II - Drama
(18, 7), -- The Godfather: Part II - Thriller
(19, 1), -- The Silence of the Lambs - Drama
(19, 7), -- The Silence of the Lambs - Thriller
(20, 1), -- Goodfellas - Drama
(20, 7); -- Goodfellas - Thriller