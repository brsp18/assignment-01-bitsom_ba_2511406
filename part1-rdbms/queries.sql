-- Q1: List all customers from Mumbai along with their total order value
Select c.customer_name,SUM(ol.quantity * p.unit_price) AS total_value from customers c
join orders o
on c.customer_id = o.customer_id
join order_list ol
on o.order_id = ol.order_id
join products p
on p.product_id = ol.product_id
where c.customer_city = "Mumbai" 
group by c.customer_name;



-- Q2: Find the top 3 products by total quantity sold
select top 3 p.product_name, sum(ol.quantity) as total_quantity from products p
join order_list ol
on p.product_id = ol.product_id
group by p.product_name
order by total_quantity DESC;



-- Q3: List all sales representatives and the number of unique customers they have handled
select COUNT(DISTINCT c.customer_id) as customer_count, o.sales_rep_id  
from orders o
join customers c
on c.customer_id = o.customer_id
join salesreps sr
on o.sales_rep_id = sr.sales_rep_id
group by o.sales_rep_id;



-- Q4: Find all orders where the total value exceeds 10,000, sorted by value descending
Select o.order_id, SUM(ol.quantity * p.unit_price) as total_value
from orders o
join order_list ol
    on o.order_id = ol.order_id
join products p
    on ol.product_id = p.product_id
group by o.order_id
having SUM(ol.quantity * p.unit_price) > 10000
order by total_value desc;





-- Q5: Identify any products that have never been ordered
select p.product_id, p.product_name
from products p
left join order_list ol
    on p.product_id = ol.product_id
where ol.product_id Is null;