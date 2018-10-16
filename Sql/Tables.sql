create Database TunYat_DB
use TunYat_DB

create Table tbl_Employee
(
	EmpolyeeID int identity(0,1) primary key not null,
	Name nvarchar(30) not null,
	NRC_No nvarchar(20) not null,
	Father_name nvarchar(30) not null,
	Entrance_date date not null,
	[Address] nvarchar(100) not null,
	Phone_no int ,
	Leave_date Date default('0-0-0'),
	PositionID int foreign key references tbl_EmployeePosition(positionID),
	Reamark nvarchar(150)
)

create table tbl_EmployeePosition
(
	PositionID int identity(0,1) not null primary key,
	PositionName nvarchar(20) not null
)


create table tbl_LoginPassword
(
	EID int foreign key references tbl_employee(EmpolyeeID),
	UserName char(20) not null,
	[Password] char(30) not null	
)

---------------------------------

create table tbl_Expense
(
	Exp_VouID  int identity(0,1) primary key not null,
	EmployeeID int  foreign key references tbl_Employee,
	[Subject] nvarchar (30),
	Location nvarchar (30),
	Vou_Date Datetime,
	Approved_By int foreign key references tbl_Employee,
	Submitted_By int Foreign key references tbl_employee,
	Reg_By int foreign Key references tbl_Employee,
	Cash_disburse decimal(7,0)
)

create table tbl_Expense_Detail
(
	Exp_VouID int foreign key references tbl_Expense,
	[No] int,
	[Date] Datetime,
	[Description] nvarchar(100),
	Amount decimal(7,0),
	Attach_Receipt char(1)
	constraint exp_detail_key primary key(Exp_VouID , [No])
	)

create table tbl_Customer
(
	CID int identity (0,1) not null primary key,
	Name nvarchar(30) not null,
	NRC nvarchar(25) not null,
	CompanyName nvarchar(25),
	[State] nvarchar(25),
	City nvarchar(25),
	Division nvarchar(30),
	Street nvarchar(200),
	Phone nvarchar(50),
	Reamark nvarchar(200)	
)


create table tbl_DailySaleRecord	
(
	vouID int  identity(0,1) not null primary key,
	Reg_eid int foreign key references tbl_Employee(EmployeeID),
	Location nvarchar(25),
	Machine nvarchar(25),
	Brand nvarchar(25),
	Supplier int,
	sr_operator int foreign key references tbl_Employee(EmployeeID),
	jur_operator int foreign key references tbl_Employee(EmployeeID),
	[Date] datetime,
	i1 int,
	n1 nvarchar(50)
)

create table tbl_DailyRecordDetail
(
	vouid int foreign key references tbl_DailySaleRecord(vouID),
	[no] int not null,
	Date datetime,
	Descr nvarchar(150),
	Acre decimal(10,2),
	Fuel decimal(10,2),
	implement nvarchar(30),
	un_start datetime,
	un_end datetime,
	pro_start datetime,
	pro_end datetime,
	Remark nvarchar(150),
	i1 int,
	n1 nvarchar(50)
	
)	
drop table tbl_calimstaff 
create table tbl_CalimStaff
(
RefNo nvarchar(25) not null  primary key,
CheckedBy int foreign key references tbl_Employee(EmployeeID),
ApprovedBy int foreign key references tbl_Employee(EmployeeID),
ReceivedBy int foreign key references tbl_Employee(EmployeeID),
SubmittedBy int foreign key references tbl_Employee(EmployeeID),
[Date] DateTime,
ProjectName nvarchar(50),
Regby int foreign key references tbl_Employee(EmployeeID),
i1 int,
n1 nvarchar(50)
)

create table tbl_ClimStaff_Detail
(
RefNo nvarchar(25) foreign key references tbl_CalimStaff(RefNo),
sub_no int,
Title nvarchar(50),
[Desc] nvarchar(100),
amount decimal (7,2),
Ex_Rate decimal(5,0),
i1 int,
n1 nvarchar(50)
)


create table tbl_saleContract
(
	id int identity(0,1) primary key not null,
	[Date] datetime ,
	username nvarchar(50),
	nrc nvarchar(25),
	village nvarchar(50),
	Acres nvarchar(25),
	FieldNo nvarchar(25),
	LegalNo nvarchar(25),
	Phone nvarchar(50),
	MachineType nvarchar(40),
	Duration DateTime,
	totalAmount decimal(8,0),
	Deposit decimal(8,0),
	DeadLineDate datetime,
	AgentEid int foreign key references tbl_Employee(EmployeeID),
	RegEid int foreign key references tbl_Employee(EmployeeID),
	WitnessName nvarchar(50),
	WitnessNRC nvarchar(25),
	WitnessAdd nvarchar(100),
	i1 int,
	n1 nvarchar(50)		
)

create table tbl_ProductList
(
ID int identity(1,1) not null primary key,
Name nvarchar(50),
Description nvarchar(100),
SID int foreign key references tbl_Supplier(ID),
Remark nvarchar(100),
i1 int,
n1 nvarchar(50)
)