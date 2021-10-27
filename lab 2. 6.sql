USE sakila;

-- 1 In the table actor, which are the actors whose last names are not repeated? 
SELECT last_name, first_name FROM sakila.actor
group by last_name, first_name
HAVING count(first_name) = 1;

-- 2 Which last names appear more than once?
Select last_name, COUNT(first_name) from sakila.actor
GROUP BY last_name 
having COUNT(first_name) <> 1;

-- 3 Using the rental table, find out how many rentals were processed by each employee.
SELECT staff_id, COUNT(rental_id) from sakila.rental
group by staff_id;

-- 4 Using the film table, find out how many films were released each year.
SELECT COUNT(title), release_year from sakila.film
group by release_year;

-- 5 Using the film table, find out for each rating how many films were there.
SELECT COUNT(title), rating from sakila.film
group by rating;

-- 6 What is the mean length of the film for each rating type. Round off the average lengths to two decimal places
SELECT rating, round(AVG(length), 2)  from sakila.film
group by rating;

-- 7 Which kind of movies (rating) have a mean duration of more than two hours?
SELECT rating, AVG(length) FROM sakila.film
GROUP BY rating 
HAVING AVG(length) >120;

-- 8 Rank films by length (filter out the rows that have nulls or 0s in length column).In your output, only select the columns title, length, and the rank.
SELECT title, length FROM sakila.film
GROUP BY length HAVING length != 0 AND length IS NOT NULL
ORDER BY length DESC;
