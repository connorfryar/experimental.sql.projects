select county, description, qty_sold
from(
	select *,
	count(county) over(partition by county),
	dense_rank() over(partition by county order by description) alpha_sort
	from(
		select *, 
		dense_rank() over(partition by county order by qty_sold desc)
		-- dense_rank and rank difference 
		-- rank 888, 888 1, 1, 3
		-- dense_rank 888, 888 1, 1, 2
		from(
			select c.county, s.description, count(s.*) qty_sold
			from counties c
			join sales s
			using(county)
			group by 1, 2
			) as t1
		) as t2
	where dense_rank = 6
	order by 1, 3, 5, 6
	) as t3
where alpha_sort = 1