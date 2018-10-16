create procedure pro_Position_insert
@name nvarchar(20)
as
insert into tbl_EmployeePosition values(@name)



create procedure pro_Position_selectAll
as
select * from tbl_EmployeePosition

create procedure pro_Position_update
@id int,
@name nvarchar(20)
as
update tbl_employeeposition set PositionName=@name  where PositionID=@id 


create procedure pro_Position_selectByName
@name nvarchar(20)
as
select PositionName from tbl_EmployeePosition where PositionName = @name

create procedure pro_Position_getName
@id int
as
select PositionName from tbl_EmployeePosition where PositionID = @id 


-----------------------------------------------
create procedure pro_Employee_Insert
    @Name nvarchar(30) ,
	@NRC_No nvarchar(20),
	@Father_name nvarchar(30) ,
	@Entrance_date date ,
	@Address nvarchar(100) ,
	@Phone_no int ,
	@Leave_date Date ,
	@PositionID int ,
	@Remark nvarchar(150)
	as
	insert into tbl_employee values(@name,@NRC_No,@father_name,@Entrance_date,@Address,@Phone_no,@Leave_date,@positionID,@Remark)

create procedure pro_Employee_update
	@EID INT,
    @Name nvarchar(30) ,
	@NRC_No nvarchar(20),
	@Father_name nvarchar(30) ,
	@Entrance_date date ,
	@Address nvarchar(100) ,
	@Phone_no int ,
	@Leave_date Date ,
	@PositionID int ,
	@Remark nvarchar(150)
	as
	UPDATE  tbl_employee SET NAME=@Name,NRC_NO=@NRC_No,FATHER_NAME=@Father_name,ENTRANCE_DATE=@Entrance_date,[ADDRESS]=@Address,
	PHONE_NO=@Phone_no,LEAVE_DATE=@Leave_date,POSITIONID=@positionID,REAMARK=@Remark WHERE EmployeeID =@EID

CREATE PROCEDURE pro_Employee_selectAll
as
Select * from tbl_employee

create procedure pro_employee_selectByName
@id int
as
select * from tbl_Employee where employeeID = @id 

create procedure pro_employee_getIDFromNRC
@NRC nvarchar(20)
AS
SELECT Employeeid  FROM tbl_Employee WHERE NRC_No =@NRC

create procedure pro_ConvertEmpIDtoName
@id int
as
Select Name from tbl_Employee where EmployeeID =@id 
------------------------------------------------------------------------------------------------------

create procedure pro_password_create 
@eid int,
@nrc nvarchar(20),
@username char(20),
@password nvarchar(100)
as
Declare @ddd varbinary(100),
		@input nvarchar(100)
set @input =@password
set @ddd=CONVERT(varbinary(100),@input)

insert into tbl_loginPassword values (@eid,@nrc,@username ,HASHBYTES('SHA1',@ddd  ))


drop procedure pro_password_update 
create procedure pro_password_update
@eid int,
@nrc nvarchar(20),
@username char(20),
@password nvarchar(100)
as
Declare @ddd varbinary(100),
		@input nvarchar(100)
set @input =@password
set @ddd=CONVERT(varbinary(100),@input)
update tbl_loginpassword set Password = hashbytes('SHA1',@ddd)  where EID=@eid 


create procedure pro_password_selectall
as
select * from tbl_LoginPassword 


create procedure pro_password_selectbyName
@eid int
as
select * from tbl_LoginPassword where EID = @eid 

create procedure pro_password_getUsername
@nrc nvarchar(20)
as
select username from tbl_LoginPassword where NRC_no = @nrc 


create procedure pro_password_getNRC
@nrc nvarchar(20)
as
select NRC_no  from tbl_LoginPassword where NRC_no = @nrc 

----------------------------------------------------------Expense--

Create procedure pro_EXP_Insert
	@EmpID int,
	@position int,
	@sub nvarchar(30),
	@location nvarchar(30),
	@vou_Date datetime,
	@cashDisburse decimal(7,0),
	@Approved int,
	@Submitted int,
	@Reg int
	as
	Insert into tbl_Expense(EmployeeID,Subject,Location,Vou_Date,Cash_disburse,Approved_By,Submitted_By,Reg_By,Position) values(@EmpID,@sub,@location,@vou_Date,@cashDisburse,@Approved,@Submitted,@Reg,@position)


