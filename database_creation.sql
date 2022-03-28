create table customer(
	customer_id SERIAL primary key, 
	first_name VARCHAR(50),
	last_name VARCHAR(50), 
	email VARCHAR(50) unique,
	address VARCHAR(100)
);

create table sales_rep(
	sales_rep_id SERIAL primary key, 
	first_name VARCHAR(50),
	last_name VARCHAR(50), 
	email VARCHAR(50) unique,
	address VARCHAR(100)
);

create table mechanic(
	mechanic_id SERIAL primary key, 
	first_name VARCHAR(50),
	last_name VARCHAR(50), 
	email VARCHAR(50) unique,
	address VARCHAR(100)
);

create table car(
	car_vin  VARCHAR(17) primary key, 
	make VARCHAR(50),
	model VARCHAR(50), 
	price NUMERIC(10, 2)
);


create table sales_invoice(
	sales_invoice_id SERIAL primary key,
	sales_rep_id INTEGER not null,
	customer_id INTEGER not null,
	car_vin VARCHAR not null,
	foreign key(sales_rep_id) references sales_rep(sales_rep_id),
	FOREIGN KEY(customer_id) REFERENCES customer(customer_id),
	foreign key(car_vin) references car(car_vin)
);

----- not yet run



create table maintanence(
	maintanence_id SERIAL primary key,
	type_ma VARCHAR(400),
	car_vin VARCHAR
);

create table part(
	part_id SERIAL primary key,
	part_name VARCHAR(50),
	price NUMERIC(10,2)
);

create table mechanic(
	mechanic_id SERIAL primary key,
	name VARCHAR(50),
	address VARCHAR(100),
);

create table maintanence_tracker(
	maintanence_tracker_id SERIAL primary key,
	mechanic_id INTEGER,
	maintanence_id INTEGER, 
	foreign key(mechanic_id) references mechanic(mechanic_id),
	foreign key(maintanence_id) references maintanence(maintanence_id)
);

create table part_request(
	part_request_id SERIAL primary key,
	part_id INTEGER,
	foreign key(part_id) references part(part_id)
);

create table service_invoice(
	service_invoice_id SERIAL primary key,
	car_vin VARCHAR not null,
	customer_id INTEGER not null,
	maintanence_id INTEGER,
	part_request_id INTEGER,
	foreign key(car_vin) references car(car_vin),
	foreign key(customer_id) references customer(customer_id),
	foreign key(maintanence_id) references maintanence(maintanence_id),
	foreign key(part_request_id) references part_request(part_request_id)
);

create table service_history(
	service_history_id SERIAL primary key,
	service_invoice_id INTEGER,
	car_vin VARCHAR,
	foreign key(service_invoice_id) references service_invoice(service_invoice_id),
	foreign key(car_vin) references car(car_vin)
);




--DROP TABLE IF EXISTS service_invoice;







