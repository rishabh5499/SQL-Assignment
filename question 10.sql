USE sakila;


-- 1. Identify the top 5 customers based on the total amount they’ve spent. Include customer
-- name, email, and total amount spent.

SELECT 
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    c.email,
    SUM(p.amount) AS total_spent
FROM customer c
JOIN payment p 
    ON c.customer_id = p.customer_id
GROUP BY c.customer_id, customer_name, c.email
ORDER BY total_spent DESC
LIMIT 5;


-- 2. Which 3 movie categories have the highest rental counts? Display the category name
-- and number of times movies from that category were rented.
SELECT 
    f.title,
    COUNT(r.rental_id) AS rental_count
FROM film f
JOIN rental r
    ON f.film_id = r.inventory_id
GROUP BY f.title
ORDER BY rental_count DESC
LIMIT 5;


-- 3. Calculate how many films are available at each store and how many of those have
-- never been rented.
SELECT 
    COUNT(*) AS films_never_rented
FROM film f
LEFT JOIN rental r
    ON f.film_id = r.inventory_id
WHERE r.rental_id IS NULL;


-- 4. Show the total revenue per month for the year 2023 to analyze business seasonality.
SELECT 
    DATE_FORMAT(payment_date, '%Y-%m') AS month,
    SUM(amount) AS total_revenue
FROM payment
GROUP BY month
ORDER BY month;


-- 5. Identify customers who have rented more than 10 times in the last 6 months.
SELECT  
    CONCAT(c.first_name,' ',c.last_name) AS customer_name,
    COUNT(r.rental_id) AS rental_count
FROM customer c
JOIN rental r
    ON c.customer_id = r.customer_id
WHERE r.rental_date >= DATE_SUB(CURDATE(), INTERVAL 6 MONTH)
GROUP BY c.customer_id, c.first_name, c.last_name
HAVING rental_count > 10;