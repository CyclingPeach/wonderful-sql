select * from product where sale_price < 1.3 * purchase_price
union all
select * from product where purchase_price is null;

select * from product where sale_price / purchase_price < 1.3 or sale_price / purchase_price is null;

select * from product;

select product_type, count(*) type_num from product group by product_type
union all
select product_type, count(*) type_num from product2 group by product_type;

SELECT product_id, product_name, '1'
  FROM Product
 UNION
SELECT product_id, product_name,sale_price
  FROM Product2;
  
 
select sysdate();

select sysdate(),sysdate(),sysdate()
union
select 'chars', 123, null;

SELECT product_id, product_name
  FROM Product
INTERSECT
SELECT product_id, product_name
  FROM Product2;
  
select p1.product_id, p1.product_name
  from product p1
 inner join product2 p2
    on p1.product_id = p2.product_id;

select product_id, product_name
  from product
 where product_id not in (select product_id 
 							from product2);
 							
 						
select *
  from product
 where sale_price > 2000 and sale_price >= 1.3 * purchase_price;
 
select *
  from product
 where product_id not in (select product_id 
 							from product 
 						   where sale_price <= 2000 or sale_price < 1.3 * purchase_price)
 		
select *
  from product
 where sale_price >= 2000
   and product_id not in (select product_id
   							from product
   						   where sale_price < 1.3 * purchase_price);
   						   
select * 
  from product
 where product_id not in (select product_id
 							from product2)
union
select *
  from product2
 where product_id not in (select product_id
 							from product);
 							
select s.shop_id, s.shop_name, s.product_id,
		p.product_name , p.product_type ,s.quantity 
  from product p 
 inner join shopproduct s
    on p.product_id = s.product_id;
    

   

select * from shopproduct as s
 inner join (
 	select product_id, product_name, product_type, purchase_price
 	  from product
 	 where product_type = '衣服') as p
    on s.product_id = p.product_id;
select *
  from shopproduct s
 inner join product p 
    on s.product_id = p.product_id
 where p.product_type = '衣服';
 

select * 
  from shopproduct s
 inner join product p
 	on s.product_id = p.product_id
 where s.shop_id = '000A' and p.sale_price < 2000;

select *
  from (select * from shopproduct where shop_id = '000A') s
 inner join (select * from product where sale_price < 2000) p
 	on s.product_id = p.product_id;



 
select s.shop_name, max(p.sale_price)
  from shopproduct s
 inner join product p
    on s.product_id = p.product_id
 group by s.shop_id, s.shop_name;

select product_type, product_name, sale_price
  from product p1
 where sale_price > (select avg(sale_price) from product p2 where p1.product_type = p2.product_type group by product_type);
 

select product_type, avg(sale_price) from product group by product_type;



select p1.product_id, p1.product_name, p1.product_type, p1.sale_price, p2.avg_price
  from product as p1
 inner join (select product_type, avg(sale_price) as avg_price
 			   from product
 			  group by product_type) as p2
    on p1.product_type = p2.product_type
 where p1.sale_price > p2.avg_price;

select * from product natural join shopproduct;

select * from product natural join product2;


select p1.*
  from product
 inner join product2
    on 

    
select s.shop_id, s.shop_name, s.product_id, p.product_name, p.sale_price
  from product p 
  left outer join shopproduct s
    on s.product_id = p.product_id;

select s.shop_id, s.shop_name, s.product_id, p.product_name, p.sale_price
  from product p 
 inner join shopproduct s
    on s.product_id = p.product_id;

select product_id, product_name, sale_price
  from product;

select p.product_id, p.product_name, p.sale_price, s.shop_id, s.shop_name, s.quantity
  from product p
  left outer join shopproduct s
    on p.product_id = s.product_id
 where s.quantity < 50;

select p.product_id, p.product_name, p.sale_price, s.shop_id, s.shop_name, s.quantity
  from product p
  left outer join (select * from shopproduct where quantity < 50) s
    on p.product_id = s.product_id;
   
   
select s.shop_id, s.shop_name, s.product_id, p.product_name, p.sale_price, i.inventory_quantity
  from shopproduct s 
 inner join product p
    on s.product_id = p.product_id
 inner join inventoryproduct i
    on s.product_id = i.product_id
 where i.inventory_id = 'P001';
 


-- 4.2.4.1 非等值自左连接（self join）

select p1.product_id, p1.product_name, p1.sale_price, p2.product_id as p2_id,
	   p2.product_name as p2_name, p2.sale_price as p2_price
  from product p1
  left outer join product p2
    on p1.sale_price <= p2.sale_price;


select product_id, product_name, sale_price, count(p2_id) as my_rank
  from (
		select p1.product_id, p1.product_name, p1.sale_price, p2.product_id as p2_id,
			   p2.product_name as p2_name, p2.sale_price as p2_price
		  from product p1
		  left outer join product p2
		    on p1.sale_price <= p2.sale_price
		) as x
 group by product_id, product_name, sale_price
 order by my_rank;




select product_id, product_name, sale_price, sum(p2_price) as cum_price
  from (
		select p1.product_id, p1.product_name, p1.sale_price, p2.product_id p2_id,
			   p2.product_name p2_name, p2.sale_price p2_price
		  from product p1
		  left outer join product p2
		    on p1.sale_price >= p2.sale_price
		 order by p1.sale_price) as x
  group by product_id, product_name, sale_price
  order by sale_price, product_id;


select * from product
 union all
select * from product2;


select *
  from product
 where sale_price > 2000
   and product_id not in (select product_id
   							from product
   						   where sale_price < 1.3 * purchase_price);
   					
select product_id, product_name, sale_price, (sale_price-purchase_price)/purchase_price as p
  from product;




SELECT * 
  FROM Product
 WHERE sale_price > 1.5 * purchase_price 
   AND sale_price < 1500;

  
select P1.*
  from (select *
		  from product
		 where sale_price > 1.5 * purchase_price) as P1
 inner join (select * 
			  from product
			 where sale_price < 1500) as P2
    on P1.product_id = P2.product_id;


select * from product
 union 
select * from product2;

select * 
  from product
 where product_id in (select product_id
 						from product2);


SELECT * FROM Product WHERE sale_price < 1000
 UNION ALL
SELECT * FROM Product WHERE sale_price < 1.5 * purchase_price;


select * from shopproduct natural join  product;


SELECT SP.shop_id
       ,SP.shop_name
       ,SP.product_id
       ,P.product_name
       ,P.sale_price
  FROM Product AS P
  LEFT OUTER JOIN ShopProduct AS SP
    ON SP.product_id = P.product_id;
    
SELECT SP.shop_id
       ,SP.shop_name
       ,SP.product_id
       ,P.product_name
       ,P.sale_price
  FROM Product AS P
 INNER JOIN ShopProduct AS SP
    ON SP.product_id = P.product_id;
    
   
   
-- 4.2.2.3
select p.product_id, p.product_name, p.sale_price, s.shop_id, s.shop_name, s.quantity
  from product as p
  left outer join shopproduct as s
    on p.product_id = s.product_id;
 where s.quantity < 50;
 
select p.product_id, p.product_name, p.sale_price, s.shop_id, s.shop_name, s.quantity
  from product as p
  left outer join (select * from shopproduct where quantity < 50) as s
    on p.product_id = s.product_id;
 
select * from shopproduct where quantity < 50;

SELECT  product_type
       ,regist_date
       ,SUM(sale_price) AS sum_price
  FROM product
 GROUP BY product_type, regist_date WITH ROLLUP;