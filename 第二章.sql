-- 2.1.3
select	product_id		as id,
		product_name	as name,
		purchase_price	as "进货单价"
  from	shop.product;

select distinct product_type
  from shop.product;


-- 2.2.2
 select *
   from shop.product
  where sale_price = 500;

--  2.2.3
select product_name,
	   sale_price,
	   sale_price * 2 as "sale_price x2"
  from shop.product p;

select *
  from shop.product p 
 where sale_price - purchase_price >= 500;
 

create table chars(
	chr char(3) not null,
	primary key (chr)
);


select *
  from shop.chars c 
 where chr > '2';

select product_name, purchase_price
  from shop.product p 
 where purchase_price is not null;


-- 2.3 逻辑运算符
select product_name, product_type, sale_price
  from shop.product p 
 where not sale_price >= 1000;

-- 2.3.2
select *
  from shop.product p 
 where product_type = "厨房用具" and sale_price >= 3000;

select product_name, product_type, sale_price
  from shop.product p 
 where product_type = "厨房用具" or sale_price >= 3000;

select product_name 
  from shop.product p 
 where product_type = "办公用品" 
   and (regist_date = '2009-9-11' 
       or regist_date = '2009-10-10');
       
      

  
  
  
-- 练习题

-- 2.1
select product_name, regist_date
  from shop.product p 
 where regist_date >= '2009-4-28';
-- 不确定对不对

-- 2.2
-- (1).查询购买价格为空的商品信息
-- (2).查询购买价格不为空的商品信息
-- (3).【不知道】

-- 2.3
select product_name, sale_price, purchase_price
  from shop.product p 
 where purchase_price - sale_price <= 500;
select product_name, sale_price, purchase_price
  from shop.product p 
 where (product_name = 'T恤' and sale_price = 1000 and purchase_price = 500)
 	or (product_name = '运动T恤' and sale_price = 4000 and purchase_price = 2800)
 	or (product_name = '高压锅' and sale_price = 6800 and purchase_price = 5000);

-- 2.4
select product_name, product_type, sale_price, sale_price*0.9, purchase_price, (sale_price*0.9 - purchase_price) as profit 
  from shop.product p 
 where sale_price*0.9 - purchase_price > 100
   and (product_type = '办公用品' or product_type = '厨房用具');
   
  
-- 2.4.1
select count(*)
  from shop.product;
  
select count(purchase_price)
  from shop.product p;
 
select sum(p.sale_price) as sum_s, sum(p.purchase_price)
  from shop.product p;
 
select avg(sale_price) as avg_s, avg(purchase_price) as avg_p
  from shop.product;

select max(regist_date), min(regist_date)
  from shop.product;

select count(distinct(product_type))
  from shop.product;

select sum(sale_price), sum(distinct sale_price)
  from shop.product;

select sale_price
  from shop.product;

select distinct sale_price
  from shop.product;

 
-- 2.5
select product_type, count(*) as num
  from shop.product
 group by product_type;
select product_type, count(*)
  from shop.product;

select purchase_price, count(*)
  from shop.product
 group by purchase_price;


select product_type , count(*)
  from shop.product
 group by product_type
having count(*) = 2;

-- ORDER BY
select product_id , product_name , sale_price , purchase_price
  from shop.product
 order by sale_price product_id;

select *
  from shop.product
 order by purchase_price desc;
 

select product_type , count(*) as num
  from shop.product
 group by product_type
 order by num desc;
 

-- 2.7.3
create table user (
	id int not null auto_increment,
	name varchar(5),
	date_login date,
	primary key (id)
);

select *
  from shop.`user`
 order by -date_login desc;
 
select * from shop.`user`
 order by name is null, name desc;
select * from shop.`user`
 order by isnull(name), name asc;
 
select * from shop.`user`
 order by coalesce(name, 'zzzzz') desc;