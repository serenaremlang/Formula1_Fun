create Table circuits_db (
	circuitId int primary key,
	name text,
	location text,
	country text,
	lat int,
	lng int,
	url text

);

create table race_db (
	raceId int primary key,
	year int,
	circuitId int,
	foreign key(circuitId) references circuits_db(circuitId)
);

select circuitid, count(raceid) as "Total Races"
from race_db
group by circuitid
order by "Total Races" DESC;