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