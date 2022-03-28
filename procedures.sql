
--make some customers

CREATE OR REPLACE FUNCTION add_customer(
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	email VARCHAR(100),
	address VARCHAR(100)
)
RETURNS VOID
LANGUAGE plpgsql 
AS $$ 
BEGIN 
	INSERT INTO customer(first_name, last_name, email, address)
	VALUES(first_name, last_name, email, address);
END
$$



select add_customer('joseph', 'madenjian', 'joseph.madenjian@gmail.com', 'youwishplaza 45th st');
select add_customer('rock', 'lee', 'taijutsuwarrior@gmail.com', 'hidden leaf village');
select add_customer('luffy', 'gumgum', 'rubberman@gmai.com', 'pirate ship');
select add_customer('franz', 'liszt', 'theogpianist@aol.com', 'something amazing st');
select add_customer('frederich', 'chopin', 'thesadpianist@yahoo.com', 'better than liszt lane');



--make some staff

CREATE OR REPLACE FUNCTION add_mechanic(
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	email VARCHAR(100),
	address VARCHAR(100)
)
RETURNS VOID
LANGUAGE plpgsql 
AS $$ 
BEGIN 
	INSERT INTO mechanic(first_name, last_name, email, address)
	VALUES(first_name, last_name, email, address);
END
$$

select add_mechanic('rusty', 'tusty', 'bestbuilder@gmail.com', 'livewhere you work');
select add_mechanic('joe', 'schmo', 'averagejoe@gmail.com', 'chevy lane');
select add_mechanic('butt', 'crack', 'emailuniqueworks@gmail.com', 'mouse and cat st');
select add_mechanic('omega', 'chad', 'chadwinner@chad.com', 'floating avenue harlem shake');

CREATE OR REPLACE FUNCTION add_sales_rep(
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	email VARCHAR(100),
	address VARCHAR(100)
)
RETURNS VOID
LANGUAGE plpgsql 
AS $$ 
BEGIN 
	INSERT INTO sales_rep (first_name, last_name, email, address)
	VALUES(first_name, last_name, email, address);
END
$$

select add_sales_rep('flim', 'flam', 'shadydealers@aol.com', 'rich mc rich st');
select add_sales_rep('some', 'somehthings', 'sellyoursoul@gmail.com', 'manager drive');
select add_sales_rep('flam', 'jr', 'inthenameofwealth@gmail.com', 'cant try to hard lane');



--some cars now

CREATE OR REPLACE FUNCTION add_car(
	car_vin VARCHAR(17),
	make VARCHAR(50),
	model VARCHAR(50),
	price NUMERIC(10,2)
)
RETURNS VOID
LANGUAGE plpgsql 
AS $$ 
BEGIN 
	INSERT INTO car (car_vin, make, model, price)
	VALUES(car_vin, make, model, price);
END
$$

select add_car('1029askd923jcas02', 'chevy', 'truck', 1999.99);
select add_car('892n1mc9m2icams9s', 'dodge', 'truck', 999.99);
select add_car('1029asasd2casc305', 'bugatti', 'sport', 40000.00);
select add_car('1123ask5ascaads02', 'ford', 'truck', 9000.00);
select add_car('1029askd9asd2123d', 'telsa', 'modelx', 1000000.00);
select add_car('testtestesttest12', 'ford', 'modeltest', 100.00);

--some sales
CREATE OR REPLACE FUNCTION add_sales_invoice(
	sales_rep_id INTEGER,
	customer_id INTEGER,
	car_vin VARCHAR(17)
)
RETURNS VOID
LANGUAGE plpgsql 
AS $$ 
BEGIN 
	INSERT INTO sales_invoice (sales_rep_id, customer_id, car_vin)
	VALUES(sales_rep_id, customer_id, car_vin);
END
$$

select add_sales_invoice (1, 1, 'testtestesttest12');
select add_sales_invoice (2, 4, '1029askd923jcas02');
select add_sales_invoice (2, 1, '1029asasd2casc305');

-- add maintanence
CREATE OR REPLACE FUNCTION add_maintanence(
	type_ma VARCHAR(400),
	car_vin VARCHAR(17)
)
RETURNS VOID
LANGUAGE plpgsql 
AS $$ 
BEGIN 
	INSERT INTO maintanence  (type_ma, car_vin)
	VALUES(type_ma, car_vin);
END
$$

select add_maintanence('car needed oil changed','testtestesttest12');
select add_maintanence('replaced the engine belt','1029askd923jcas02');
select add_maintanence('car needed oil changed and tire rotation','1029asasd2casc305');

CREATE OR REPLACE FUNCTION add_maintanence_tracker(
	mechanic_id INTEGER,
	maintanence_id INTEGER
)
RETURNS VOID
LANGUAGE plpgsql 
AS $$ 
BEGIN 
	INSERT INTO maintanence_tracker(mechanic_id, maintanence_id)
	VALUES(mechanic_id, maintanence_id);
END
$$

select add_maintanence_tracker(4, 1);
select add_maintanence_tracker(5, 1);
select add_maintanence_tracker(4, 2);
select add_maintanence_tracker(5, 2);
select add_maintanence_tracker(6, 2);
select add_maintanence_tracker(5, 3);

--add some parts and request

CREATE OR REPLACE FUNCTION add_part(
	part_name VARCHAR(50),
	price NUMERIC(10, 2)
)
RETURNS VOID
LANGUAGE plpgsql 
AS $$ 
BEGIN 
	INSERT INTO part(part_name, price)
	VALUES(part_name, price);
END
$$


select add_part('tires', 400);
select add_part('engine belt', 50.99);
select add_part('transmission', 999);

CREATE OR REPLACE FUNCTION add_part_request(
	part_id INTEGER
)
RETURNS VOID
LANGUAGE plpgsql 
AS $$ 
BEGIN 
	INSERT INTO part_request(part_id)
	VALUES(part_id);
END
$$

select add_part_request(1)
select add_part_request(2)
select add_part_request(3)
select add_part_request(1)





--DELETE FROM mechanic WHERE mechanic_id=11;
--DELETE FROM mechanic WHERE mechanic_id=12;
--DELETE FROM mechanic WHERE mechanic_id=13;








