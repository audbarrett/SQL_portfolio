-- find number of invoices for each customer
SELECT first_name, last_name, 
(SELECT COUNT(invoice.customer_id)
	FROM invoice
	WHERE customer.customer_id = invoice.customer_id) AS "Number of Invoices"
FROM customer;

-- alternate way, create with joins
SELECT c.last_name, COUNT(i.customer_id) AS "Number of Invoices"
FROM customer c
LEFT JOIN invoice i ON c.customer_id = i.customer_id
GROUP BY c.last_name
ORDER BY "Number of Invoices" DESC;

-- select all of the rows of the table called employees
SELECT * FROM employee;

-- select the first 5 rows of the employees table
SELECT * FROM employee
LIMIT 5;

-- select one or more specific columns from the employees table
SELECT title, employee_id FROM employee;

-- select only unique values from a column
SELECT DISTINCT title FROM employee;

-- select only employees from the employees table with the first name "Steve"
SELECT * FROM employee
WHERE first_name = 'Steve';

-- select only employees with the first name "Steve" and the last name "Laura"
SELECT * FROM employee
WHERE first_name = 'Steve'
AND last_name = 'Laura';

-- list the first 10 tracks from the tracks table.
SELECT * FROM track
LIMIT 10;

-- figure out how many rows or records there are in the tracks table.
SELECT COUNT(*) FROM track;

-- figure out what albums the artist with ArtistId 41 made.
SELECT title FROM album
WHERE artist_id = 41;

-- list the tracks of the album with AlbumId 71. Order the results from most Milliseconds to least.
SELECT * FROM track
WHERE album_id = 71
ORDER BY milliseconds DESC;

-- display the tracks for the album with AlbumId 71. 
-- Order the results from longest to shortest, and convert Milliseconds to seconds. 
-- Use aliasing to name the calculated field Seconds.
SELECT milliseconds / 1000.0 AS Seconds, name 
FROM track
WHERE album_id = 71
ORDER BY Seconds DESC;

-- find the GenreId of the genre with the name Pop.
SELECT genre_id FROM genre
WHERE name = 'Pop';

-- show customers (just full names, customer ID and country) who are not in the US. 
SELECT customer_id, last_name, first_name, country FROM customer
WHERE country != 'USA';

-- only show customers from Brazil
SELECT customer_id, last_name, first_name, country FROM customer
WHERE country = 'Brazil';

-- show the invoices of customers who are from Brazil
-- show the customer's full name, Invoice ID, Date of the invoice and billing country.  
SELECT c.first_name, c.last_name, i.invoice_id, i.invoice_date, i.billing_country
FROM invoice i
LEFT JOIN customer c ON i.customer_id = c.customer_id
WHERE country = 'Brazil';

-- show only employees who are Sales Agents. 
SELECT employee_id, last_name, first_name, title FROM employee
WHERE title = 'Sales Support Agent';

-- show a unique/distinct list of billing countries from the Invoice table
SELECT DISTINCT billing_country FROM invoice
ORDER BY billing_country;

-- show the invoices associated with each sales agent
-- include the Sales Agent's full name
SELECT i.invoice_id, e.last_name, e.first_name
FROM invoice i
LEFT JOIN customer c on i.customer_id = c.customer_id
LEFT JOIN employee e on c.support_rep_id = e.employee_id
WHERE title = 'Sales Support Agent'
ORDER BY last_name;

-- show the Invoice Total, Customer name, Country and Sale Agent name for all invoices and customers.
-- invoice table: total, customer_id, invoice_id, billing_country
-- customer table: customer_id, first_name, last_name, support_rep_id
-- employee table: employee_id, last_name, first_name, where title = sales support
SELECT i.total, c.last_name, c.first_name, i.billing_country, e.last_name, e.first_name
FROM invoice i
LEFT JOIN customer c ON i.customer_id = c.customer_id
LEFT JOIN employee e ON c.support_rep_id = e.employee_id
WHERE title = 'Sales Support Agent'

-- count the number of line items for Invoice ID 37
SELECT COUNT(*) 
FROM invoice_line
WHERE invoice_id = 37;

-- show the purchased track name with each invoice line item
-- invoice_line: invoice_line_id, track_id
-- track: track_id, name
SELECT i.invoice_line_id, t.name
FROM invoice_line as i
LEFT JOIN track as t ON i.track_id = t.track_id;

-- show the purchased track name AND artist name with each invoice line item
-- invoice_line: invoice_line_id, track_id
-- track: track_id, album_id
-- album: album_id, artist_id
-- artist: artist_id, name
SELECT i.invoice_line_id, t.name, ar.name
FROM invoice_line as i
LEFT JOIN track as t ON i.track_id = t.track_id
LEFT JOIN album as a ON t.album_id = a.album_id
LEFT JOIN artist as ar ON a.artist_id = ar.artist_id;

-- show the # of invoices per country
SELECT billing_country, COUNT(*) FROM invoice
GROUP BY billing_country
ORDER BY billing_country;

-- show the total number of tracks in each playlist & include Playlist name
-- playlist: playlist_id, name
-- playlist_track: playlist_id, track_id
SELECT COUNT(pt.track_id) AS track_count, p.name AS playlist_name
FROM playlist_track pt
LEFT JOIN playlist p ON pt.playlist_id = p.playlist_id
GROUP BY p.name
ORDER BY track_count DESC;

-- show all the Tracks, but display no IDs
-- include the Album name, Media type and Genre
SELECT t.name AS track_name, a.title AS album_title, mt.name AS media_type, g.name as genre
FROM track t, album a, media_type mt, genre g
WHERE a.album_id = t.track_id
AND mt.media_type_id = t.media_type_id
AND g.genre_id = t.genre_id;

-- show all Invoices but include the # of invoice line items


-- show total sales made by each sales agent


-- Which sales agent made the most in sales in 2009? 


-- Which sales agent made the most in sales over all?


-- show the count of customers assigned to each sales agent


-- show the total sales per country.


-- Which country's customers spent the most?


-- show the most purchased track of 2013.


-- show the top 5 most purchased tracks over all


-- show the top 3 best selling artists


-- show the most purchased Media Type

