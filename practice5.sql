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
