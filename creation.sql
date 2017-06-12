CREATE TABLE track(
	track_title varchar(100) primary key,
	length_of_track varchar(5) not null,
	release_date date,
	genre varchar(20) not null
);

CREATE TABLE product(
	product_id int primary key auto_increment,
	media varchar(6) not null,					
	price numeric(10,6) not null,
	product_title  varchar(100),
	number_of_products int not null default 0
);

CREATE TABLE media_track(
	track_title varchar(100) ,
	product_id int,
	primary key(track_title,product_id),
	foreign key(track_title) references track(track_title) on delete restrict on update cascade
);

CREATE TABLE artist(
	artist_id varchar(6) primary key,
	artist_name varchar(100) not null
);

CREATE TABLE produces(
	artist_id varchar(6) ,
	track_title varchar(100),
	primary key(track_title),
	foreign key(artist_id) references artist(artist_id) on delete restrict on update cascade,
	foreign key(track_title) references track(track_title) on delete restrict on update cascade
);

CREATE TABLE customer_order(
	order_id int primary key auto_increment,
	order_date date,
	filled boolean not null
	
);

CREATE TABLE lists(
	product_id int ,
	order_id int,
	primary key(product_id),
	foreign key(product_id) references product(product_id)on delete cascade on update cascade ,
	foreign key(order_id)  references customer_order(order_id) on delete cascade on update cascade
);

CREATE TABLE customer(
	customer_id int primary key auto_increment,
	city varchar(10) not null,
	street varchar(100) not null,
	zip int not null,
	first_name varchar(15) not null,
	last_name varchar(15) default null,
	prefered_genre varchar(10) default null,
	phone_number int(12) default null,
	email varchar(30) default null
);
CREATE TABLE orders(
	order_id int,
	customer_id int,
	primary key(order_id),
	foreign key(order_id) references customer_order(order_id) on delete cascade on update cascade,
	foreign key(customer_id) references customer(customer_id) on delete cascade on update cascade
);

CREATE TABLE upcoming_tracks(
	upcoming_track_title varchar(100) primary key,
	release_date date not null
);

CREATE TABLE composes(
	artist_id varchar(6),
	upcoming_track_title varchar(100),
	primary key(upcoming_track_title),
	foreign key(artist_id)  references artist(artist_id) on delete restrict on update cascade,
	foreign key(upcoming_track_title ) references upcoming_tracks(upcoming_track_title) on delete restrict on update cascade
);