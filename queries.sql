--paso 5
/*
SELECT COUNT(*) AS customers_count
FROM customers;
-- esta consulta realuza el conteo de customers
 */
-- paso 6
-- top_10_total_income
/* 
select
	CONCAT(e.first_name, ' ', e.last_name) as seller,
	COUNT(s.sales_id) as operations,
	FLOOR(SUM(s.quantity * p.price)) as income
from sales s 
inner join employees e 
on s.sales_person_id = e.employee_id 
inner join products p  
on s.sales_person_id = p.product_id
group by 
	e.employee_id, 
	e.first_name,
	e.last_name
order by income desc 
limit 10;
*/

--lowest_average_income
/*
select
	CONCAT(e.first_name, ' ', e.last_name) as seller,
	ROUND(AVG(s.quantity * p.price), 2) as average_income
from sales s 
inner join employees e 
on s.sales_person_id = e.employee_id 
inner join products p  
on s.sales_person_id = p.product_id
group by seller
having (AVG(s.quantity * p.price)) <
(
select AVG(s2.quantity * p2.price)
from sales s2
inner join products p2
on s2.sales_person_id = p2.product_id
)
order by average_income asc; 
*/

--day_of_the_week_income
/*
select
	CONCAT(e.first_name, ' ', e.last_name) as seller,
	TO_CHAR(s.sale_date, 'FMDay') as day_of_week,
	FLOOR(SUM(s.quantity * p.price)) as income
from sales s 
inner join employees e 
on s.sales_person_id = e.employee_id 
inner join products p  
on s.product_id = p.product_id
group by seller, 
TO_CHAR(s.sale_date, 'FMDay'), 
EXTRACT(ISODOW from s.sale_date)
order by EXTRACT(ISODOW from s.sale_date), seller;
*/

--paso 7

--age_groups.csv 
/*
select 
	age_category, 
	count(*) as age_count
from 
(
	select 
		case 
			when age between 16 and 25 then '16-25'
			when age between 26 and 40 then '26-40'
			when age > 40 then '40+'
		end as age_category 
	from customers
	where age >= 16
) 
as groups 
group by age_category 
order by 
	case age_category
		when '16-25' then 1
		when '26-40' then 2
		when '40+' then 3
	end;
*/

-- customers_by_month
/*
select 
	TO_CHAR(s.sale_date, 'YYYY-MM') as selling_month,
	COUNT (distinct s.customer_id) as total_customers,
	SUM(s.quantity * p.price) as income
from sales s 
join products p  
on s.product_id = p.product_id
group by selling_month
order by selling_month;
*/

--special_offer
/*
select distinct on (c.customer_id)
	CONCAT(c.first_name, ' ', c.last_name) as customer,
	s.sale_date,
	CONCAT(e.first_name, ' ', e.last_name) as seller
from sales s 
join employees e 
on s.sales_person_id = e.employee_id 
join products p  
on s.product_id = p.product_id
join customers c  
on s.customer_id = c.customer_id
where p.price = 0 and 
(
	s.sale_date = 
	(
		select 
			MIN(s2.sale_date)
		from sales s2
		where s.customer_id = s2.customer_id 
	)
)
order by c.customer_id, s.sales_id;
*/















	
