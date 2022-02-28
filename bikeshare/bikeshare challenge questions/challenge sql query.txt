with t1 as
(
	select concat(a.start_station_id,
				  replace(to_char(a.start_time,'HH24:MI'),':', ''))::numeric,
		a.start_station_id,
		to_char(a.start_time,'HH24:MI') start_time_hr,
		count(a.start_time) bikes_outflow_cnt,
		b.latitude,
		b.longtitude,
		b.name
	from public.bluebikes_2019 a
		join public.bluebikes_stations b
		on a.start_station_id = b.id
	group by 2, 3, b.latitude, b.longtitude, b.name
	order by 2,3
	
)
,
t2 as
(
	select concat(a.end_station_id,replace(to_char(a.end_time,'HH24:MI'),':',''))::numeric,
	a.end_station_id,
	to_char(a.end_time,'HH24:MI') end_time_hr,
	count(a.end_time) bikes_inflow_cnt,
	b.name,
	b.latitude,
	b.longtitude,
	b.total_docks
from public.bluebikes_2019 a
	join public.bluebikes_stations b
	on a.end_station_id = b.id
group by 1, 2, 3, 5, b.name, b.total_docks, b.latitude, b.longtitude
order by 2,3
)
select t1.*, t2.*
from t1
full join t2
using(concat)