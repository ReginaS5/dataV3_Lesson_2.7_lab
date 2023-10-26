USE sakila;

-- Lab | SQL Join (Part I)
-- In this lab, you will be using the Sakila database of movie rentals.

-- 1 How many films are there for each of the categories in the category table. Use appropriate join to write this query.
SELECT *
FROM film_category;

SELECT category.name AS category_name, COUNT(film_category.film_id) AS film_count
FROM category
JOIN film_category ON category.category_id = film_category.category_id
GROUP BY category.name;

-- 2 Display the total amount rung up by each staff member in August of 2005.
SELECT CONCAT(staff.first_name, ' ', staff.last_name) AS staff_name,
SUM(payment.amount) AS total_amount
FROM staff
JOIN payment ON staff.staff_id = payment.staff_id
WHERE DATE_FORMAT(payment.payment_date, '%Y-%m') = '2005-08'
GROUP BY staff.staff_id;

-- 3 Which actor has appeared in the most films?
SELECT actor.actor_id, CONCAT(actor.first_name, '', actor.last_name) AS actor_name, 
COUNT(film_actor.film_id) AS film_count
FROM actor
JOIN film_actor ON actor.actor_id = film_actor.actor_id
GROUP BY actor.actor_id
ORDER BY film_count DESC
LIMIT 1;

-- 4 ELECT 
    customer.customer_id,
    CONCAT(customer.first_name, ' ', customer.last_name) AS customer_name,
    COUNT(rental.rental_id) AS rental_count
FROM 
    customer
JOIN 
    rental ON customer.customer_id = rental.customer_id
GROUP BY 
    customer.customer_id
ORDER BY 
    rental_count DESC
LIMIT 1;

-- 4 Most active customer (the customer that has rented the most number of films)USE sakila;
SELECT customer.customer_id, CONCAT(customer.first_name, ' ', customer.last_name) AS customer_name,
COUNT(rental.rental_id) AS rental_count
FROM customer
JOIN rental ON customer.customer_id = rental.customer_id
GROUP BY customer.customer_id
ORDER BY rental_count DESC
LIMIT 1;

-- 5 Display the first and last names, as well as the address, of each staff member. 
--  (STILL NEED TO MAKE SURE THAT THE WAY ADDRESS IS LISTED IS CORRECT)
SELECT staff.staff_id, CONCAT(staff.first_name,'', staff.last_name) as staff_name
FROM staff
JOIN address LIMIT 2;

-- 6 List each film and the number of actors who are listed for that film.
SELECT film.title AS film_title, COUNT(film_actor.actor_id) AS actor_count
FROM film
JOIN film_actor ON film.film_id = film_actor.film_id
GROUP BY film.film_id;

-- 7 Using the tables payment and customer and the JOIN command, list the total paid by each customer. 
-- List the customers alphabetically by last name.
SELECT CONCAT(customer.last_name, ', ', customer.first_name) AS customer_name, SUM(payment.amount) AS total_paid
FROM customer
JOIN payment ON customer.customer_id = payment.customer_id
GROUP BY customer.customer_id
ORDER BY customer.last_name, customer.first_name;

-- 8 List the titles of films per category.
SELECT category.name AS category_name, film.title AS film_title
FROM category
JOIN film_category ON category.category_id = film_category.category_id
JOIN film ON film_category.film_id = film.film_id
ORDER BY category.name, film.title;


-- (DONT FORGET THE 5)

















