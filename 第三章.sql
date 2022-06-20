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

INSERT INTO shop_product (shop_id, shop_name, product_id, quantity) VALUES ('000A',	'����',		'0001',	30);
INSERT INTO shop_product (shop_id, shop_name, product_id, quantity) VALUES ('000A',	'����',		'0002',	50);
INSERT INTO shop_product (shop_id, shop_name, product_id, quantity) VALUES ('000A',	'����',		'0003',	15);
INSERT INTO shop_product (shop_id, shop_name, product_id, quantity) VALUES ('000B',	'������',	'0002',	30);
INSERT INTO shop_product (shop_id, shop_name, product_id, quantity) VALUES ('000B',	'������',	'0003',	120);
INSERT INTO shop_product (shop_id, shop_name, product_id, quantity) VALUES ('000B',	'������',	'0004',	20);
INSERT INTO shop_product (shop_id, shop_name, product_id, quantity) VALUES ('000B',	'������',	'0006',	10);
INSERT INTO shop_product (shop_id, shop_name, product_id, quantity) VALUES ('000B',	'������',	'0007',	40);
INSERT INTO shop_product (shop_id, shop_name, product_id, quantity) VALUES ('000C',	'����',		'0003',	20);
INSERT INTO shop_product (shop_id, shop_name, product_id, quantity) VALUES ('000C',	'����',		'0004',	50);
INSERT INTO shop_product (shop_id, shop_name, product_id, quantity) VALUES ('000C',	'����',		'0006',	90);
INSERT INTO shop_product (shop_id, shop_name, product_id, quantity) VALUES ('000C',	'����',		'0007',	70);
INSERT INTO shop_product (shop_id, shop_name, product_id, quantity) VALUES ('000D',	'����',		'0001',	100);


create view view_shop_product (product_type, sale_price, shop_name)
as
select p.product_type , p.sale_price , sp.shop_name
  from shop.product p,
       shop.shop_product sp
 where p.product_id = sp.product_id;

select *
  from view_shop_product
 where product_type = '�·�';
 
alter view productsum 
   as
      select product_type, sale_price
        from product
       where regist_date > '2009-09-11';
       
     
      
update productsum 
   set sale_price = '5000'
 where product_type = '�칫��Ʒ';
 
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

  
  

  
-- ----------------------------------------------
-- ----------------------------------------------
-- ----------------------------------------------
-- �ڶ�����
-- �ڶ�����
-- �ڶ�����
-- ----------------------------------------------
-- ----------------------------------------------
-- ----------------------------------------------
-- 3.3 ���ָ����ĺ���
  
select * from samplemath s;

select
	m,
	ABS(m) as abs_col,
	n,
	p,
	MOD(n, p) as mod_col,
	ROUND(m, 1) as round_col
  from samplemath;
  
  
  
  -- DML ����������

  
  
  -- DDL ��������
USE  shop;
DROP TABLE IF EXISTS samplestr;
CREATE TABLE samplestr(
	str1 VARCHAR (40),
	str2 VARCHAR (40),
	str3 VARCHAR (40)
);
-- DML����������
START TRANSACTION;
INSERT INTO samplestr (str1, str2, str3) VALUES ('opx',	'rt', NULL);
INSERT INTO samplestr (str1, str2, str3) VALUES ('abc', 'def', NULL);
INSERT INTO samplestr (str1, str2, str3) VALUES ('̫��',	'����', '����');
INSERT INTO samplestr (str1, str2, str3) VALUES ('aaa',	NULL, NULL);
INSERT INTO samplestr (str1, str2, str3) VALUES (NULL, 'xyz', NULL);
INSERT INTO samplestr (str1, str2, str3) VALUES ('@!#$%', NULL, NULL);
INSERT INTO samplestr (str1, str2, str3) VALUES ('ABC', NULL, NULL);
INSERT INTO samplestr (str1, str2, str3) VALUES ('aBC', NULL, NULL);
INSERT INTO samplestr (str1, str2, str3) VALUES ('abc����',  'abc', 'ABC');
INSERT INTO samplestr (str1, str2, str3) VALUES ('abcdefabc', 'abc', 'ABC');
INSERT INTO samplestr (str1, str2, str3) VALUES ('micmic', 'i', 'I');
COMMIT;

select * from samplestr s ;


select 
	str1,
	str2,
	str3,
	concat(str1,str2, str3) as str_concat,
	length(str1) as len_str,
	lower(str1) as low_str,
	replace(str1, str2, str3) as rep_str,
	substring(str1 from 3 for 2) as sub_str
  from 
	samplestr;

select current_date, current_time, current_timestamp;

select
	current_timestamp as now,
	extract(year from current_timestamp) as year,
	extract(month from current_timestamp) as month,
	extract(day from current_timestamp) as day,
	extract(hour from current_timestamp) as hour,
	extract(minute from current_timestamp) as minute,
	extract(second from current_timestamp) as second;

