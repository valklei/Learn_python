create schema if not exists 160924_shop_less13;
use 160924_shop_less13;

-- Онлайн магазин: есть склад с товарами, клиенты и заказы, которые оформили клиенты. В
-- заказе может быть несколько товаров, у клиента может быть несколько заказов. У товара есть
-- номер, описание, два вида цены: оригинальная и скидочная. У пользователя, помимо
-- персональных данных, есть адрес доставки и таких адресов может быть несколько: разные
-- заказы могут быть доставлены на разные адреса.

-- Товары
-- Клиенты
-- Адреса доставки
-- Заказы

create table if not exists good (
	id int primary key AUTO_INCREMENT,
	title varchar(80) not null,
	`description` varchar(400),
	price decimal(10, 2) not null check (price > 0),
	discount_price decimal(10, 2) not null check (discount_price > 0),
	quantity int not null check (quantity >= 0)
);

create table if not exists client (
	id int primary key AUTO_INCREMENT,
	first_name varchar(80) not null,
	last_name varchar(80) not null,
	phone_number varchar(15),
	email varchar(80) not null,
	birth_date date,
    is_active bool default true,
    registered_at datetime default now()
);

create table if not exists address (
	id int primary key AUTO_INCREMENT,
	post_code varchar(80) not null,
	city varchar(60) not null,
	street varchar(120) not null,
	house_number varchar(6) not null,
	flat_number varchar(20),
    client_id int,
    foreign key (client_id) references client(id)
);

create table if not exists `order` (
	id int primary key AUTO_INCREMENT,
	created_at datetime default now(),
    client_id int,
    address_id int,
    foreign key (client_id) references client(id),
    foreign key (address_id) references address(id)
);

create table if not exists order_goods (
    order_id int,
    good_id int,
	quantity int not null check (quantity >= 0),
	PRIMARY KEY (order_id, good_id),
    foreign key (order_id) references `order`(id),
    foreign key (good_id) references good(id)
);
