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
	name text,
	url text,
	foreign key(circuitId) references circuits_db(circuitId)
);