create database OBTRS_DB

use OBTRS_DB

1.[tbl_AccountManagerment]
AccountManagermentID
Username
Password
Type (Admin va Employee)

create table tbl_AccountManagerment
(
	AccountManagermentID int primary key identity,
	Username nvarchar(100),
	Password nvarchar(100),
	[Type] nvarchar(20)
)

create table tbl_Employee
(
	EmployeeID int primary key identity,
AccountManagermentID int references[tbl_AccountManagerment](AccountManagermentID),
FirstName nvarchar(100),
LastName nvarchar(100),
Qualification nvarchar(100),
Contact nvarchar(100),
Gender nvarchar(100),
Birthday nvarchar(100),
Address nvarchar(100),
IDNumber nvarchar(100),
PhoneNumber nvarchar(100),
Email nvarchar(100)
)


create table tbl_AccountCustomer
(
AccountCustomerID int identity(1,1) primary key,
Username nvarchar(100),
Password nvarchar(100),
FirstName nvarchar(100),
LastName nvarchar(100),
Gender nvarchar(100),
Birthday nvarchar(100),
Address nvarchar(100),
Job nvarchar(100), 
IDNumber nvarchar(100), 
PhoneNumber nvarchar(100), 
Email nvarchar(100)

)

create table tbl_BusType
(
	BusTypeID int primary key identity,
	TypeName nvarchar(100),
	Consume nvarchar(100),
	SeatCount nvarchar(100)
)

create table tbl_Buses
(
	BusID int identity(1,1) primary key,
	BusTypeID int references[tbl_BusType](BusTypeID),
	BusNumber nvarchar(100),
	Seats XML,
	Status nvarchar(100)
)

create table tbl_Route
(
	RouteDetailID int identity(1,1) primary key,
	BusTypeID int references[tbl_BusType](BusTypeID),
	RouteName nvarchar(100),
	StartPlace nvarchar(100),
	EndPlace nvarchar(100),
	Distance nvarchar(100),
	Cost nvarchar(100),
	StartTime nvarchar(100),
	LongTime nvarchar(100),
	WeekDay nvarchar(100)
)

create table tbl_RouteLinkBuses
(
	BusID int references[tbl_Buses](BusID) not null,
	RouteDetailID int references[tbl_Route](RouteDetailID) not null,
)

alter table tbl_RouteLinkBuses
add constraint  P_Key  primary key (BusID,RouteDetailID)

create table tbl_TicketType
(	
	TicketTypeID int identity(1,1) primary key,
	Discription nvarchar(100),
	Discount nvarchar(100)
)

create table [tbl_TicketStatus]
(
	TickerStatusID int identity(1,1) primary key,
	Status nvarchar(100),
	Debit nvarchar(100)
)

create table [tbl_Ticket]
(
	TicketID int identity(1,1) primary key,
	RouteID int references[tbl_Route](RouteDetailID),
	AccountCustomerID int references[tbl_AccountCustomer](AccountCustomerID),
	TicketTypeID int references[tbl_TicketType](TicketTypeID),
	SeatNumber nvarchar(100),
	TickerStatusID  int references[tbl_TicketStatus](TickerStatusID)
)



