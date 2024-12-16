SELECT * FROM airport.airliners;
select model_name, `range`,
case
    when `range` > 1000 and  `range` <= 2500
    then 'short_haul'
	when `range` > 2500 and  `range` <= 6000
    then 'mittel_haul' 
    when `range` > 6000 
    then 'longe_haul'
    end as kategory
    from airport.airliners
    