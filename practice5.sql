------ex1
select b.Continent,FLOOR(avg(a.Population)) from CITY a join COUNTRY b on a.CountryCode = b.Code group by b.Continent;
------ex2
select round(sum(case when t.signup_action = 'Confrimed' then 1 else 0 end)/count(distinct e.user_id),2) 
from emails e
left join texts t on e.email_id = t.email_id; 
------ex3
select 
  a.age_bucket,
  round((a.time_spent/(a.time_spent+a.time_open))*100.0,2) send_perc,
  round((a.time_open/(a.time_open+a.time_spent))*100.0,2) open_perc
FROM
(
  SELECT 
    b.age_bucket,
    sum(CASE WHEN a.activity_type = 'send' THEN a.time_spent END) time_spent,
    sum(CASE WHEN a.activity_type = 'open' THEN a.time_spent END) time_open
  FROM activities a 
  join age_breakdown b 
  on a.user_id=b.user_id
  GROUP BY b.age_bucket
  ) a;
------ex4
SELECT customer_id 
FROM customer_contracts a 
join products b 
on a.product_id = b.product_id
group by customer_id
having count(DISTINCT product_category) >=
(select count(DISTINCT product_category) from products );
------ex5
select a.employee_id, b.name,sum(case when a.employee_id = b.reports_to then 1 else 0 end) reports_count , avg(case when a.employee_id = b.reports_to then age else 0 end) average_age
from Employees a 
join Employees b on a.employee_id = b.employee_id
group by a.employee_id, b.name;
------ex6
select product_id 
from Products a 
join Orders b 
on a.product_id = b.product_id
where month(b.order_date)=2 and year(b.order_date)=2020
havingsum(b.unit)>100;
-----ex7
SELECT a.page_id FROM pages a left join page_likes b on a.page_id = b.page_id	WHERE b.liked_date is null order by a.page_id ;
----------------------------------------Mid course test
--------Question 1
select min(replacement_cost) from film;
--------Question 2
select sum(case when replacement_cost>=9.99 and replacement_cost<=19.99 then 1 else 0 end) from film;
--------Question 3
select a.title, a.length,c.name 
from film a 
join film_category b 
on a.film_id = b.film_id
join category c
on b.category_id = c.category_id 
and (c.name like 'Drama' or c.name like 'Sports')
order by a.length desc
limit 1;
--------Question 4
select c.name,count(distinct a.title) 
from film a 
join film_category b 
on a.film_id = b.film_id
join category c
on b.category_id = c.category_id 
group by c.name
order by count(distinct a.title)  desc
limit 1;
--------Question 5
select c.first_name ||' '|| c.last_name, count(distinct film_id)
from film_actor b 
join actor c
on b.actor_id = c.actor_id
group by c.first_name ||' '|| c.last_name
order by count(distinct film_id) desc
limit 1;
--------Question 6
select 
	count(*)
from customer a 
right join address b 
on a.address_id = b.address_id
where a.customer_id is null;
--------Question 7
select 
	a.city,sum(d.amount)
from city a
join address b
on a.city_id = b.city_id
join customer c
on b.address_id = c.address_id
join payment d
on c.customer_id = d.customer_id
group by city
order by sum(d.amount) desc
limit 1;
--------Question 8
select 
	a.city||','||e.country,sum(d.amount)
from city a
join address b
on a.city_id = b.city_id
join customer c
on b.address_id = c.address_id
join payment d
on c.customer_id = d.customer_id
join country e
on a.country_id = e.country_id
group by a.city||','||e.country
order by sum(d.amount) desc
limit 1;
