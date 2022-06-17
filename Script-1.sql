-- �������ݿ�
create database shop;

-- ��Ʒ��
create table product(
	product_id char(4) not null,
	product_name varchar(100) not null,
	product_type varchar(32) not null,
	sale_price integer,
	purchase_price integer,
	regist_date date,
	primary key(product_id)
);

-- ɾ����
-- create table product;

-- ������ֶ�
/*
 * ALTER TABLE <����> ADD COLUMN <�еĶ���>;
 * */
-- 
alter table product add column product_name_pinyin varchar(100);

-- ɾ�����ֶ�
alter table product drop column product_name_pinyin;

-- ��ձ������
truncate table <����>;

-- ����
-- �޸�������Ʒ��ע��ʱ��
update
	shop.product
set
	regist_date = '2009-10-10';

-- ���޸Ĳ�����Ʒ�ĵ���
update
	shop.product
set
	sale_price = sale_price * 10
where
	product_type = '�����þ�';
 
-- (���)����Ʒ���Ϊ0008�����ݵĵǼ����ڸ���ΪNULL
update
	shop.product
set
	regist_date = null
where
	product_id = '0008';
 

-- ���и���
update
	shop.product
set
	purchase_price = purchase_price / 2,
	sale_price = sale_price * 10
where
	product_type = '�����þ�';
 

-- INSERT��ϰ
create table productins(
	product_id		CHAR(4)		not null,
	product_name	VARCHAR(100)	not null,
	product_type	VARCHAR(32)		not null,
	sale_price		INTEGER			default 0,
	purchase_price	INTEGER,
	regist_date		DATE,
	primary key (product_id)
);

-- INSERT �﷨
insert into <����> (<����1>,<����2>,...) values (ֵ1, ֵ2, ...);

insert
	into
	productins
values ('0005',
'��ѹ��',
'�����þ�',
6800,
5000,
'2009-01-15');

INSERT INTO productins VALUES ('0002', '�����', '�칫��Ʒ', 500, 320, '2009-09-11'),
                              ('0003', '�˶�T��', '�·�', 4000, 2800, NULL),
                              ('0004', '�˵�', '�����þ�', 3000, 2800, '2009-09-20');


INSERT INTO productins (product_id, product_name, product_type, sale_price, purchase_price, regist_date) VALUES ('0006', '����', '�����þ�', 500, NULL, '2009-09-20');


-- ����ʱ����Ĭ��ֵ


-- 
INSERT INTO shop.product VALUES('0001', 'T����', '�·�', 1000, 500, '2009-09-20');
INSERT INTO shop.product VALUES('0002', '�����', '�칫��Ʒ', 500, 320, '2009-09-11');
INSERT INTO shop.product VALUES('0003', '�˶�T��', '�·�', 4000, 2800, NULL);
INSERT INTO shop.product VALUES('0004', '�˵�', '�����þ�', 3000, 2800, '2009-09-20');
INSERT INTO shop.product VALUES('0005', '��ѹ��', '�����þ�', 6800, 5000, '2009-01-15');
INSERT INTO shop.product VALUES('0006', '����', '�����þ�', 500, NULL, '2009-09-20');
INSERT INTO shop.product VALUES('0007', '���˰�', '�����þ�', 880, 790, '2008-04-28');
INSERT INTO shop.product VALUES('0008', 'Բ���', '�칫��Ʒ', 100, NULL, '2009-11-11');
