-----ex1
WITH b as(SELECT DISTINCT title,description FROM job_listings)
SELECT a.title,count(*) 
FROM job_listings a 
join b 
on  a.title = b.title 
and a.description = b.description
group by a.title;
-----ex2
with appliance as(
SELECT category,product,user_id,sum(spend) spend 
FROM product_spend 
where EXTRACT(year from transaction_date) = 2022
and category = 'appliance'
group by category,user_id,product
ORDER BY spend desc
LIMIT 2),
with electronics as(
SELECT category,product,user_id,sum(spend) spend 
FROM product_spend 
where EXTRACT(year from transaction_date) = 2022
and category = 'electronics'
group by category,user_id,product
ORDER BY spend desc
LIMIT 2)
SELECT category,product,spend 
FROM appliance 
full join electronics 
on appliance.user_id=electronics.user_id;
-----ex3
SELECT COUNT(1) FROM 
    (select policy_holder_id, count(1) 
    from callers 
    group by policy_holder_id)
where count >=3;
-----ex4
SELECT page_id
FROM (
    SELECT p.page_id, COUNT(l.page_id)
    FROM pages p 
    LEFT JOIN page_likes l
    ON p.page_id = l.page_id
    GROUP BY p.page_id)
WHERE count = 0;
------ex5
with a as(SELECT DISTINCT user_id
FROM user_actions 
where EXTRACT(month from event_date) = 6
and EXTRACT(year from event_date) = 2022),
b as (SELECT DISTINCT user_id 
FROM user_actions  
where EXTRACT(month from event_date) = 7
and EXTRACT(year from event_date) = 2022)
select count(1) 
from a 
join b 
on a.user_id	= b.user_id	;
------ex6
WITH a AS
(SELECT * ,
DATE_FORMAT(trans_date,"%Y-%m") AS month
FROM Transactions)
SELECT a.month, a.country,
COUNT(*) AS trans_count,
SUM(CASE WHEN a.state = "approved" THEN 1 ELSE 0 END) AS approved_count,
SUM(a.amount) AS trans_total_amount,
SUM(CASE WHEN a.state = "approved" THEN amount ELSE 0 END ) as approved_total_amount
FROM a
GROUP BY a.month, a.country;
-----ex7
SELECT product_id, year as first_year, quantity,price
FROM Sales
WHERE (product_id,year) in (
SELECT product_id,MIN(year)
FROM Sales
GROUP BY product_id);
-----ex8
select customer_id from customer 
group by 
customer_id
having count(distinct product_key ) = (select count(product_key ) from product)
-----ex9
SELECT employee_id
FROM Employees as a
WHERE manager_id not in (SELECT employee_id FROM employees) and salary < 30000
ORDER BY employee_id ASC
-----ex10
WITH b as(SELECT DISTINCT title,description FROM job_listings)
SELECT a.title,count(*) 
FROM job_listings a 
join b 
on  a.title = b.title 
and a.description = b.description
group by a.title;
----ex11
(SELECT name results
FROM users u
JOIN movie_rating mr
ON u.user_id = mr.user_id
GROUP BY 1
ORDER BY count(rating) desc, 1 asc
Limit 1)
UNION
(SELECT title results
FROM movies m
JOIN movie_rating mr
ON m.movie_id = mr.movie_id
WHERE month(created_at) = 2
GROUP BY 1
ORDER BY avg(rating) desc, 1 asc
Limit 1);
-----ex12
with a as
(select requester_id as id from request_accepted
union all
select accepter_id as id from request_accepted)
select id, count(id) as num
from a
group by id
order by num desc
limit 1;
