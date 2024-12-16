use 160924_Valklei2;
# Task 1
create table weather 
	(city varchar(100), forecast_date date, temperature integer);
# Task 3,4
  insert into weather
      (city, forecast_date, temperature)
      values('Vien', '2024-10-10', 23),
			('Hamburg', '2021-11-13', 5),
			('Dnipro', '2023-01-29', 0),
			('Riga', '2023-08-01', 32),
			('London', '1997-07-05', 31);  
            
insert into weather
      (city, forecast_date, temperature)
      values('Berlin', '2023-08-29', 30);
# Task 6
update weather
set temperature = 26
where city = 'Berlin';
# Task 7
update weather
set city = 'Paris'
where temperature > 25;
# Task 8,9
alter table weather
add column min_temp integer;

update weather
set min_temp = 0;
