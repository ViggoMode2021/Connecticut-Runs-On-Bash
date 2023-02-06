-- Set params
set session my.number_of_sales = '100';
set session my.number_of_users = '100';
set session my.number_of_products = '100';
set session my.number_of_stores = '100';
set session my.number_of_coutries = '100';
set session my.number_of_cities = '30';
set session my.status_names = '5';
set session my.start_date = '2019-01-01 00:00:00';
set session my.end_date = '2020-02-01 00:00:00';

-- load the pgcrypto extension to gen_random_uuid ()
CREATE EXTENSION pgcrypto;

-- Filling of products
INSERT INTO product
select id, concat('Product ', id) 
FROM GENERATE_SERIES(1, current_setting('my.number_of_products')::int) as id;

-- Filling of countries
INSERT INTO country
select id, concat('Country ', id) 
FROM GENERATE_SERIES(1, current_setting('my.number_of_coutries')::int) as id;

-- Filling of cities
INSERT INTO city
select id
	, concat('City ', id)
	, floor(random() * (current_setting('my.number_of_coutries')::int) + 1)::int
FROM GENERATE_SERIES(1, current_setting('my.number_of_cities')::int) as id;
