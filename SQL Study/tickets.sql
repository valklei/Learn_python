SELECT * FROM airport.tickets;
select id, service_class, price,
case
    when price between 10000 and 11000 then "Economy"
    when price between 20000 and 31000 then "Premiun_Economy"
    when price > 100000 then "Premium"
    end as class_1
    from airport.tickets