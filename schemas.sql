CREATE TABLE products (
id serial primary key,
name text NOT NULL,
slogan text,
description text NOT NULL,
category text NOT NULL,
default_price text NOT NULL
);

CREATE TABLE features (
id serial primary key,
product_id integer references products(id),
feature text NOT NULL,
value text

);

CREATE TABLE styles (
id serial primary key,
productId integer references products(id),
name text NOT NULL,
sale_price text,
original_price text NOT NULL,
default_style boolean
);

CREATE TABLE skus (
id serial primary key,
styleId integer references styles(id),
size text NOT NULL,
quantity integer NOT NULL
);

CREATE TABLE related (
id serial primary key,
current_product_id integer references products(id),
related_product_id integer
);


COPY public.products (id, name, slogan, description, category, default_price)
FROM '/product.csv'
DELIMITER ','
CSV HEADER QUOTE '\"'
ESCAPE '''';""

COPY public.features (id, product_id, feature, value)
FROM '/features.csv'
DELIMITER ','
CSV HEADER QUOTE '\"'
ESCAPE '''';""

COPY public.styles (id, productid, name, sale_price, original_price, default_style)
FROM '/styles.csv'
DELIMITER ','
CSV HEADER QUOTE '\"'
ESCAPE '''';""

COPY public.skus (id, styleid, size, quantity)
FROM '/Users/gabi/Downloads/skus.csv'
DELIMITER ','
CSV HEADER QUOTE '\"'
ESCAPE '''';""

COPY public.related (id, current_product_id, related_product_id)
FROM '/Users/gabi/Downloads/related.csv'
DELIMITER ','
CSV HEADER QUOTE '\"'
ESCAPE '''';""