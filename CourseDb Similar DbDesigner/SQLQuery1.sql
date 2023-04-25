create database CourseDb

use CourseDb

create table Countries (
	[Id] int primary key identity(1,1),
	[Name] nvarchar (50)
)

create table Cities (
	[Id] int primary key identity(1,1),
	[Name] nvarchar (50),
	[CountryId] int FOREIGN KEY (CountryId) REFERENCES Countries(Id)
)

create table StaffMembers (
	[Id] int primary key identity(1,1),
	[FullName] nvarchar (50),
	[Email] nvarchar (100),
	[Address] nvarchar (100),
	[CityId] int FOREIGN KEY (CityId) REFERENCES Cities(Id)
)

create table MembersRoles (
	[Id] int primary key identity(1,1),
	[StaffMembersId] int FOREIGN KEY ([StaffMembersId]) REFERENCES StaffMembers(Id),
	[RolesId] int FOREIGN KEY (RolesId) REFERENCES Roles(Id)
)

create table Roles (
	[Id] int primary key identity(1,1),
	[Name] nvarchar(50)
)

create table Students (
	[Id] int primary key identity(1,1),
	[FullName] nvarchar (100),
	[Email] nvarchar (100),
	[Age] int,
	[Address] nvarchar (100),
	[Phone] nvarchar(50),
	[CityId] int FOREIGN KEY (CityId) REFERENCES Cities(Id)
)

create table Teachers (
	[Id] int primary key identity(1,1),
	[Name] nvarchar(100),
	[Surname] nvarchar(100),
	[Age] int,
	[Email] nvarchar(100),
	[Salary] decimal,
	[CityId] int Foreign Key (CityId) References Cities(Id)
)

Create table Educations(
	[Id] int primary key identity(1,1),
	[Name] nvarchar(100)
)

Create table Rooms (
	[Id] int primary key identity(1,1),
	[Name] nvarchar(100),
	[Capacity] int
)

Create table Groups (
	[Id] int primary key identity(1,1),
	[Name] nvarchar(100),
	[Capacity] int,
	RoomId int Foreign key(RoomId) references Rooms(Id),
	EducationsId int Foreign key(EducationsId) references Educations(Id)
)

create table TeacherGroup (
	[Id] int primary key identity(1,1),
	[TeachersId] int Foreign key(TeachersId) references Teachers(Id),
	[GroupsId] int Foreign key (GroupsId) references Groups(Id)
)

create table Seanses (
	[Id] int primary key identity(1,1),
	[Name] nvarchar(50)
)

create table WeekDays (
	[Id] int primary key identity(1,1),
	[Day] nvarchar(50)
)

create table WeekDaySeans (
	[Id] int primary key identity(1,1),
	[WeekDaysId] int foreign key (WeekDaysId) references WeekDays(Id),
	[SeansesId] int foreign key (SeansesId) references Seanses(Id)
)

create table GroupWeekDaySeanses (
	[Id] int primary key identity (1,1),
	[GroupId] int foreign key (GroupId) references Groups(Id),
	[WeekDaySeansId] int foreign key (WeekDaySeansId) references WeekDaySeans(Id)
)

create table StudentsGroups (
	[Id] int primary key identity(1,1),
	[GroupId] int foreign key (GroupId) references Groups(Id),
	[StudentId] int foreign key (StudentId) references Students(Id)
)