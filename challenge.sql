<?xml version="1.0" encoding="UTF-8"?><sqlb_project><db path="/Users/owenjohnson/Downloads/sqlite_coding_challenge/bais_sqlite_lab.db" readonly="0" foreign_keys="1" case_sensitive_like="0" temp_store="0" wal_autocheckpoint="1000" synchronous="2"/><attached/><window><main_tabs open="structure browser pragmas query" current="3"/></window><tab_structure><column_width id="0" width="300"/><column_width id="1" width="0"/><column_width id="2" width="100"/><column_width id="3" width="1702"/><column_width id="4" width="0"/><expanded_item id="0" parent="1"/><expanded_item id="0" parent="0"/><expanded_item id="1" parent="0"/><expanded_item id="2" parent="0"/><expanded_item id="3" parent="0"/><expanded_item id="4" parent="0"/><expanded_item id="5" parent="0"/><expanded_item id="1" parent="1"/><expanded_item id="0" parent="1"/><expanded_item id="1" parent="1"/><expanded_item id="2" parent="1"/><expanded_item id="3" parent="1"/><expanded_item id="4" parent="1"/><expanded_item id="5" parent="1"/><expanded_item id="2" parent="1"/><expanded_item id="3" parent="1"/></tab_structure><tab_browse><current_table name="4,9:maincustomers"/><default_encoding codec=""/><browse_table_settings><table schema="main" name="customers" show_row_id="0" encoding="" plot_x_axis="" unlock_view_pk="_rowid_"><sort/><column_widths><column index="1" value="23"/><column index="2" value="64"/><column index="3" value="62"/><column index="4" value="152"/><column index="5" value="72"/><column index="6" value="81"/></column_widths><filter_values/><conditional_formats/><row_id_formats/><display_formats/><hidden_columns/><plot_y_axes/><global_filter/></table></browse_table_settings></tab_browse><tab_sql><sql name="SQL 1">-- Task 1 --
select c.first_name, sum(oi.quantity * oi.unit_price) as total_spend
from customers c
join orders o on o.customer_id = c.id
join order_items oi on oi.order_id = o.id
group by c.id
order by total_spend DESC
limit 5;

--Task 2--
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
