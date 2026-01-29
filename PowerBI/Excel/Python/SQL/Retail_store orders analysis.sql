SELECT * FROM retail_store.orders;

select count(*) from orders;

select a.customer_id,customer_name,email,city,
COUNT(b.order_id) as total_orders from class a
left join orders b
on a.customer_id= b.customer_id
group by a.customer_id,a.customer_name;

select a.customer_id,customer_name,email,city
from class a
left join orders b
on a.customer_id= b.customer_id
where b.order_id IS NULL;

select a.customer_id,customer_name,email,city,
count(b.order_id) as order_count,
case
when count(b.order_id) >=3 then 'high activity'
when count(b.order_id) between 1 and 2 then 'medium activity'
else 'no activity'
end as category
from class a
left join orders b
on a.customer_id= b.customer_id
group by a.customer_id,customer_name,email,city;

select a.customer_id,customer_name,email,city
from class a
inner join orders b
on a.customer_id= b.customer_id;

select a.customer_id,customer_name,email,city,
b.order_id,order_date,quantity
from class a
left join orders b
on a.customer_id= b.customer_id;

select a.customer_id,customer_name,email,city,
sum(b.quantity) as total_quantity
from class a
join orders b
on a.customer_id= b.customer_id
group by a.customer_id,customer_name,email,city
having sum(b.quantity) > 2;

select a.customer_id,customer_name,email,city,
count(b.order_id) as total_orders
from class a 
join orders b
on a.customer_id= b.customer_id
group by a.customer_id,customer_name,email,city
having count(b.order_id)= (
select MAX(order_count) from(
select count(order_id) as order_count
from orders
group by customer_id) as counts);

select a.customer_id,customer_name,email,city,
count(b.order_id) as order_count,
case 
when count(b.order_id) >= 3 then 'frequent buyer'
when count(b.order_id) between 1 and 2 then 'occasional buyer'
else 'no orders'
end as category
from class a 
left join orders b
on a.customer_id= b.customer_id
group by a.customer_id,customer_name,email,city;

select customer_name,email,city,
b.order_id,order_date,quantity
from class a
join orders b
on a.customer_id= b.customer_id
order by a.city,customer_name,email;

select a.customer_id,customer_name,email,city,
count(b.order_id) as total_orders
from class a 
join orders b
on a.customer_id= b.customer_id
group by a.customer_id,customer_name,email,city
having count(b.order_id) >1;

select a.customer_id,customer_name,email,city,
sum(b.quantity) as total_quantity
from class a 
join orders b
on a.customer_id= b.customer_id
group by a.customer_id,customer_name,email,city
order by total_quantity DESC;

SELECT customer_name,email,city,
count(b.order_id) as order_count,
case
when count(b.order_id) > 0 then 'active'
else 'inactive'
end as category
from class a 
left join orders b
on a.customer_id= b.customer_id
group by a.customer_id,customer_name,email,city;