create procedure pro_EXP_Update
@Exp_VouID int,
@position int,
@EmpID int,
@sub nvarchar(30),
@location nvarchar(30),
@vou_Date datetime,
@cashdisburse decimal(7,0),
@Approved int,
@Submitted int,
@Reg int
as
Update tbl_expense set EmployeeID = @EmpID ,Subject=@sub,Location = @location,Vou_Date =@vou_Date,Approved_By=@Approved,Submitted_By=@sub,Reg_By=@Reg,Cash_disburse=@cashdisburse ,Position = @position  where Exp_vouID =@Exp_VouID 

create procedure pro_Exp_selectAll
as
select * from tbl_expense 

create procedure pro_Exp_SelectByVouID
@vouid int
as
Select * from tbl_Expense  where Exp_VouID = @vouid 

----------------------------exp_detail--------------
create procedure pro_expDetail_insert
@Exp_VouID int,
@No int,
@Date Datetime,
@Description nvarchar(100),
@Amount decimal(7,0),
@Attach_Receipt char(1)
as
insert into tbl_Expense_Detail values(@Exp_VouID,@No,@Date,@Description,@Amount,@Attach_Receipt )


create procedure pro_expDetail_Update
@Exp_VouID int,
@Position int,
@No int,
@Date Datetime,
@Description nvarchar(100),
@Amount decimal(7,0),
@Attach_Receipt char(1)
as
update tbl_expense_detail set Date=@Date,Description=@description,Amount=@Amount,Attach_Receipt=@attach_Receipt  where Exp_VouID=@Exp_VouID and No=@no

create procedure pro_expDetail_selectall
as
select * from tbl_expense_detail 

create procedure pro_expDetail_SearchByVouID
@vouid int
as
Select * from tbl_expense_detail where exp_vouid = @vouid 

create procedure pro_exp_getVouID
@eid int,
@date datetime	,
@cash decimal
as
select Exp_VouID from tbl_Expense where EmployeeID = @eid and Vou_Date = @date and Cash_disburse=@cash 

-----------------------------------customer---

create procedure pro_customer_insert
@Name nvarchar(30),
@NRC nvarchar(25),
@CompanyName nvarchar(25),
@State nvarchar(25),
@City nvarchar(25),
@photo nvarchar(30),
@Street nvarchar(200),
@Phone nvarchar(50),
@Remark nvarchar(200),
@Reg_Date datetime 
as
insert into tbl_customer values(@Name,@NRC,@CompanyName,@State,@City,@photo,@Street,@Phone,@Remark,@Reg_Date)


create procedure pro_customer_update
@id int,
@Name nvarchar(30),
@NRC nvarchar(25),
@CompanyName nvarchar(25),
@State nvarchar(25),
@City nvarchar(25),
@photo nvarchar(150),
@Street nvarchar(200),
@Phone nvarchar(50),
@Remark nvarchar(200),
@Reg_Date datetime as
Update tbl_customer set Name = @Name,NRC =@NRC,CompanyName=@CompanyName ,[State]=@State,City=@City,Photo =@photo,Street = @Street,Phone=@Phone,Remark =@Remark,Reg_Date =@Reg_Date 
where CID = @id 

create procedure pro_Cus_selectall
as
select * from tbl_Customer

create procedure pro_Cus_SelectByID
@id int
as
Select * from tbl_Customer where CId =@id 

create procedure pro_customer_getID
@name nvarchar(30),
@nrc nvarchar(25)
as
Select CID from tbl_Customer where Name =@name and NRC = @nrc 

----------------------------------------------------------------------

create procedure pro_DetailDailySale_insert
@vouid Int,
@no int,
@date datetime,
@descr nvarchar(150),
@acre decimal(10,2),
@fuel decimal(10,2),
@implement nvarchar(30),
@un_start datetime,
@un_end datetime,
@pro_start datetime,
@pro_end datetime,
@Remark nvarchar(15)
as
Insert into tbl_DailySaleRecordDetail values (@vouid,@no,@date,@descr,@acre,@fuel,@implement,@un_start,@un_end,@pro_start,@pro_end,@Remark,0,'')

