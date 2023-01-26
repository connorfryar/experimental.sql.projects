SELECT rank_filter.* FROM (
  SELECT subq.*, 
      rank() OVER (
          PARTITION BY sub_region, subq.total_profit
          ORDER BY subq.total_profit DESC
      )
	FROM (select region, sub_region,
		p.product_name,
		count(p.product_name) as qty_sold,
		sum(o.sales)::money as total,
		sum(o.profit)::money as total_profit
	from orders o
		join regions using(region_id)
		join products p using(product_id)
	group by region, sub_region, p.product_name
	order by sub_region asc, total_profit DESC) subq)
rank_filter WHERE RANK <= 2;


SELECT rank_filter.* FROM (
  SELECT subq.*, 
      rank() OVER (
          PARTITION BY subq.region, subq.sub_region
          ORDER BY subq.region, subq.total_profit DESC
      )
	FROM (select region, sub_region, product_name, 
		 count(p.product_name) as qty_sold,
		  sum(o.profit)::money as total_profit
	FROM orders o
		join regions using(region_id)
		join products p using(product_id)
	group by region, sub_region, p.product_name
	order by region, sub_region, total_profit DESC) as subq)
rank_filter WHERE RANK <= 3;