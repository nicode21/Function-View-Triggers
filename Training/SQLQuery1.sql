create database CourseDb

use CourseDb


create table Customers (
	[Id] int primary key identity (1,1),
	[Name] nvarchar(50),
	[Age] int,
	[Address] nvarchar(50)
)

create table Employees (
	[Id] int primary key identity (1,1),
	[Name] nvarchar(50),
	[Age] int,
	[Address] nvarchar(50)
)

insert into Customers (Name, Age, Address)
values ('Anar',36,'Sumqayit'),
('Vuqar',38,'Xirdalan'),
('Cavid',29,'Ehmedli'),
('Lale',27,'Nesimi'),
('Ramil',26,'Azadliq'),
('Novreste',25,'Nesimi')

insert into Employees (Name, Age, Address)
values ('Musa',19,'Neftciler'),
('Nicat',21,'Xezer'),
('Mahir',21,'Sahil'),
('Lale',27,'Nesimi'),
('Ramil',26,'Azadliq'),
('Novreste',25,'Nesimi')

select * from Employees
union
select * from Customers


select * from Employees
union all
select * from Customers

select * from Employees
Except
Select * from Customers

select * from Employees
intersect
select * from Customers

select GetDate()

select * from Employees
order by [Age] desc

select * from Employees
order by [Name] desc

select * from Employees where id > 3
order by [Age] desc

select COUNT(*) as 'Count by age', Age from Employees where [Age] > 19
group by [Age]

select COUNT(*) as 'Count by age', Age from Employees where [Age] > 19
group by [Age]
having COUNT(*)>1
order by COUNT(*) desc


--create view vw_TeachersByAge
--as
--Select * from Teachers where Age > 30

--select * from Teachers

Create view vw_TeachersBySalaryMain7
AS
SELECT TOP 100 PERCENT
COUNT(*) as 'Count',Age
From Teachers
group by Age


select * from vw_TeachersBySalaryMain7 order by  Age


create view vw_getTeachersByName
as
select * from Teachers where [Name] like 'c%'

select * from vw_getTeachersByName



create function GetTeachersCount()
returns int
as
begin
  declare @age int
  select @age = Count(*) from Teachers
  return @age
end

select dbo.GetTeachersCount() --dbo mutleq yazilmalidir !

select * from Teachers


create function GetTeachersCountByAgeStatic()
returns int
as
begin
  declare @age int;
  declare @mainAge int = 30;
  select @age = Count(*) from Teachers where Age > @mainAge
  return @age
end

select dbo.getTeachersCountByAgeStatic()



create function GetTeachersCountByAge(@age int)
returns int
as
begin
  declare @count int;
  select @count = Count(*) from Teachers where Age > @age
  return @count
end

select dbo.GetTeachersCountByAge(10)


select * from Teachers


create function dbo.getTeachersAverageAgesByConditions(@id int)
returns float
as
Begin
declare @sum float = cast((SELECT sum(Age) from Teachers where Id > @id) as float)
declare @count float = cast((select count(Age) from Teachers where Id > @id) as float)
return @sum/@count
End

select dbo.getTeachersAverageAgesByConditions(4)


--create function dbo.getTeachersAverageSalaryByConditions(@id int)
--returns decimal
--as
--Begin
--declare @avg decimal;
--select @avg = AVG(salary) from Teachers where Id > @id;
--return @avg
--End

--select dbo.getTeachersAverageSalaryByConditions(4)


--create procedure usp_InsertTeacher
--@name nvarchar(50),
--@surname nvarchar(50),
--@age int,
--@email nvarchar(100),
--@salary decimal
--AS
--BEGIN
--insert into Teachers([Name],[Surname],[Age],[Email],[Salary])
--values(@name,@surname,@age,@email,@salary)
--END

--exec usp_InsertTeacher 'Novreste','Aslanzade',25,'novreste@code.edu.az',1500

--exec usp_InsertTeacher 'Ramil','Allahverdiyev',26,'Ramil@code.edu.az',1500

--create procedure usp_SumOfNums
--@num1 int,
--@num2 int
--as
--select @num1+@num2 

--exec usp_SumOfNums 5,7


create table TeacherLogs (
	[id] int primary key identity(1,1),
	[TeacherId] int,
	[Operation] nvarchar(50),
	[Date] datetime
)

create trigger trg_InsertTeacher on Teachers
for insert
as
Begin
	insert into TeacherLogs([TeacherId],[Operation],[Date])
	select Id,'Insert',GETDATE() from inserted
End

insert into Teachers([Name],[Surname],[Age],[Email],[Salary])
values ('Musa','Afandiyev',19,'musa@gmail.com',5555)


create trigger trg_deleteTeacher on Teachers
after delete
as
Begin
	insert into TeacherLogs([TeacherId],[Operation],[Date])
	select Id,'Delete',GETDATE() from deleted
End