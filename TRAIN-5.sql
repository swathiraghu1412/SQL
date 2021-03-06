create database testDB;
DROP database testDB;

use testDB;


create table User
( id INT NOT NULL, 
name VARCHAR(100) NOT NULL, 
email VARCHAR(40) NOT NULL, 
DOB DATE, PRIMARY KEY ( id ) ) ;

select * from user;

desc user;



create table employeed
( empid int not null auto_increment,
firstname char(100) not null,
lastname char(100) not null,
emailid char(40) not null,
salary float not null,
dateofjoining datetime not null,
primary key (empid)) ;


select * from employeed;

INSERT INTO EMPLOYEEd(firstname,lastname,emailid,salary,dateofjoining) VALUES 
('Raghu','Thota','raghu.muthyam@gmail.com',4000.45,'2020-03-15 08:20:20');

INSERT INTO EMPLOYEEd(firstname,lastname,emailid,salary,dateofjoining) VALUES 
('raghu','thtoa','swathi.muthyam@gmail.com',4000.45,'2020-03-15 08:20:20');

CREATE TABLE Orders (
    OrderID int NOT NULL,
    OrderNumber int NOT NULL,
    PersonID int,
    PRIMARY KEY (OrderID),
    FOREIGN KEY (PersonID) REFERENCES Persons(PersonID)
);

CREATE TABLE ADDRESS (
addressId int not null auto_increment,
empId int not null,
aptNum varchar(10),
streetName varChar(20),
city varchar(20),
state varChar(4),
zip int,
country varchar(10),
primary key (addressId),
 FOREIGN KEY (empId) REFERENCES employeed(empid)
);

select * from address;

desc  address;

insert into address(empId,aptNum,streetName,city,state,zip,country) values
(2,201,'sullivan','bentonville','AR',72712,'US');

select * from address;

insert into address(empId,aptNum,streetName,city,state,zip,country) values
(1,201,'overland park','kansas','MI',60213,'US');

describe  address;

select* from employeed;
select E.empid, E.firstname, E.lastname from employeed as E
where E.empid=1;


select A.addressid, A.empid, A.streetname, A.city, A.state from address as A
where A.empid=1;



select E.empid as EEMPID, E.firstname, E.lastname,  CONCAT(A.streetname,', ',A.city,', ',A.state) AS ADRESS 
from employeed as E, 
address as A
where E.empid=A.empid;


select A.addressid, A.empid, A.streetname, A.city, A.state from address as A
where A.empid=1;

create table phone(
phoneid int not null auto_increment,
addressid int not null,
cellphone int not null,
homephone int ,
business int ,
primary key (phoneid), 
Foreign key (addressid) References address (addressid));

select * from phone;

insert into phone(addressid, cellphone, homephone, business)
values(2, 3456457642, 9887778902, 3265473448);

ALTER TABLE phone
MODIFY COLUMN cellphone BIGINT;

ALTER TABLE phone
MODIFY COLUMN business BIGINT;
select* from phone;

select E.EMPID, E.firstname, E.lastname, A.streetname, A.city, A.state, P.Phoneid, P.addressid, P.cellphone 
From phone as P 
full outer join address as A
on A.addressid = P.addressid
full outer join employeed as E
on E.empid=A.empid;

select A.streetname, A.city, A.state, P.Phoneid, P.addressid, P.cellphone 
From phone as P 
join address as A
on A.addressid = P.addressid;


select A.streetname, A.city, A.state, P.Phoneid, P.addressid, P.cellphone 
From phone as P 
left join address as A
on A.addressid = P.addressid;

select A.streetname, A.city, A.state, P.Phoneid, P.addressid, P.cellphone 
From phone as P 
right join address as A
on A.addressid = P.addressid;



USE QUIKRAMP;
SELECT * FROM ADDRESS;
SELECT * FROM PHONE;
SELECT * FROM PRODUCTS;
SELECT * FROM USER;

select CONCAT(U.firstname, ' ', U.lastname, ',', U.emailid) as name, CONCAT(A.Street, ',', A.Apt, ',', A.City, ',', A.State) as address, concat(P.Name, ',', P.Category, ',', P.Description) as products, Ph.Cell
from user as U
join address as A
on U.userid = A.userid and U.userid=1
join products as P
on A.addressid = P.addressid
join phone as Ph
on P.productid = Ph.productid;

ALTER TABLE products
  ADD Price INT not null;
  
 UPDATE products SET Price =200
WHERE productid = 1 ;
 UPDATE products SET Price =650
WHERE productid = 2;
 UPDATE products SET Price =999
WHERE productid = 3;
 UPDATE products SET Price =500
WHERE productid = 4;
 UPDATE products SET Price =3000
WHERE productid = 5;
 UPDATE products SET Price =400
WHERE productid = 6;
 UPDATE products SET Price =4700
WHERE productid = 7;
 UPDATE products SET Price =1000
WHERE productid = 8 ;
 UPDATE products SET Price =800
WHERE productid = 9;
 UPDATE products SET Price =499
WHERE productid = 10;

DELETE from products WHERE productid > 10;

SELECT SUM(Price)
FROM products
WHERE Category= 'Appliances';

SELECT SUM(Price)
FROM products
WHERE Category= 'electronics';

SELECT SUM(Price)
FROM products
WHERE Category= 'clothing';