--------------------------------------------------
create procedure pro_DetailDailySale_update
@vouid Int,
@no int,
@date datetime,
@descr nvarchar(150),
@acre decimal(10,2),
@fuel decimal(10,2),
@implement nvarchar(30),
@un_start datetime,
@un_end datetime,
@pro_start datetime,
@pro_end datetime,
@Remark nvarchar(15)
as
update tbl_DailySaleRecordDetail set Date=@date,Descr=@descr,Acre=@acre,Fuel=@fuel,implement=@implement,un_start=@un_start,un_end=@un_end,@pro_start=pro_start,pro_end =@pro_end,remark = @Remark  where vouid =@vouid and no = @no 
--------------------------------------------------------------

create procedure pro_DetailDailySale_SelectAll
as
select * from tbl_dailySaleRecordDetail

create procedure pro_DailySale_Insert
@eid int,
@loc nvarchar(25),
@machine nvarchar(25),
@Brand nvarchar(25),
@supplier int,
@sr  int,
@jur int,
@date datetime
as
insert into tbl_dailySaleRecord values(@eid,@loc,@machine,@Brand,@supplier,@sr,@jur,@date,0,'')


create procedure pro_DailySale_Update
@vouid int,
@eid int,
@loc nvarchar(25),
@machine nvarchar(25),
@Brand nvarchar(25),
@supplier int,
@sr  int,
@jur int,
@date datetime
as
update  tbl_dailySaleRecord set REg_eid=@eid,Location=@loc,Machine=@machine,Brand=@Brand,Supplier=@supplier,sr_operator=@sr,jur_operator=@jur,Date=@date where vouid = @vouid 


create procedure pro_dailySale_selectAll
as
select * from tbl_dailySaleRecord 

create procedure pro_DailySale_getVouID
@datetime datetime
as
Select vouID from tbl_DailySaleRecord where Date = @datetime 

create procedure pro_CS_insert
@refno nvarchar(25),
@checked int,
@approved int,
@received int,
@submitted int,
@date datetime,
@project nvarchar(50),
@regby int
as
insert into tbl_CalimStaff values(@refno,@checked,@approved,@received,@submitted,@date,@project,@regby,1,'')

create procedure pro_CS_update
@refno nvarchar(25),
@checked int,
@approved int,
@received int,
@submitted int,
@date datetime,
@project nvarchar(50),
@regby int
as
update tbl_CalimStff set Checkedby=@checked,ApprovedBy=@approved,ReceivedBy=@received,Submittedby=@submitted,Date =@date, ProjectName=@project,RegBy=@regby where Refno =@refno 

create procedure pro_CS_selectAll
as
select * from tbl_CalimStaff

create procedure pro_CS_SelectByRef
@ref nvarchar(50)
as
select * from tbl_CalimStaff where RefNo = @ref 


create procedure pro_CSD_insert
@RefNo nvarchar(25) ,
@sub_no int,
@Title nvarchar(50),
@Desc nvarchar(100),
@amount decimal,
@ex_rate decimal
as insert into tbl_CalimStaff_Detail values (@RefNo,@sub_no,@Title,@Desc,@amount,@ex_rate,1,'0')


create procedure pro_CSD_update
@RefNo nvarchar(25) ,
@sub_no int,
@Title nvarchar(50),
@Desc nvarchar(100),
@amount decimal,
@ex_rate decimal
as
delete from tbl_CalimStaff_Detail where RefNo = @RefNo 
insert into tbl_CalimStaff_Detail values (@RefNo,@sub_no,@Title,@Desc,@amount,@ex_rate,1,'0')

create procedure pro_CSD_selectall
as
select * from tbl_CalimStatt_Detail 


create procedure pro_CSD_selectByRefNo
@refno nvarchar(25)
as
select * from tbl_CalimStatt_Detail where RefNo = @refno


