drop table orders cascade;
drop table customers cascade ;
drop database test_1;



-- step one create database
create database test_1;
-- create table 

create table customers (
--	id generate always as int primary key,
	customer_id int primary key,
	first_name text not null,
	last_name text not null,
	email text not null
);
-- unique, generated always as (data type)

-- copy customers (customer_id, first_name, last_name, email)
-- from 'file path to object -- example -- /path/to/customer_data.csv' deleimiter ',' csv header;

-- how to put data into your table single value
insert into customers (customer_id, first_name, last_name, email)
values(1, 'John', 'Doe', 'johndoe@example.com');

-- how to put multiple values into your table

insert into customers (customer_id, first_name, last_name, email)
	values (2, 'Jane', 'Doe', 'janedoe@example.com'),
	       (3, 'Bob', 'Smith', 'bobsmith@example.com');
-- note

-- table for orders


create table orders (
	order_id int primary key,
	customer_id int not null,
	product_name text not null,
	quantity int not null,
	foreign key (customer_id) references customers(customer_id)
);

insert into orders (order_id, customer_id, product_name, quantity)
values (1, 1, 'Keyboard', 2),
       (2, 1, 'Mouse', 1),
       (3, 2, 'Monitor', 1);







