 
 
 
 create table cars (
     id int primary key auto_increment,
     model varchar(100) not null,
     regisrt_num varchar(15) not null unique,
     color varchar(15)
					);
                    
  create table shifts (
     id int primary key auto_increment,
     start_date datetime not null,
     end_date datetime not null,
     model varchar(100) not null,
     driver_id not null,
	 car_id not null,
     foreign key driver_id references drivers(id),
     foreign key car_id references cars(id)
					);  
                    
    create table customers (
     id int primary key auto_increment,
     first_name varchar(50) not null,
     last_name varchar(50),
     phone varchar(15) not null unique,
     email varchar(80) not null unique,
     post_code varchar(15),
     country varchar(15) not null,
     city varchar(50),
     street varchar(50),
     house_num varchar(15) not null
	 					);                   
                        
  create table dispatchers (
     id int primary key auto_increment,
     first_name varchar(50) not null,
     last_name varchar(50),
     phone varchar(15) not null unique,
     email varchar(80) not null unique
      	 					);  
                            
   create table orders (
     id int primary key auto_increment,
     customer_id int not null,
     dispatcher_id int not null,
     driver_id int not null,
	 start_date datetime not null,
     end_date datetime,
     post_code varchar(15),
     country varchar(15) not null,
     city varchar(50),
     street varchar(50),
     house_num varchar(15) not null
     constraint fk_order_driver_id foreign key driver_id references drivers(id),
     constraint fk_order_customer_id foreign key customer_id references customers(id),
     constraint fk_order_dispatcher_id foreign key dispatcher_id references dispatchersers(id),
     					);   
                        
                        
                            
                            