-- 创建数据库
create database shop;

-- 商品表
create table product(
	product_id char(4) not null,
	product_name varchar(100) not null,
	product_type varchar(32) not null,
	sale_price integer,
	purchase_price integer,
	regist_date date,
	primary key(product_id)
);

-- 删除表
-- create table product;

-- 添加列字段
/*
 * ALTER TABLE <表名> ADD COLUMN <列的定义>;
 * */
-- 
alter table product add column product_name_pinyin varchar(100);

-- 删除列字段
alter table product drop column product_name_pinyin;

-- 清空表的内容
truncate table <表名>;

-- 更新
-- 修改所有商品的注册时间
update
	shop.product
set
	regist_date = '2009-10-10';

-- 仅修改部分商品的单价
update
	shop.product
set
	sale_price = sale_price * 10
where
	product_type = '厨房用具';
 
-- (清空)将商品编号为0008的数据的登记日期更新为NULL
update
	shop.product
set
	regist_date = null
where
	product_id = '0008';
 

-- 多列更新
update
	shop.product
set
	purchase_price = purchase_price / 2,
	sale_price = sale_price * 10
where
	product_type = '厨房用具';
 

-- INSERT练习
create table productins(
	product_id		CHAR(4)		not null,
	product_name	VARCHAR(100)	not null,
	product_type	VARCHAR(32)		not null,
	sale_price		INTEGER			default 0,
	purchase_price	INTEGER,
	regist_date		DATE,
	primary key (product_id)
);

-- INSERT 语法
insert into <表名> (<列名1>,<列名2>,...) values (值1, 值2, ...);

insert
	into
	productins
values ('0005',
'高压锅',
'厨房用具',
6800,
5000,
'2009-01-15');

INSERT INTO productins VALUES ('0002', '打孔器', '办公用品', 500, 320, '2009-09-11'),
                              ('0003', '运动T恤', '衣服', 4000, 2800, NULL),
                              ('0004', '菜刀', '厨房用具', 3000, 2800, '2009-09-20');


INSERT INTO productins (product_id, product_name, product_type, sale_price, purchase_price, regist_date) VALUES ('0006', '叉子', '厨房用具', 500, NULL, '2009-09-20');


-- 建表时设置默认值


-- 
INSERT INTO shop.product VALUES('0001', 'T恤衫', '衣服', 1000, 500, '2009-09-20');
INSERT INTO shop.product VALUES('0002', '打孔器', '办公用品', 500, 320, '2009-09-11');
INSERT INTO shop.product VALUES('0003', '运动T恤', '衣服', 4000, 2800, NULL);
INSERT INTO shop.product VALUES('0004', '菜刀', '厨房用具', 3000, 2800, '2009-09-20');
INSERT INTO shop.product VALUES('0005', '高压锅', '厨房用具', 6800, 5000, '2009-01-15');
INSERT INTO shop.product VALUES('0006', '叉子', '厨房用具', 500, NULL, '2009-09-20');
INSERT INTO shop.product VALUES('0007', '擦菜板', '厨房用具', 880, 790, '2008-04-28');
INSERT INTO shop.product VALUES('0008', '圆珠笔', '办公用品', 100, NULL, '2009-11-11');
