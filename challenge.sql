-- Task 1 --
select c.first_name, sum(oi.quantity * oi.unit_price) as total_spend
from customers c
join orders o on o.customer_id = c.id
join order_items oi on oi.order_id = o.id
group by c.id
order by total_spend DESC
limit 5;

-- Task 2--
select p.category, sum(oi.quantity * oi.unit_price) AS revenue
from order_items oi
join products p indexed by idx_products_category on p.id = oi.product_id
join orders o indexed by idx_orders_customer on o.id - oi.order_id
group by p.category
order by revenue desc;

-- Task 3 --
select e.first_name, e.last_name, d.name as department_name, e.salary, dept.avg_salary as department_average
from employees e indexed by idx_employees_department
join departments d on d.id = e.department_id
join (
	select department_id, avg(salary) as avg_salary
	from employees
	group by department_id
) as dept
	on dept.department_id = e.department_id
where e.salary &gt; dept.avg_salary
order by d.name, e.salary desc;

-- Task 4 --
select city, count(*) as gold_count
from customers
where loyalty_level = 'Gold'
group by city
order by gold_count desc, city asc;</sql><current_tab id="0"/></tab_sql></sqlb_project>
