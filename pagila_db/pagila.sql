-- What is the average cost to rent a film in the stores?
SELECT AVG(rental_rate) AS "average rental rate"
FROM film;

-- What is the average rental cost of films by rating? 
SELECT AVG(rental_rate) AS "average rental rate"
FROM film
GROUP BY rating;

-- How much would it cost to replace all films in the database?
SELECT SUM(replacement_cost)
FROM film;

-- How much would it cost to replace all films in each ratings category?
SELECT SUM(replacement_cost)
FROM film
GROUP BY rating;

-- How long is the longest movie in the database? How short is the shortest movie?
SELECT MAX(length)
FROM film;

SELECT MIN(length)
FROM film; 

-- Determine the count of actor first names with the names ordered in descending order.
SELECT first_name, COUNT("first_name") AS "actor count"
FROM actor
GROUP BY first_name
ORDER BY "actor count" DESC;

-- Determine the average rental duration for each rating rounded to two decimals. Order these in ascending order.
SELECT rating, ROUND(AVG(rental_duration),2) AS "average rental duration"
FROM film
GROUP BY rating
ORDER BY "average rental duration";

-- Determine the top 10 average replacement costs for movies, ordered by their length.
SELECT length, ROUND(AVG(replacement_cost), 2) AS "average replacement cost"
FROM film
GROUP BY length
ORDER BY length DESC
LIMIT 10;

-- Using the city and country tables, determine the count of countries in descending order.
SELECT country.country, COUNT(country.country) AS "country count"
FROM city
JOIN country ON city.country_id = country.country_id
GROUP BY country
ORDER BY "country count" DESC;

-- List the names and ID numbers of cities that are in the following list: Qalyub, Qinhuangdao, Qomsheh, Quilmes.
SELECT city, city_id
FROM city
WHERE city IN ('Qalyub', 'Qinhiangdao', 'Qomsheh', 'Quilmes');

-- Display the districts in the above list of cities
SELECT district
FROM address
WHERE city_id IN (
	SELECT city_id
	FROM city
	WHERE city IN ('Qalyub', 'Qinhiangdao', 'Qomsheh', 'Quilmes')
);

-- find the first and last names of customers who reside in cities that begin with the letter Q.
SELECT first_name, last_name
FROM customer AS cus
WHERE address_id IN
(
	SELECT address_id
	FROM address AS a
	WHERE city_id IN
	(
		SELECT city_id
		FROM city
		WHERE city LIKE 'Q%'
	)
);

-- alternate method showing address_id & city_id
SELECT cus.first_name, cus.last_name, a.address_id, c.city_id
FROM customer cus
JOIN address AS a ON cus.address_id = a.address_id
JOIN city c ON a.city_id = c.city_id
WHERE a.address_id IN
(
	SELECT address_id
	FROM address
	WHERE city_id IN
	(
		SELECT city_id
		FROM city
		WHERE city LIKE 'Q%'
	)
);

-- alternate method showing city
SELECT cus.first_name, cus.last_name, c.city
FROM customer cus
JOIN address a ON cus.address_id = a.address_id
JOIN city c ON a.city_id = c.city_id
WHERE a.address_id IN
(
	SELECT address_id
	FROM address
	WHERE city_id IN
	(
		SELECT city_id
		FROM city
		WHERE city LIKE 'Q%'
	)
);

-- Write a query to get the number of copies of a film title that exist in the inventory
SELECT * FROM inventory;

-- Create a view named title_count from the above query.


-- Query the newly created view to find all the titles that have 7 copies.






