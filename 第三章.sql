create view productsum (product_type, cnt_product)
as
select product_type, count(*)
  from shop.product
 group by product_type;
 

CREATE TABLE shop_product
(shop_id    CHAR(4)       NOT NULL,
 shop_name  VARCHAR(200)  NOT NULL,
 product_id CHAR(4)       NOT NULL,
 quantity   INTEGER       NOT NULL,
 PRIMARY KEY (shop_id, product_id));

INSERT INTO shop_product (shop_id, shop_name, product_id, quantity) VALUES ('000A',	'东京',		'0001',	30);
INSERT INTO shop_product (shop_id, shop_name, product_id, quantity) VALUES ('000A',	'东京',		'0002',	50);
INSERT INTO shop_product (shop_id, shop_name, product_id, quantity) VALUES ('000A',	'东京',		'0003',	15);
INSERT INTO shop_product (shop_id, shop_name, product_id, quantity) VALUES ('000B',	'名古屋',	'0002',	30);
INSERT INTO shop_product (shop_id, shop_name, product_id, quantity) VALUES ('000B',	'名古屋',	'0003',	120);
INSERT INTO shop_product (shop_id, shop_name, product_id, quantity) VALUES ('000B',	'名古屋',	'0004',	20);
INSERT INTO shop_product (shop_id, shop_name, product_id, quantity) VALUES ('000B',	'名古屋',	'0006',	10);
INSERT INTO shop_product (shop_id, shop_name, product_id, quantity) VALUES ('000B',	'名古屋',	'0007',	40);
INSERT INTO shop_product (shop_id, shop_name, product_id, quantity) VALUES ('000C',	'大阪',		'0003',	20);
INSERT INTO shop_product (shop_id, shop_name, product_id, quantity) VALUES ('000C',	'大阪',		'0004',	50);
INSERT INTO shop_product (shop_id, shop_name, product_id, quantity) VALUES ('000C',	'大阪',		'0006',	90);
INSERT INTO shop_product (shop_id, shop_name, product_id, quantity) VALUES ('000C',	'大阪',		'0007',	70);
INSERT INTO shop_product (shop_id, shop_name, product_id, quantity) VALUES ('000D',	'福冈',		'0001',	100);


create view view_shop_product (product_type, sale_price, shop_name)
as
select p.product_type , p.sale_price , sp.shop_name
  from shop.product p,
       shop.shop_product sp
 where p.product_id = sp.product_id;

select *
  from view_shop_product
 where product_type = '衣服';
 
alter view productsum 
   as
      select product_type, sale_price
        from product
       where regist_date > '2009-09-11';
       
     
      
update productsum 
   set sale_price = '5000'
 where product_type = '办公用品';
 
drop view productsum;

SELECT product_type, cnt_product
  FROM (
        SELECT *
          FROM (  
                SELECT product_type, 
                  FROM product 
                 GROUP BY product_type
              ) AS productsum
         WHERE cnt_product = 4
      ) AS productsum2;
     
SELECT product_id, product_name, sale_price
  FROM product
 WHERE sale_price > (SELECT AVG(sale_price) FROM product);
 
SELECT product_id,
       product_name,
       sale_price,
       (
          SELECT AVG(sale_price) FROM product
        ) AS avg_price
  FROM product;
 

 
select product_type , product_name , sale_price 
  from product as p1
 where sale_price > (SELECT avg(sale_price)
       FROM product AS p2
      WHERE p1.product_type = p2.product_type
   GROUP BY product_type);
   
  
/*
 * 练习题
 * 练习题
 * 练习题
 * 练习题
 * 练习题
 * 练习题
 * 练习题
 * */

-- 3.1
CREATE VIEW ViewPractice5_1 (product_name, sale_price, regist_date)
AS
SELECT product_name, sale_price, regist_date
  FROM product
 where sale_price > 1000 and regist_date = '2009-10-10';
 
select * from ViewPractice5_1;

-- 3.2
insert into ViewPractice5_1 values ('刀子', 300, '2009-11-02');



-- 3.3
select product_id, 
	   product_name, 
	   product_type, 
	   sale_price,
	   (select avg(sale_price)
	      from product) as sale_price_avg
  from product;
  

-- 3.4
select product_id, 
	   product_name, 
	   product_type, 
	   sale_price,
	   (select avg(sale_price)
	      from product as p2
	     where p1.product_id = p2.product_id
	     group by product_type
	      ) as sale_price_avg_type
  from product as p1;
  
 

-- 3.5