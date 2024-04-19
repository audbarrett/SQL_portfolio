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

