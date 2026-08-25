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

