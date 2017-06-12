1)alter table media_track add constraint media_fk foreign key(product_id) references product(product_id) on delete cascade on update cascade;

2)ALTER TABLE product CHANGE number_of_products number_of_tracks int default 0;

3)List all trackdetails whose length is in the range of 3 mins.
select * from track where length_of_track like "3%";

4)List the name of the customers who prefer the genre pop.
select first_name,last_name from customer where prefered_genre="pop";

5)List track titles by the artist which has an id of A2.//
select track_title from produces where artist_id="A2";

6)List customer id of the customer who belongs to Bangalore or Lucknow.
select customer_id from customer where city="Bangalore" or city="Lucknow";

7)List all the products that are not of type cd.
select product_title from product where media not in ("cd");

8) List the name of the customers who have not mentioned their email id.
select first_name,last_name from customer where email is null;


9) count the number of products who have order id 103.
select count(*) as no_of_products from lists group by order_id having order_id=103;

10) List the number of tracks in each product id.
select product_id,count(*) as no_of_tracks from media_track group by product_id;

11) Find the most expensive product.
select max(price) from product;

12)List all the products who have chosen the track 'Supermarket Flowers'.
select product_title from product where product_id in (select product_id from media_track where track_title="Supermarket Flowers");

13)List the name and address of the customers who have placed their order on the date "2016/12/30".
select first_name,last_name,street,city,zip from customer where customer_id in (select customer_id from orders where order_id in (select order_id from customer_order where order_date="2016/12/30"));

14) List upcoming_track_title which are about to release in the month of January. 
select upcoming_track_title from upcoming_tracks where extract( month from release_date)=01; 

15)List upcoming_track_title of the artist "Chainsmokers"
select upcoming_track_title from composes as c,artist as a where  c.artist_id=a.artist_id and a.artist_name="Chainsmokers";



create trigger check_date before insert on upcoming_tracks for each row check @new.release_date >=current_date;//

create view recommendation as select track_title,count(*) as no_of_orders from media_track group by track_title; 
select track_title from recommendation order by no_of_orders desc limit 8; 