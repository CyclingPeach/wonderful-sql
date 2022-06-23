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