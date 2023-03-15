create table if not exists customer(
	customer_id serial primary key,
	first_name varchar(50) not null,
	last_name varchar(50) not null,
	email varchar(100) not null,
	address varchar(100),
	phone varchar(100),
	vip boolean default false
	);
	
create table if not exists movie(
	movie_id serial primary key,
	movie_name varchar(50) not null,
	description varchar(250) not null,
	release_date timestamp
	);
	
create table if not exists theater(
	theater_id serial primary key,
	theater_name varchar(50) not null,
	theater_address varchar(100) not null
	);


create table if not exists movie_theater (
	mt_id serial primary key,
	movie_id integer not null,
	theater_id integer not null,
	foreign key (movie_id) references "movie"(movie_id),
	foreign key (theater_id) references "theater" (theater_id)
);

create table if not exists ticket (
	ticket_id serial primary key,
	customer_id integer not null,
	mt_id integer not null,
	seat_number integer,
	foreign key (customer_id) references "customer"(customer_id),
	foreign key (mt_id) references "movie_theater"(mt_id)
	);

