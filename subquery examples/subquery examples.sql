select sub_region, t.product_name, max(total_profit)
from (

	select region, sub_region, 
		p.product_name,
		count(p.product_name) as qty_sold,
		sum(o.sales)::money as total, 
		sum(o.profit)::money as total_profit
	from orders o 
		join regions using(region_id)
		join products p using(product_id)
	group by region, sub_region, p.product_name
	order by sub_region asc, total_profit DESC) as t
group by sub_region, t.product_name;


select region, sub_region, max(qty_sold) as top_qty_sold, max(total) as max_total, max(total_profit) as max_total_profit
from (select region, sub_region,
	p.product_name,
	count(p.product_name) as qty_sold,
	sum(o.sales)::money as total,
	sum(o.profit)::money as total_profit
from orders o
	join regions using(region_id)
	join products p using(product_id)
group by region, sub_region, p.product_name
order by sub_region asc, total_profit DESC) as subq
group by 1, 2
order by 1,2;


select region, sub_region, product_name, max(qty_sold) as top_qty_sold, max(total) as max_total
	, max(total_profit) filter (where subq.total_profit =  max(total_profit)) AS filtered
from (select region, sub_region,
	p.product_name,
	count(p.product_name) as qty_sold,
	sum(o.sales)::money as total,
	sum(o.profit)::money as total_profit
from orders o
	join regions using(region_id)
	join products p using(product_id)
group by region, sub_region, p.product_name
order by sub_region asc, total_profit DESC) as subq
group by 1, 2, 3
order by 6 desc; 