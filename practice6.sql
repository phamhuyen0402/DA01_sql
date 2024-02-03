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
