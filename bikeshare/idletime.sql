select start_station_id,
sum(idle_time_at_station::numeric) as total_idle_time_at_station--,
--sum(duration_active::numeric) as total_duration_active_for_bike_3961

from (
select *,
to_char((start_time - time_arrived_at_station), 'mi') idle_time_at_station
from (
select *,
lag(end_time, 1) over(order by dense_rank) as time_arrived_at_station,
lag(end_station_id, 1) over(order by dense_rank) as station_arrived_check
from (
select bw.bike_id, bw.start_station_id, bw.end_station_id, bw.start_time, bw.end_time, 
sum(to_char( (end_time-start_time), 'MI')::numeric ) duration_active
, dense_rank() over(partition by bw.bike_id order by bw.end_time)
from baywheels_2018 bw
left join public.baywheels_stations bwss
on bw.start_station_id = bwss.id
left join public.baywheels_stations bwse
on bw.end_station_id = bwse.id
--where bw.bike_id = 3961
group by bw.bike_id, bw.start_station_id, bw.end_station_id, bw.start_time, bw.end_time
order by 1, 5 asc  ) as t1 
) as t2
where station_arrived_check = start_station_id ) as t3
where idle_time_at_station::numeric >=0
group by start_station_id