select cast(current_date as signed integer) as int_col;
select cast('0001' as signed integer) as int_col;

select 
	coalesce(null, 11) as col_1,
	coalesce(null, 'hello_world', current_time) as col_2,
	coalesce(null, null, current_date) as col_3;

select * from samplelike s ;

select *
  from samplelike s 
 where strcol like 'ddd%';

select *
  from samplelike s 
 where strcol like '%ddd';

select *
  from product p 
 where sale_price between 100 and 1000;

select product_name , purchase_price
  from product p 
 where 
 	purchase_price = 320 or 
 	purchase_price = 500 or 
 	purchase_price = 5000;
 
select product_name , purchase_price
  from product p 
 where purchase_price in (320, 500, 5000);


select product_name , sale_price 
  from product 
 where product_id IN (
 	select product_id
 	  from shopproduct s 
 	 where shop_id = '000C'
 	);
 
select product_name , sale_price 
  from product p 
 where product_id not in (
 	select product_id
 	  from shopproduct s
 	 where shop_id = '000A');

select product_name , sale_price 
  from product as p
 where not exists (
 	select *
 	  from shopproduct as s
 	 where s.shop_id = '000A'
 	   and s.product_id = p.product_id);

select product_name,
	case when product_type = 'A���·�' then product_type = '�·�'
		 when product_type = 'B���칫��Ʒ' then product_type = '�칫��Ʒ'
		 when product_type = 'C�������þ�' then product_type = '�����þ�'
		 else null
	end as abc_product_type
  from product;

 select * from product p;

select sum(case when product_type = '�·�' then sale_price else 0 end) as sum_price_clothes,
	   sum(case when product_type = '�����þ�' then sale_price else 0 end) as sum_price_kitchen),
	   sum(case when product_type = '�칫��Ʒ' then sale_price else 0 end) as sum_price_office
  from product;


create table Score(
	name varchar(10),
	subject varchar(10),
	score int(2)
);

insert into Score values 
	('����', '����', 93),
	('����', '��ѧ', 88),
	('����', '����', 91),
	('����', '����', 87),
	('����', '��ѧ', 90),
	('����', '����', 77);

select * from Score;


select name,
	   case when subject = '����' then score end as chinese,
	   case when subject = '��ѧ' then score end as math,
	   case when subject = '����' then score end as english
  from Score;

-- score �е���ת��
select name,
	   sum(case when subject = '����' then score else null end) as chinese,
	   sum(case when subject = '��ѧ' then score else null end) as math,
	   sum(case when subject = '����' then score else null end) as english
  from Score
 group by name;

-- subject �е���ת��
select name,
	   MAX(case when subject = '����' then subject end) as Chinese,
	   MAX(case when subject = '��ѧ' then subject end) as Math,
	   MAX(case when subject = '����' then subject end) as English
  from Score
 group by name;

/*
 * ��ϰ��
 * ��ϰ��
 * ��ϰ��
 * ��ϰ��
 * ��ϰ��
 * ��ϰ��
 * ��ϰ��
 * */

-- 3.1
CREATE VIEW ViewPractice5_1 (product_name, sale_price, regist_date)
AS
SELECT product_name, sale_price, regist_date
  FROM product
 where sale_price > 1000 and regist_date = '2009-10-10';
 
select * from ViewPractice5_1;

-- 3.2
insert into ViewPractice5_1 values ('����', 300, '2009-11-02');



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
��Ȼ����NULL

-- 3.6
-- ���۲������������۸����Ʒ��������Ʒ����
SELECT product_name, purchase_price
  FROM product
 WHERE purchase_price NOT IN (500, 2800, 5000);

-- Ϊ��

SELECT product_name, purchase_price
  FROM product
 WHERE purchase_price NOT IN (500, 2800, 5000, NULL);


-- 3.7
select * from product;

-- �ҵ�����
select 
	(select count(*) from product where sale_price <= 1000) as  low_price,
	(select count(*) from product where sale_price > 1000 and sale_price <= 3000) as mid_price,
	(select count(*) from product where sale_price > 3000) as high_price;

-- ��׼��
select	sum(case when sale_price <= 1000 then 1 else 0 end) as low_price,
		sum(case when sale_price > 1000 and sale_price <= 3000 then 1 else 0 end) as mid_price,
		sum(case when sale_price > 3000 then 1 else 0 end) as high_price
  from product;

-- ����
select p.product_name, low_price, mid_price, high_price
  from
  	product as p
 inner join (select product_name, case when sale_price <= 1000 then 1 else 0 end as low_price from product) as l
	on p.product_name = l.product_name
 inner join (select product_name, case when sale_price between 1001 and 3000 then 1 else 0 end as mid_price from product) as m
	on p.product_name = m.product_name
 inner join (select product_name, case when sale_price > 3000 then 1 else 0 end as high_price from product) as h
	on p.product_name = h.product_name;