-----ex1
select distinct city from STATION where mod(id,2) = 0;
-----ex2
select (count(city) - count(distinct city)) from STATION;
-----ex3
select ceiling((sum(salary) - sum(replace(salary,0,'')))/count(*)) from EMPLOYEES;
-----ex4
SELECT ROUND(sum(item_count*order_occurrences)/sum(order_occurrences), 1) FROM items_per_order;
-----ex5
SELECT candidate_id FROM candidates where skill in ('Python', 'Tableau', 'PostgreSQL')
group by candidate_id having count(DISTINCT skill) = 3;
-----ex6
SELECT user_id, COUNT(*) AS post_count
FROM posts
WHERE post_date BETWEEN (SELECT MIN(post_date) FROM posts) AND (SELECT MAX(post_date) FROM posts)
GROUP BY user_id;
-----ex7
SELECT card_name,MAX(issued_amount)-Min(issued_amount) FROM monthly_cards_issued group by card_name;
-----ex8
SELECT manufacturer,count(*),ABS(sum(total_sales-cogs))
FROM pharmacy_sales WHERE total_sales-cogs<0 group by manufacturer;
-----ex9
select id,description,rating where description not like 'boring' and mod(id,2) != 0
order by rating desc;
-----ex10
select teacher_id,count(distinct subject_id) from Teacher group by teacher_id;
-----ex11
select user_id, count(followers_count) from Followers group by user_id order by user_id ;
-----ex12
select class,count(student) from Courses having count(student)>=5;
