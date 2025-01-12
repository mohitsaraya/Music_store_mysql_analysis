-- Creatating a database for project
create database Music_Store_Analysis;
use Music_Store_Analysis;

-- Question Set 1 - Easy
-- 1. Who is the senior most employee based on job title?
SELECT 
    CONCAT(first_name, ' ', last_name) AS Name, title, levels
FROM
    employee
ORDER BY levels DESC
LIMIT 1;

-- 2. Which countries have the most Invoices?
SELECT 
    billing_country AS country, COUNT(billing_country) AS Total
FROM
    invoice
GROUP BY 1
LIMIT 5;
	
-- 3. What are top 3 values of total invoice?
SELECT 
    total
FROM
    invoice
ORDER BY total DESC
LIMIT 3;

-- 4. Which city has the best customers? We would like to throw a promotional 
-- Music Festival in the city we made the most money. Write a query that
-- returns one city that has the highest sum of invoice totals. 
-- Return both the city name & sum of all invoice totals
SELECT 
    billing_city, SUM(total) AS Total_invoice
FROM
    invoice
GROUP BY 1
ORDER BY 2 DESC
LIMIT 3; 

-- 5. Who is the best customer? The customer who has spent the most money 
-- will be declared the best customer. 
-- Write a query that returns the person who has spent the most money.
SELECT 
    CONCAT(first_name, ' ', last_name) AS Name,
    ROUND(SUM(i.total)) AS Total_spending
FROM
    customer AS c
        JOIN
    invoice AS i ON c.customer_id = i.customer_id
GROUP BY 1
ORDER BY 2 DESC
LIMIT 3; 


-- ---------------------------------- Question Set 2 – Moderate
-- 1. Write query to return the email, first name, last name, & Genre of all 
-- Rock Music listeners. 
-- Return your list ordered alphabetically by email starting with A

SELECT 
    c.first_name, c.last_name, c.email, g.name
FROM
    customer AS c
        JOIN
    invoice AS i ON c.customer_id = i.customer_id
        JOIN
    invoice_line AS il ON il.invoice_id = i.invoice_id
        JOIN
    track AS t ON t.track_id = il.track_id
        JOIN
    genre AS g ON g.genre_id = t.genre_id
WHERE
    g.name = 'Rock'
GROUP BY 1 , 2 , 3
ORDER BY email;

-- 2. Let's invite the artists who have written the most rock music in our dataset. Write a
-- query that returns the Artist name and total track count of the top 10 rock bands

SELECT 
    a.name, COUNT(a.artist_id) AS No_of_songs
FROM
    artist AS a
        JOIN
    album AS ab ON a.artist_id = ab.artist_id
        JOIN
    track AS t ON t.album_id = ab.album_id
        JOIN
    genre ON genre.genre_id = t.genre_id
WHERE
    genre.name = 'Rock'
GROUP BY 1
ORDER BY 2 DESC
LIMIT 10;

-- 3. Return all the track names that have a song length longer than the average song length.
-- Return the Name and Milliseconds for each track. Order by the song length with the longest songs listed first.

SELECT 
    name, milliseconds as Track_length
FROM
    track AS t
WHERE
    milliseconds > (SELECT 
            AVG(milliseconds)
        FROM
            track)
GROUP BY 1 , 2
ORDER BY 2 DESC;


-- -----------------------------------------------Question Set 3 – Advance
    
-- 1. We want to find out the most popular music Genre for each country. We determine the
-- most popular genre as the genre with the highest amount of purchases. 
-- Write a query that returns each country along with the top Genre. For countries where the maximum
-- number of purchases is shared return all Genres


select popular_genre.purchases, popular_genre.country from 
(
    SELECT COUNT(invoice_line.quantity) AS purchases, customer.country as Country, genre.name, genre.genre_id, 
	ROW_NUMBER() OVER(PARTITION BY customer.country ORDER BY COUNT(invoice_line.quantity) DESC) AS RowNo 
    FROM invoice_line 
	JOIN invoice ON invoice.invoice_id = invoice_line.invoice_id
	JOIN customer ON customer.customer_id = invoice.customer_id
	JOIN track ON track.track_id = invoice_line.track_id
	JOIN genre ON genre.genre_id = track.genre_id
	GROUP BY 2,3,4
	ORDER BY 2 ASC, 1 DESC ) as popular_genre where RowNo =1;

-- 2. Write a query that determines the customer that has spent the most on music for each country. 
-- Write a query that returns the country along with the top customer and how
-- much they spent. For countries where the top amount spent is shared, provide all customers who spent this amount.

select * from (
select c.customer_id as customer,c.first_name as f_name,c.last_name as l_name, i.billing_country as bill,
sum(i.total) as total_spending,
row_number() over(partition by i.billing_country order by sum(total) desc) as rno
from customer as c
join invoice as i on i.customer_id = c.customer_id group by 1,2,3,4 order by 4 asc,5 desc ) as cus_country where rno<=1;