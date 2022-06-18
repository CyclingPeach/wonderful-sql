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
 where (sale_price*0.9 - purchase_price) > 100;