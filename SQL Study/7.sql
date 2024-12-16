SELECT * FROM airport.tickets;
SELECT * FROM airport.tickets;
select id, trip_id, price,
	case
	when service_class = "Economy" then `price` * 0.85
    when service_class = "Business" then `price` * 0.9
    when service_class = "PremiumEconomy" then `price` * 0.8
    end as new_price
     from airport.tickets
     where trip_id in ("LL4S1G8PQW", "JQF04Q8I9G");

 