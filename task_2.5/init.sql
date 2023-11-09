CREATE TABLE product
( product_id bigint primary key, 
product_name varchar, 
price decimal
);

CREATE TABLE shop
(shop_id bigint primary key, 
shop_name varchar
);

CREATE TABLE plan
(product_id bigint references product(product_id), 
shop_id bigint references shop(shop_id), 
plan_cnt decimal,
plan_date date
);

CREATE TABLE shop_dns
(shop_id bigint references shop(shop_id), 
product_id bigint references product(product_id), 
date_i date, 
sales_cnt bigint
);

CREATE TABLE shop_mvideo
(shop_id bigint references shop(shop_id), 
product_id bigint references product(product_id),
date_i date, 
sales_cnt bigint
);

CREATE TABLE shop_sitilink
(shop_id bigint references shop(shop_id),
product_id bigint references product(product_id),
date_i date,
sales_cnt bigint
);

CREATE TABLE promo
(promo_id bigint primary key, 
product_id bigint references product(product_id), 
shop_id bigint references shop(shop_id), 
discount decimal, 
promo_date date
);


INSERT INTO product (product_id, product_name, price)
VALUES
(1, 'Испорченный телефон', 100.00),
(2, 'Сарафанное радио', 200.00),
(3, 'Патефон', 300.00);

INSERT INTO shop (shop_id, shop_name)
VALUES
(1, 'dns'),
(2, 'mvideo'),
(3, 'sitilink');

INSERT INTO plan (product_id, shop_id, plan_cnt, plan_date)
VALUES
(1, 1, 10, '2023-05-31'),
(2, 1, 15, '2023-05-31'),
(3, 1, 20, '2023-05-31'),
(1, 2, 10, '2023-05-31'),
(2, 2, 15, '2023-05-31'),
(3, 2, 20, '2023-05-31'),
(1, 3, 10, '2023-05-31'),
(2, 3, 15, '2023-05-31'),
(3, 3, 20, '2023-05-31'),
(1, 1, 10, '2023-04-30'),
(2, 1, 15, '2023-04-30'),
(3, 1, 20, '2023-04-30'),
(1, 2, 10, '2023-04-30'),
(2, 2, 15, '2023-04-30'),
(3, 2, 20, '2023-04-30'),
(1, 3, 10, '2023-04-30'),
(2, 3, 15, '2023-04-30'),
(3, 3, 20, '2023-04-30');

TRUNCATE TABLE shop_dns;
TRUNCATE TABLE shop_sitilink;
TRUNCATE TABLE shop_mvideo;

INSERT INTO shop_dns (shop_id, date_i, product_id, sales_cnt)
VALUES
(1, '2023-05-08', 1, 9),
(1, '2023-05-28', 1, 5),
(1, '2023-05-21', 2, 5),
(1, '2023-05-29', 2, 9),
(1, '2023-05-12', 3, 9),
(1, '2023-05-31', 3, 8),
(1, '2023-04-08', 1, 5),
(1, '2023-04-28', 1, 5),
(1, '2023-04-21', 2, 5),
(1, '2023-04-29', 2, 9),
(1, '2023-04-12', 3, 9),
(1, '2023-04-20', 3, 9),
(1, '2023-04-30', 3, 8);

INSERT INTO shop_mvideo (shop_id, date_i, product_id, sales_cnt)
VALUES
(2, '2023-05-08', 1, 5),
(2, '2023-05-28', 1, 5),
(2, '2023-05-21', 2, 5),
(2, '2023-05-12', 2, 9),
(2, '2023-05-12', 3, 9),
(2, '2023-05-31', 3, 7),
(2, '2023-04-08', 1, 5),
(2, '2023-04-28', 1, 5),
(2, '2023-04-21', 2, 5),
(2, '2023-04-29', 2, 9),
(2, '2023-04-12', 3, 9),
(2, '2023-04-20', 3, 9),
(2, '2023-04-30', 3, 7);

INSERT INTO shop_sitilink (shop_id, date_i, product_id, sales_cnt)
VALUES
(3, '2023-05-08', 1, 5),
(3, '2023-05-12', 1, 6),
(3, '2023-05-21', 2, 5),
(3, '2023-05-23', 2, 9),
(3, '2023-05-12', 3, 10),
(3, '2023-05-31', 3, 9),
(3, '2023-04-08', 1, 5),
(3, '2023-04-28', 1, 5),
(3, '2023-04-21', 2, 5),
(3, '2023-04-29', 2, 9),
(3, '2023-04-12', 3, 9),
(3, '2023-04-20', 3, 9),
(3, '2023-04-08', 3, 10);

TRUNCATE TABLE promo;

INSERT INTO promo (promo_id, product_id, shop_id, discount, promo_date)
VALUES
(1, 1, 1, 10.00, '2023-05-08'),
(2, 1, 1, 5.00, '2023-05-20'),
(3, 1, 1, 15.00, '2023-05-12'),
(4, 2, 1, 15.00, '2023-05-12'),
(5, 2, 1, 7.00, '2023-05-04'),
(6, 2, 1, 5.00, '2023-05-18'),
(7, 3, 1, 20.00, '2023-05-12'),
(8, 3, 1, 4.00, '2023-05-04'),
(9, 3, 1, 5.00, '2023-05-18'),
(10, 1, 2, 10.00, '2023-05-08'),
