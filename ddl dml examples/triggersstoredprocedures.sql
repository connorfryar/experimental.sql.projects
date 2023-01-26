-- customers changes their last name
drop procedure update_customer_last_name;

create procedure update_customer_last_name (in p_customer_id int, in p_last_name text)
as $$
begin
	update public.customers
	set last_name = p_last_name
	where customer_id = p_customer_id;
end;
$$ language plpgsql;

call update_customer_last_name(1, 'Doe');

-- update public.customers
-- 	set last_name = 'smith'
-- 	where customer_id = 1;




create function update_updated_at()
returns trigger as $$
begin
	new.updated_at = current_timestamp;
	return new;
end;
$$ language plpgsql;

create trigger update_customers_updated_at 
before update on customers
for each row
execute procedure update_updated_at();

insert into customers (customer_id, first_name, last_name, email)
values(100, 'connor', 'fryar', 'connor.fryar@generalassemb.ly');

