CREATE TABLE MEMBER11(
id varchar(30) primary key,
pw varchar(30),
name varchar(12),
email varchar(50),
job varchar(10),
hobby varchar(10),
zipcode char(5),
address char(50)
)engine=innodb charset=utf8;

select * from MEMBER11;

create table tblZipcode(
zipcode char(5) not null,
area1 char(10) default null,
area2 char(20) default null,
area3 char(30) default null
)engine=innodb charset=utf8;

select * from tblZipcode;

drop table zipcode;