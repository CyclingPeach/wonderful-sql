create table employee (
	id char(1),
	name varchar(10),
	salary int(5),
	departmentid char(1)
);
insert into employee values ('1', 'Joe', 70000, '1');
insert into employee values ('2', 'Henry', 80000, '2');
insert into employee values ('3', 'Sam', 60000, '2');
insert into employee values ('4', 'Max', 90000, '1');
select * from employee;

create table department (
	id char(1),
	name varchar(10)
);
insert into department values ('1', 'IT');
insert into department values ('2', 'Sales');
select * from department;

-- 练习一:内联结方法
select d.name, e.max_salary
  from department as d
 inner join (select departmentid, max(salary) as max_salary
			   from employee
			  group by departmentid) as e
    on d.id = e.departmentid;

select d.name, max(salary)
  from employee as e
 inner join department as d
    on e.departmentid = d.id
 group by d.name;
   

-- 练习二
create table seat (
	id char(1),
	student varchar(10)
);
insert into seat values ('1', 'Abbot');
insert into seat values ('2', 'Doris');
insert into seat values ('3', 'Emerson');
insert into seat values ('4', 'Green');
insert into seat values ('5', 'Jeames');
select * from seat;




-- 练习三

四种方法






-- 练习四