create procedure pro_SaleContract_Insert
	@date Datetime,
	@username nvarchar(50),
	@nrc nvarchar(25),
	@village nvarchar(50),
	@Acres nvarchar(25),
	@FieldNo nvarchar(25),
	@LegalNo nvarchar(25),
	@Phone nvarchar(50),
	@MachineType nvarchar(40),
	@Duration DateTime,
	@totalAmount decimal(8,0),
	@Deposit decimal(8,0),
	@DeadLineDate datetime,
	@AgentEid int ,
	@RegEid int ,
	@WitnessName nvarchar(50),
	@WitnessNRC nvarchar(25),
	@WitnessAdd nvarchar(100)
	as
	insert into tbl_saleContract values (@date,@username,@nrc,@village,@Acres,@FieldNo,@LegalNo,@Phone,@MachineType,@Duration,@totalAmount,@Deposit,@DeadLineDate,
				@AgentEid,@RegEid,@WitnessName,@WitnessNRC,@WitnessAdd,'','')
				
				
create procedure pro_SaleContract_Update
    @SaleID int,
	@date Datetime,
	@username nvarchar(50),
	@nrc nvarchar(25),
	@village nvarchar(50),
	@Acres nvarchar(25),
	@FieldNo nvarchar(25),
	@LegalNo nvarchar(25),
	@Phone nvarchar(50),
	@MachineType nvarchar(40),
	@Duration DateTime,
	@totalAmount decimal(8,0),
	@Deposit decimal(8,0),
	@DeadLineDate datetime,
	@AgentEid int ,
	@RegEid int ,
	@WitnessName nvarchar(50),
	@WitnessNRC nvarchar(25),
	@WitnessAdd nvarchar(100)
	as
	update tbl_saleContract set [Date]=@date,username=@username,nrc=@nrc,village=@village,Acres=@Acres,FieldNo=@FieldNo,LegalNo=@LegalNo,Phone=@Phone,MachineType=@MachineType,Duration=@Duration,totalAmount=@totalAmount,Deposit=@Deposit,DeadLineDate=@DeadLineDate,
				AgentEid=@AgentEid,RegEid=@RegEid,WitnessName=@WitnessName,WitnessNRC=@WitnessNRC,WitnessAdd=@WitnessAdd				
				where id = @saleid 
				
				
create procedure pro_saleContract_selectall
as
select * from tbl_saleContract


create procedure  pro_saleC_getVou
as
select COUNT(ID) from tbl_salecontract 


create procedure pro_supplier_insert
@name nvarchar(50),
@address nvarchar(150),
@person nvarchar(50),
@phone nvarchar(50),
@reamrk nvarchar(100),
@photo nvarchar(150)
AS
INSERT INTO tbl_Supplier VALUES (@name,@address,@person,@phone,@reamrk,0,@photo )

drop procedure PRO_SUPPLIER_UPDATE 
CREATE PROCEDURE PRO_SUPPLIER_UPDATE
@ID INT,
@name nvarchar(50),
@address nvarchar(150),
@person nvarchar(50),
@phone nvarchar(50),
@reamrk nvarchar(100),
@photo nvarchar(150)
AS
UPDATE tbl_Supplier SET Name = @name,address=@address,Contact_person =@person,Phone=@phone,Remark = @reamrk , n1 = @photo  WHERE ID =@ID 

CREATE PROCEDURE PRO_SUPPLIER_SELECTALL
AS
SELECT * FROM tbl_Supplier 

create procedure Pro_supplier_getName
@id int 
as
Select Name from tbl_Supplier where ID=@id 


create procedure pro_pdt_insert
@Name nvarchar(50),
@Description nvarchar(100),
@sid int,
@Remark nvarchar(100)
as
insert into tbl_productlist values(@name,@Description,@sid,@Remark,0,'')

create procedure pro_pdt_update
@id int ,
@Name nvarchar(50),
@Description nvarchar(100),
@sid int,
@Remark nvarchar(100)
as
update tbl_productlist set Name = @Name,Description=@Description ,SID = @sid,Remark= @Remark where ID=@id 

create procedure pro_pdt_selectall
as
select * from tbl_productlist 