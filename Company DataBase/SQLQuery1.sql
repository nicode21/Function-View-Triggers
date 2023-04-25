create database Company

use Company

create table Employees (
	[Id] int primary key identity(1,1),
	[Name] nvarchar(50),
	[Surname] nvarchar(50),
	[Age] int,
	[Salary] decimal,
	[Position] nvarchar(50),
	[IsDeleted] bit,
	CityId int Foreign Key (CityId) references Cities(Id)
)

create table Cities (
	[Id] int primary key identity(1,1),
	[Name] nvarchar(50),
	CountryId int Foreign Key (CountryId) references Countries(Id)
)

create table Countries (
	[Id] int primary key identity(1,1),
	[Name] nvarchar(50)
)


insert into Countries (Name)
values ('Azerbaycan'),('Turkiye'),('Fransa'),('Almanya'),('Iran')

insert into Cities (Name,CountryId)
values ('Baki',1),('Aghdam',1),('Istanbul',2),('Strasburg',3),('Paris',3),('Berlin',4),('Tehran',5)

insert into Employees ([Name], [Surname], [Age], [Salary], [Position], [IsDeleted], [Cityid])
values 
('Nicat', 'Novruzzade', 21, 1500, 'reception', 1, 2),
('Musa', 'Afandiyev', 19, 2500, 'project manager', 0, 3),
('Fatime', 'Bayramova', 20, 1200, 'reception', 0, 1),
('Murad', 'Jafarov', 19, 2000, 'project manager', 1, 4),
('Rasul', 'Hasanov', 16, 9000, 'HACKER', 0, 5),
('Cavid', 'Bashirov', 29, 3000, 'fullstack developer', 0, 6),
('Novreste', 'Aslanova', 25,2200, 'Junior front-end developer', 1, 7)


--Ishcilerin Ozleri ve yasadiqi yerler

Select E.Id, E.Name,Surname,Age,Salary,Position,IsDeleted, Co.Name as Country, C.Name as City from Employees E
Inner Join Cities C on E.CityId = C.Id
Inner join Countries Co on C.CountryId = Co.Id


--Maashi 2000 den yuxari olan ishcilerin ozleri ve yashadiqlari yerler

Select E.Id, E.Name,Surname,Age,Salary,Position,IsDeleted, Co.Name as Country, C.Name as City 
from Employees E 
Inner Join Cities C on E.CityId = C.Id
Inner join Countries Co on C.CountryId = Co.Id
where E.Salary > 2000


--Hansi Sheherin hansi Olkeye aid oldugu

Select Co.Name as Country, C.Name as City 
from Employees E 
Inner Join Cities C on E.CityId = C.Id
Inner join Countries Co on C.CountryId = Co.Id



--Positionu 'reception' olan ishcilerin butun melumatlarini gostermek

Select E.Id, E.Name,Surname,Age,Salary,Position,IsDeleted, Co.Name as Country, C.Name as City 
from Employees E 
Inner Join Cities C on E.CityId = C.Id
Inner join Countries Co on C.CountryId = Co.Id
where E.Position = 'reception'



--Ishden cixarilan ishcilerin melumatlari

Select E.Id, E.Name,Surname,Age,Salary,Position,IsDeleted, Co.Name as Country, C.Name as City 
from Employees E 
Inner Join Cities C on E.CityId = C.Id
Inner join Countries Co on C.CountryId = Co.Id
where E.IsDeleted = 'true'


