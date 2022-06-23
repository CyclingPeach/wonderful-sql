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
 	 where product_type = 'ÒÂ·þ') as p
    on s.product_id = p.product_id;
select *
  from shopproduct s
 inner join product p 
    on s.product_id = p.product_id
 where p.product_type = 'ÒÂ·þ';
 

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


select *
  from product
 inner join product2
    on 


