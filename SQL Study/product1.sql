use 160924_Valklei;
create table customer
 (customer_id int primary key auto_increment, 
first_name varchar (120),
last_name varchar (120),
street varchar (140),
post_code varchar (13),
city varchar (120),
country varchar (100),
email varchar (160),
data_r date);


create table products
 (product_id int primary key auto_increment, 
title_product varchar (120),
product_ds varchar (130),
photo_link varchar (120),
price_1 decimal(10,2),
quantity int);

create table orders
 (order_id int primary key auto_increment, 
customer_id int,
product_id int,
data_orders datetime default now(),
quantity_order int,
price_1 decimal(10,2) default 0);

insert into customer
	(first_name, last_name, street, post_code, city, country, email, data_r)
	values('Leo', 'Messi', 'Buenos str.', 'E2000', 'Rosario', 'Argentina', 'messi@gmail.com', '2024-10-10'),
		  ('Oleg', 'Blochin', 'Kreschatik', '01001', 'Kiiv', 'Ukraine', 'blochin@gmail.com', '2011-02-07'),
		  ('Olena', 'Pralia', 'Bilser str.', '22297', 'Hamburg', 'Germany', 'pralia@gmail.com', '2020-11-27'),
		  ('Vlad', 'Ronin', 'Europa str.', '10100', 'Prague', 'Chech', 'ronin@gmail.com', '2021-05-01'),
		  ('Nick', 'Beil', 'Beicker str.', 'W1A 1AB', 'London', 'England', 'beil@gmail.com', '2023-04-19'),
  	      ('Alex', 'Noll', 'Eich str.', '578000', 'Boston', 'USA', 'noll@icloud.com', '2024-01-17'),
		  ('Max', 'Sim', 'Bruce str', 'A51545', 'Brussel', 'Belgium', 'sim@meta.com', '2017-03-22'),
		  ('Kim', 'Kard', 'Mode ave.', '11207', 'Paris', 'France', 'kard@net.com', '2015-01-30'),
		  ('Olha', 'Korbut', 'Horse bvr.', 'A1562', 'Helm', 'Poland', 'korbut@i.com', '2018-06-23'),
		  ('Anna', 'Pliss', 'Pressa str.', '556655', 'Madrid', 'Spain', 'pliss@puma.com', '2023-08-24');
          
insert into products
	(title_product, product_ds, photo_link, price_1, quantity)
	values('Cap', 'ceramic cup 100 ml', 'www.ddd.ccc', 20.43, 1700),
		  ('Ball', 'rubber ball for children', 'www.ddd1.ccc', 7.99, 530),
		  ('refrigerator Daewoo', 'refrigerator 220x60x60', 'www.ddd22.ccc', 475.99, 43),
		  ('Armchair', 'Armchair leather color beige', 'www.ddd3.ccc', 370.00, 17),
          ('backpack', 'school backpack black 20 l.', 'www.asd.ccc', 11.50, 130),
          ('Travel bag', 'Brown leather travel bag', 'www.dsa.ccc', 250.17, 22),
          ('chandelier', 'Round white chandelier', 'www.dцц.ccc', 50.00, 11),
		  ('shoe cabinet', 'shoe cabinet white', 'www.bbb.nnn', 35.99, 370); 
          
insert into orders
	(customer_id, product_id, quantity_order)
	values(5, 1, 2),
          (3, 3, 1),
		  (3, 8, 3),
		  (5, 5, 1),
		  (5, 1, 2),
		  (1, 3, 1),
		  (2, 7, 1),
		  (4, 1, 2),
		  (10, 6, 1),
		  (9, 2, 3),
		  (4, 5, 1),
		  (1, 4, 1),
		  (7, 8, 2),
		  (8, 2, 1),
		  (6, 5, 1),
		  (1, 3, 1),
		  (2, 7, 1),
		  (4, 4, 1),
		  (10, 8, 1),
		  (9, 3, 3),
		  (4, 6, 1),
		  (1, 2, 2),
		  (7, 7, 2),
		  (8, 5, 1),
		  (6, 6, 1);
    
    update orders
  set price_1 = (select price_1 from products
				         where products.product_id = orders.product_id) * quantity_order;
    
   

 
 

 
 