create database Course

use Course

create table Students (
	[Id] int primary key identity(1,1),
	[Name] nvarchar(50),
	[Surname] nvarchar(50),
	[Age] int,
	[Email] nvarchar(100),
	[Address] nvarchar(100)
)


insert into Students ([Name],[Surname],[Age],[Email],[Address])
values ('Nicat','Novruzzade',21,'nicat@gmail.com','Xezer'),
       ('Musa','Afandiyev',19,'musa@code.edu.az','Neftchiler'),
	   ('Murad','Ceferov',19,'murad@gmail.com','NZS'),
	   ('Fatime','Bayramova',20,'fatime@gmail.com','Nəsimi Bazarı'),
	   ('Novreste','Aslanzade',25,'aslanzade@gmail.com','Nesimi')



CREATE PROCEDURE usp_deleteStudent
@id int
as
Begin
Delete from Students where Id = @id
End

exec usp_deleteStudent 3

create table StudentArchives (
	[Id] int primary key identity(1,1),
	[StudentId] int,
	[Operation] nvarchar (50),
	[Date] datetime
)



create trigger deletedStudents on Students
after delete
as
BEGIN
Insert into StudentArchives (StudentId,Operation,Date)
Select Id,'Delete',GetDate() from deleted
END


