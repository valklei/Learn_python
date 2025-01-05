create schema if not exists 160924_taxi_less13;
use 160924_taxi_less13;

create table if not exists driver (
id int primary key,
first_name varchar(50),
last_name varchar(50),
phone_number varchar(15)
);

create table if not exists driver_info (
id int primary key,
birth_date date,
driver_id int,
foreign key (driver_id) references driver(id)
);