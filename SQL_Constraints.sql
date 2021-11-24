use db2021;

create table first(Id int primary key identity,Fname varchar(100),Lname varchar(100));

insert into first values('harsh','khan'),('raj','kundra'),('arav','sharma')

select * from first

create table second(SID int foreign key references first(ID) identity,Sname nvarchar(100),gender varchar(100) )

insert into  second values('anand','Male'),('ravindra','Male'),('kajol','Female')

select * from second

Create table Third
	(
		TID int primary key identity,
		Name nvarchar(100) not null,
		city nvarchar(100) default 'pune',
		contact nvarchar(10) unique,
		age int check(age>=18),
		EID int foreign key references Third(TID) 
	)

	
	insert into Third values
	('raj','',6453745254,18,1)

	insert into Third values
	('arjun','',6453741254,18,1)

	select * from Third