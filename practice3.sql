-----ex1
select name from STUDENTS where marks > 75 order by right(name,3),id;
-----ex2
select user_id,concat(upper(left(name,1))||lower(right(name,lenght(name)-1))) as name from Users;
-----ex3
SELECT manufacturer,'$ '||round(SUM(total_sales)/1000000,0)||' million' FROM pharmacy_sales group by manufacturer order by SUM(total_sales) desc,manufacturer;
-----ex4
SELECT EXTRACT(month from submit_date) mth,product_id,round(AVG(stars),2) FROM reviews group by EXTRACT(month from submit_date),product_id order by EXTRACT(month from submit_date),product_id 
-----ex5
SELECT sender_id,count(message_id) message_count FROM messages where EXTRACT(month from sent_date)=8 and EXTRACT(year from sent_date)=2022 GROUP BY sender_id order by message_count desc limit 2;
-----ex6
select tweet_id from Tweets where leght(content)>15;
-----ex7
SELECT activity_date day, COUNT(DISTINCT user_id) active_users  FROM Activity WHERE activity_date BETWEEN (activity_date - INTERVAL '30' DAY) AND activity_date GROUP BY activity_date;
-----ex8
select count(id) from employees where extract(month joining_date) between 1 and 7 and extract(year joining_date)=2022;
-----ex9
select position('a' in first_name) from worker where first_name='Amitah';
-----ex10
select subtring(title,length(winery)+2,4) from winemag_p2 where country='Macedonia';
