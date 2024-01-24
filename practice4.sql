-----ex1
SELECT sum(CASE WHEN device_type = 'laptop' then 1 ELSE 0 end) laptop, sum(CASE WHEN device_type = 'phone' then 1 ELSE 0 end) phone FROM viewership;
-----ex2
select x,y,z case when (x + y > z) and (x + z > y) and (y + z > x) then 'Yes' else 'No' end Triangle from Triangle;
-----ex3
SELECT round((sum(CASE when call_category='n/a' or call_category is null then 1 ELSE 0 end)/sum(1))*100,1) FROM callers;
-----ex4
select name from customer where coalesce(referee_id,'') <> 2;
-----ex5
select survived, sum(case when pclass = 1 then 1 else 0 end) first_class
sum(case when pclass = 2 then 1 else 0 end) second_class, sum(case when pclass = 3 then 1 else 0 end) third_class
 from titanic groud by survived;
