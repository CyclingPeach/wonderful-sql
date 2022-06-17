-- 1.1

create table addressboot (
	regist_no integer not null,
	name varchar(128) not null,
	address varchar(256) not null,
	tel_no char(10),
	mail_address char(20),
	primary key (regist_no)
);



-- 1.2
alter table addressboot add column postal_code char(8) not null;




-- 1.3 删除 Addressbook 表

drop table addressboot;	-- 是 drop 还是 delete




-- 1.4 判断题
-- 否