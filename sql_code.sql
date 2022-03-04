CREATE DATABASE PostGradOffice;
go
use PostGradOffice;
CREATE TABLE PostGradUser(
id int primary key identity(1,1),
email varchar(50) not null,
password varchar(30) not null
)
select * from Thesis

select * from GucianStudent
select * from GUCStudentPhoneNumber

CREATE TABLE Admin(
id int primary key foreign key references PostGradUser on delete cascade
on update cascade
)
CREATE TABLE GucianStudent(
id int primary key foreign key references PostGradUser on delete cascade
on update cascade,
firstName varchar(20),
lastName varchar(20),
type varchar(3),
faculty varchar(30),
address varchar(50),
GPA decimal(3,2),
undergradID int
)
CREATE TABLE NonGucianStudent(
id int primary key foreign key references PostGradUser on delete cascade
on update cascade,
firstName varchar(20),
lastName varchar(20),
type varchar(3),
faculty varchar(30),
address varchar(50),
GPA decimal(3,2),
)
CREATE TABLE GUCStudentPhoneNumber(
id int,
phone varchar(20),
primary key(id, phone),
foreign key(id) references GucianStudent on delete cascade
on update cascade
)

CREATE TABLE NonGUCStudentPhoneNumber(
id int,
phone varchar(20)
primary key(id, phone),
foreign key(id) references NonGucianStudent on delete
cascade on update cascade
)


CREATE TABLE Course(
id int primary key identity(1,1),
fees int,
creditHours int,
code varchar(10)
)
CREATE TABLE Supervisor(
id int primary key foreign key references PostGradUser,
name varchar(20),
faculty varchar(30)
);
CREATE TABLE Examiner(
id int primary key foreign key references PostGradUser on delete cascade
on update cascade,
name varchar(20),
fieldOfWork varchar(100),
isNational BIT
)
CREATE TABLE Payment(
id int primary key identity(1,1),
amount decimal(7,2),
noOfInstallments int,
fundPercentage decimal(4,2)
)
CREATE TABLE Thesis(
serialNumber int primary key identity(1,1),
field varchar(20),
type varchar(3) not null,
title varchar(100) not null,
startDate date not null,
endDate date not null,
defenseDate date,
years as (year(endDate)-year(startDate)),
grade decimal(4,2),
payment_id int foreign key references payment on delete cascade on update
cascade,
noOfExtensions int
)

CREATE TABLE Publication(
id int primary key identity(1,1),
title varchar(100) not null,
dateOfPublication date,
place varchar(100),
accepted BIT,
host varchar(100)
);
Create table Defense (serialNumber int,
date datetime,
location varchar(15),
grade decimal(4,2),
primary key (serialNumber, date),
foreign key (serialNumber) references Thesis on delete cascade on update
cascade)
Create table GUCianProgressReport (
sid int foreign key references GUCianStudent on delete cascade on update
cascade
, no int
, date datetime
, eval int
, state int
, description varchar(200)
, thesisSerialNumber int foreign key references Thesis on delete cascade
on update cascade
, supid int foreign key references Supervisor
, primary key (sid, no) )
Create table NonGUCianProgressReport (sid int foreign key references
NonGUCianStudent on delete
cascade on update cascade,
no int
, date datetime
, eval int
, state int
, description varchar(200)
, thesisSerialNumber int foreign key references Thesis on delete cascade
on update cascade
, supid int foreign key references Supervisor
, primary key (sid, no) )

Create table Installment (date datetime,
paymentId int foreign key references Payment on delete cascade on update
cascade
, amount decimal(8,2)
, done bit
, primary key (date, paymentId))

Create table NonGucianStudentPayForCourse(sid int foreign key references
NonGucianStudent on
delete cascade on update cascade,
paymentNo int foreign key references Payment on delete cascade on update
cascade,
cid int foreign key references Course on delete cascade on update cascade,
primary key (sid, paymentNo, cid))

Create table NonGucianStudentTakeCourse (sid int foreign key references
NonGUCianStudent on delete
cascade on update cascade
, cid int foreign key references Course on delete cascade on update
cascade
, grade decimal (4,2)
, primary key (sid, cid) )
Create table GUCianStudentRegisterThesis (sid int foreign key references
GUCianStudent on delete
cascade on update cascade,
supid int foreign key references Supervisor
, serial_no int foreign key references Thesis on delete cascade on update
cascade
, primary key(sid, supid, serial_no))
Create table NonGUCianStudentRegisterThesis (sid int foreign key
references NonGUCianStudent on
delete cascade on update cascade,
supid int foreign key references Supervisor,
serial_no int foreign key references Thesis on delete cascade on update
cascade ,
primary key (sid, supid, serial_no))
Create table ExaminerEvaluateDefense(date datetime,
serialNo int,
examinerId int foreign key references Examiner on delete cascade on update
cascade,
comment varchar(300),
primary key(date, serialNo, examinerId),
foreign key (serialNo, date) references Defense (serialNumber, date) on
delete cascade on update
cascade)
Create table ThesisHasPublication(serialNo int foreign key references
Thesis on delete cascade on
update cascade,
pubid int foreign key references Publication on delete cascade on update
cascade,
primary key(serialNo,pubid))

--------------------------------------------------Procedures------------------------------------------------------------------
go
create proc studentRegister
@first_name varchar(20),
@last_name varchar(20),
@password varchar(20),
@faculty varchar(20),
@Gucian bit,
@email varchar(50),
@address varchar(50)
as
begin
insert into PostGradUser(email,password)
values(@email,@password)
declare @id int
SELECT @id=SCOPE_IDENTITY()
if(@Gucian=1)
insert into GucianStudent(id,firstName,lastName,faculty,address,type)
values(@id,@first_name,@last_name,@faculty,@address,'Guc')
else
insert into NonGucianStudent(id,firstName,lastName,faculty,address,type)
values(@id,@first_name,@last_name,@faculty,@address,'Non')
end
go


create proc supervisorRegister
@first_name varchar(20),
@last_name varchar(20),
@password varchar(20),
@faculty varchar(20),
@email varchar(50)
as
begin
insert into PostGradUser(email,password)
values(@email,@password)
declare @id int
SELECT @id=SCOPE_IDENTITY()
declare @name varchar(50)
set @name = CONCAT(@first_name,@last_name)
insert into Supervisor(id,name,faculty) values(@id,@name,@faculty)
end
go
select * from Examiner
select * from GucianStudent
go

create proc examinerRegister
@email varchar(50),
@password varchar(20),
@name varchar(20),
@fieldOfWork varchar(100),
@isNational BIT
as
begin
insert into PostGradUser(email,password)
values(@email,@password)
declare @id int
SELECT @id=SCOPE_IDENTITY()
insert into Examiner(id,name,fieldOfWork,isNational) values(@id,@name,@fieldOfWork,@isNational)
end

go

Create proc userLogin
@email varchar(50),
@password varchar(20),
@success bit output,
@type int output,
@id int output
AS

if exists( select email,password from PostGradUser where email=@email and password=@password)
begin
set @success =1
set @id = (select P.id from PostGradUser P where p.email=@email and P.password=@password)
-- check user type 0-->Student,1-->Admin,2-->Supervisor ,3-->Examiner

if exists(select id from GucianStudent where id=@id)
set @type=0

if exists(select id from NonGucianStudent where id=@id)
set @type=1

if exists(select id from Admin where id=@id)
set @type=2

if exists(select id from Supervisor where id=@id)
set @type=3

if exists(select id from Examiner where id=@id)
set @type=4

end

else
set @success=0

go
create proc addMobile
@ID int,
@mobile_number varchar(20)
as
begin
if @ID is not null and @mobile_number is not null
begin
--check Gucian student or not
if(exists(select * from GucianStudent where id=@ID))
insert into GUCStudentPhoneNumber values(@ID,@mobile_number)
if(exists(select * from NonGucianStudent where id=@ID))
insert into NonGUCStudentPhoneNumber values(@ID,@mobile_number)
end
end
-------------------------------------------------------------------------Admin-----------------------------------------------------------------------------
go

CREATE Proc AdminListSup
As
Select u.id,u.email,u.password,s.name, s.faculty
from PostGradUser u inner join Supervisor s on u.id = s.id
go


CREATE Proc AdminViewSupervisorProfile
@supId int
As
Select u.id,u.email,u.password,s.name, s.faculty
from PostGradUser u inner join Supervisor s on u.id = s.id
WHERE @supId = s.id
go

CREATE Proc AdminViewAllTheses
As
Select * From Thesis
go

CREATE Proc AdminViewOnGoingTheses
@thesesCount int output
As
Select @thesesCount=Count(*)
From Thesis
where endDate > Convert(Date,CURRENT_TIMESTAMP)
go


CREATE Proc AdminViewStudentThesisBySupervisor
As
Select s.name,t.title,gs.firstName
From Thesis t inner join GUCianStudentRegisterThesis sr on
t.serialNumber=sr.serial_no
inner join Supervisor s on s.id=sr.supid inner join GucianStudent gs on
sr.sid=gs.id
where t.endDate > Convert(Date,CURRENT_TIMESTAMP)
union
Select s.name,t.title,gs.firstName
From Thesis t inner join NonGUCianStudentRegisterThesis sr on
t.serialNumber=sr.serial_no
inner join Supervisors on s.id=sr.supid inner join NonGucianStudent gs on
sr.sid=gs.id
where t.endDate > Convert(Date,CURRENT_TIMESTAMP)
go


CREATE Proc AdminListNonGucianCourse
@courseID int
As
if(exists(select * from Course where id=@courseID))
Select ng.firstName,ng.lastName,c.code,n.grade
From NonGucianStudentTakeCourse n inner join Course c on n.cid=c.id inner
join NonGucianStudent ng
on ng.id=n.sid
where n.cid=@courseID

go
CREATE Proc AdminUpdateExtension
@ThesisSerialNo int
As
if(exists(select * from Thesis where serialNumber=@ThesisSerialNo))
begin
declare @noOfExtensions int
select @noOfExtensions=noOfExtensions from Thesis where
serialNumber=@ThesisSerialNo
update Thesis
set noOfExtensions=@noOfExtensions+1
where serialNumber=@ThesisSerialNo
end
go

CREATE Proc AdminIssueThesisPayment
@ThesisSerialNo int,
@amount decimal,
@noOfInstallments int,
@fundPercentage decimal
As
if(exists(select * from Thesis where serialNumber=@ThesisSerialNo))
begin
insert into Payment(amount,noOfInstallments,fundPercentage)
values(@amount,@noOfInstallments,@fundPercentage)
declare @id int
SELECT @id=SCOPE_IDENTITY()
update Thesis
set payment_id=@id
where serialNumber=@ThesisSerialNo
end

go
CREATE Proc AdminViewStudentProfile
@sid int
As
if(exists(select * from GucianStudent where id=@sid))
Select
u.id,u.email,u.password,s.firstName,s.lastName,s.type,s.faculty,s.address,
s.address,s.GPA
from PostGradUser u inner join GucianStudent s on u.id=s.id
WHERE @sid = s.id
else if(exists(select * from NonGucianStudent where id=@sid))
Select
u.id,u.email,u.password,s.firstName,s.lastName,s.type,s.faculty,s.address,
s.address,s.GPA
from PostGradUser u inner join NonGucianStudent s on u.id=s.id
WHERE @sid = s.id

GO
CREATE PROC AdminIssueInstallPayment
@paymentID int, @InstallStartDate date
AS
declare @amount int
set @amount = (Select P.amount From Payment P where P.id=@paymentID )

declare @number int
set @number = (Select P.noOfInstallments From Payment P where P.id=@paymentID )

declare @installamount int 

set @installamount = @amount / @number

insert into Installment ( date , paymentId , amount )
values ( @InstallStartDate , @paymentID , @installamount )

 While (@number <>0)
	Begin
	  set @InstallStartDate = DATEADD ( MONTH , 6 ,@InstallStartDate )
		insert into Installment  (date,paymentID,amount)
		values (@InstallStartDate,@paymentID,@installamount)
		set @number= @number -1 
	end 
GO 



CREATE Proc AdminListAcceptPublication
As
select t.serialNumber,p.title
from ThesisHasPublication tp inner join Thesis t on
tp.serialNo=t.serialNumber
inner join Publication p on p.id=tp.pubid
where p.accepted=1
go
CREATE Proc AddCourse
@courseCode varchar(10),
@creditHrs int,
@fees decimal
As
insert into Course values(@fees,@creditHrs,@courseCode)
go


CREATE Proc linkCourseStudent
@courseID int,
@studentID int
As
if(exists(select * from Course ) and exists(select * from NonGucianStudent
where id=@studentID))
insert into
NonGucianStudentTakeCourse(sid,cid,grade)values(@studentID,@courseID,null)
go



CREATE Proc addStudentCourseGrade
@courseID int,
@studentID int,
@grade decimal
As
if(exists(select * from NonGucianStudentTakeCourse where sid=@studentID
and cid=@courseID))
update NonGucianStudentTakeCourse
set grade =@grade
where cid=@courseID and sid=@studentID
go


CREATE Proc ViewExamSupDefense
@defenseDate datetime
As
select s.serial_no,ee.date,e.name,sup.name
from ExaminerEvaluateDefense ee inner join examiner e on
ee.examinerId=e.id
inner join GUCianStudentRegisterThesis s on ee.serialNo=s.serial_no
inner join Supervisor sup on sup.id=s.supid


--------------------------------------------------------------------Supervisor---------------------------------------------------------------------------------------------
go
--------------------------------------Modified this procedure
------@success= 0 -> SUCCESS
---=1 -> not supervised by this supervisor
---=2 -> eval error
---=3 -> not found
CREATE Proc EvaluateProgressReport
@supervisorID int,
@thesisSerialNo int,
@progressReportNo int,
@evaluation int,
@success int OUTPUT
As
if(exists(select * from Thesis where serialNumber=@thesisSerialNo ) and
@evaluation in(0,1,2,3) )
begin

	if(exists(select * from GUCianStudentRegisterThesis where serial_no=@thesisSerialNo and supid=@supervisorID))
		begin
		declare @gucSid int
		select @gucSid=sid
		from GUCianStudentRegisterThesis
		where serial_no=@thesisSerialNo
		update GUCianProgressReport
		set eval=@evaluation
		where sid=@gucSid and thesisSerialNumber=@thesisSerialNo and
		no=@progressReportNo
		set @success=0
		end
	else if(exists(select * from NonGUCianStudentRegisterThesis where serial_no=@thesisSerialNo and supid=@supervisorID))
		begin
		declare @nonGucSid int
		select @nonGucSid=sid
		from NonGUCianStudentRegisterThesis
		where serial_no=@thesisSerialNo
		update NonGUCianProgressReport
		set eval=@evaluation
		where sid=@nonGucSid and thesisSerialNumber=@thesisSerialNo and
		no=@progressReportNo
		set @success=0
		end
	else 
		set @success=1
end
else if (@evaluation not in(0,1,2,3))
    begin set @success=2
	end
	
if (not exists(select * from Thesis where serialNumber=@thesisSerialNo))
begin
	set @success=3
	end

go

CREATE Proc ViewSupStudentsYears
@supervisorID int
As
if(exists(select * from Supervisor where id=@supervisorID))
begin
select s.firstName,s.lastName,t.years
from GUCianStudentRegisterThesis sr inner join GucianStudent s on
sr.sid=s.id
inner join Thesis t on t.serialNumber=sr.serial_no
union
select s.firstName,s.lastName,t.years
from NonGUCianStudentRegisterThesis sr inner join NonGucianStudent s on
sr.sid=s.id
inner join Thesis t on t.serialNumber=sr.serial_no
end

go
CREATE Proc SupViewProfile
@supervisorID int
As
if(exists(select * from Supervisor where id=@supervisorID))
begin
select u.id,u.email,u.password,s.name,s.faculty
from PostGradUser u inner join Supervisor s on u.id=s.id
end
go

--un
create proc UpdateSupProfile
@supervisorID int, @name varchar(20), @faculty varchar(20)
as
update Supervisor
set name = @name, faculty = @faculty
where id = @supervisorID

go
create proc ViewAStudentPublications
@StudentID int
as
select P.*
from GUCianStudentRegisterThesis GUC
inner join Thesis T
on GUC.serial_no = T.serialNumber
inner join ThesisHasPublication TP
on T.serialNumber = TP.serialNo
inner join Publication P
on P.id = TP.pubid
where GUC.sid = @StudentID
union all
select P.*
from NonGUCianStudentRegisterThesis NON
inner join Thesis T
on NON.serial_no = T.serialNumber
inner join ThesisHasPublication TP
on T.serialNumber = TP.serialNo
inner join Publication P
on P.id = TP.pubid
where NON.sid = @StudentID
go

create proc AddDefenseGucian
@ThesisSerialNo int , @DefenseDate Datetime , @DefenseLocation varchar(15)
as
insert into Defense
values(@ThesisSerialNo,@DefenseDate,@DefenseLocation,null)
go

create proc AddDefenseNonGucian
@ThesisSerialNo int , @DefenseDate Datetime , @DefenseLocation varchar(15)
as
declare @idOfStudent int
select @idOfStudent = sid
from NonGUCianStudentRegisterThesis
where serial_no = @ThesisSerialNo
if(not exists(select grade
from NonGucianStudentTakeCourse
where sid = @idOfStudent and grade < 50))
begin
insert into Defense
values(@ThesisSerialNo,@DefenseDate,@DefenseLocation,null)
end
go
select * from Examiner
select * from Defense
go

create proc AddExaminer
@ThesisSerialNo int , @DefenseDate Datetime , @ExaminerName
varchar(20),@Password varchar(30),
@National bit, @fieldOfWork varchar(20)
as
insert into PostGradUser values(@ExaminerName,@Password)
declare @id int
set @id = SCOPE_IDENTITY()
insert into Examiner values(@id,@ExaminerName,@fieldOfWork,@National)
insert into ExaminerEvaluateDefense
values(@DefenseDate,@ThesisSerialNo,@id,null)
go

create proc CancelThesis
@ThesisSerialNo int,
@success int OUTPUT
as
	if(exists( select * from GUCianProgressReport where thesisSerialNumber = @ThesisSerialNo))
begin
	declare @gucianEval int
	set @gucianEval = (
	select top 1 eval
	from GUCianProgressReport
	where thesisSerialNumber = @ThesisSerialNo
	order by no desc)
		if(@gucianEval = 0)
		begin
		    delete from Thesis where serialNumber = @ThesisSerialNo
			set @success=0
		end
			else
			set @success=1
			--last eval must be zero 
end
else
		if(exists( select * from NonGUCianProgressReport where thesisSerialNumber = @ThesisSerialNo))
	begin
		declare @nonGucianEval int
		set @nonGucianEval = (
		select top 1 eval
		from NonGUCianProgressReport
		where thesisSerialNumber = @ThesisSerialNo
		order by no desc)
			if(@nonGucianEval = 0)
			begin
				delete from Thesis where serialNumber = @ThesisSerialNo
				set @success=0
			end
			else
			set @success=1
	 end
else 
	set @success=2
	--thesis serialNum is invalid

go
create proc AddGrade
@ThesisSerialNo int
as
declare @grade decimal(4,2)
select @grade = grade
from Defense
where serialNumber = @ThesisSerialNo
update Thesis
set grade = @grade
where serialNumber = @ThesisSerialNo
---------------------------------------------------------------------Examiner-----------------------------------------------------------------------------------

go
create proc AddDefenseGrade
@ThesisSerialNo int , @DefenseDate Datetime ,
@grade decimal(4,2), @ExaminerID int,@s int output
as
if (exists (Select ED.examinerId from ExaminerEvaluateDefense ED inner join 
        Defense D on ED.serialNo=D.serialNumber and ED.date=D.date
		where ED.examinerId=@ExaminerID))
		
	begin
	update Defense
	set grade = @grade
	where exists (Select ED.examinerId from ExaminerEvaluateDefense ED inner join 
        Defense D on ED.serialNo=D.serialNumber and ED.date=D.date
		where ED.examinerId=@ExaminerID)
	--serialNumber = @ThesisSerialNo and date = @DefenseDate 
	set @s=0
	--Added grade successfully
	end
else 
	set @s=1
	--Cannot grade this defense because it's not examined by you
go

select * from ExaminerEvaluateDefense ED inner join Defense D on ED.serialNo=D.serialNumber and ED.date=D.date 
drop procedure AddDefenseGrade
go
declare @s int
exec AddDefenseGrade 14,'6/6/2020',88,36,@s output
select @s
go


create proc AddCommentsGrade
@ThesisSerialNo int , @DefenseDate Datetime , @comments varchar(300), @ExaminerID int,@s int output
as
if (exists (select ED.examinerId FROM ExaminerEvaluateDefense ED where ED.serialNo=@ThesisSerialNo AND ED.date=@DefenseDate AND ED.examinerId=@ExaminerID))
begin
	update ExaminerEvaluateDefense
	set comment = @comments
	where serialNo = @ThesisSerialNo and date = @DefenseDate AND examinerId=@ExaminerID
	set @s=0
	--Comment added successfully
end
	else
	set @s=1
	--Defense not examined by you

go

create proc editExaminerProfile
@ExaminerID int, @name varchar(20), @fieldOfWork varchar(100), @password
varchar(30), @email varchar(50)
as
update Examiner
set name = @name, fieldOfWork = @fieldOfWork
where id=@ExaminerID

update PostGradUser
set email = @email, password = @password
where id=@ExaminerID
go

create proc ListAll
@ExaminerID int
as
if (exists (Select * from ExaminerEvaluateDefense ED 
			inner join Thesis T on ED.serialNo=T.serialNumber
			inner join GUCianStudentRegisterThesis GR  on GR.serial_no=ED.serialNo 
			where @ExaminerID=ED.examinerId ))
begin
Select T.title, S.name, GS.firstName From
ExaminerEvaluateDefense ED inner join Thesis T on ED.serialNo=T.serialNumber
inner join GUCianStudentRegisterThesis GR  on GR.serial_no=ED.serialNo
inner join GucianStudent GS on GR.sid=GS.id
inner join Supervisor S on GR.supid=S.id
where @ExaminerID=ED.examinerId
end
else  
	if (exists (Select * from ExaminerEvaluateDefense ED 
			inner join Thesis T on ED.serialNo=T.serialNumber
			inner join NonGUCianStudentRegisterThesis NGR on NGR.serial_no=ED.serialNo 
			where @ExaminerID=ED.examinerId ))
begin
Select T.title, S.name, NGS.firstName From
ExaminerEvaluateDefense ED 
inner join Thesis T on ED.serialNo=T.serialNumber
inner join NonGUCianStudentRegisterThesis NGR on NGR.serial_no=ED.serialNo
inner join  NonGucianStudent NGS on NGR.sid=NGS.id
inner join Supervisor S on NGR.supid=S.id
where @ExaminerID=ED.examinerId
end

go

create proc SearchThesis
@ExaminerID int,
@Keyword varchar(100),
@success int OUTPUT
as

if (exists (Select * from ExaminerEvaluateDefense ED 
			inner join Thesis T on ED.serialNo=T.serialNumber
			inner join GUCianStudentRegisterThesis GR  on GR.serial_no=ED.serialNo 
			where @ExaminerID=ED.examinerId ))
begin
	Select T.*  From
	ExaminerEvaluateDefense ED inner join Thesis T on ED.serialNo=T.serialNumber
	inner join GUCianStudentRegisterThesis GR  on GR.serial_no=ED.serialNo
	where ((T.title like '%'+@Keyword+'%' or  T.title like @Keyword+'%' or  T.title like '%'+@Keyword)
	and @ExaminerID=ED.examinerId)
	set @success=0
end
else  
	if (exists (Select * from ExaminerEvaluateDefense ED 
		inner join Thesis T on ED.serialNo=T.serialNumber
		inner join NonGUCianStudentRegisterThesis NGR on NGR.serial_no=ED.serialNo 
		where @ExaminerID=ED.examinerId ))
	begin
	Select T.* From
	ExaminerEvaluateDefense ED 
	inner join Thesis T on ED.serialNo=T.serialNumber
	inner join NonGUCianStudentRegisterThesis NGR on NGR.serial_no=ED.serialNo
	where ((T.title like '%'+@Keyword+'%' or  T.title like @Keyword+'%' or  T.title like '%'+@Keyword) and @ExaminerID=ED.examinerId)
	set @success=0
    end
else 
	set @success=1

go

declare @success int
exec SearchThesis 36,'op',@success output
select @success
select * from ExaminerEvaluateDefense
-----------------------------------------------------------------Registered Student------------------------------------------------------------------------------------------
go
create proc viewMyProfile
@studentId int
as
if(exists(
select * from GucianStudent where id = @studentId
))
begin
select G.*,P.email
from GucianStudent G
inner join PostGradUser P
on G.id = P.id
where G.id = @studentId
end
else
begin
select N.*,P.email
from NonGucianStudent N
inner join PostGradUser P
on N.id = P.id
where N.id = @studentId
end
go


create proc editMyProfile
@studentID int, @firstName varchar(20), @lastName varchar(20), @password
varchar(30), @email
varchar(50)
, @address varchar(50), @type varchar(3)
as
update GucianStudent
set firstName = @firstName, lastName = @lastName, address = @address, type
= @type
where id = @studentID
update NonGucianStudent
set firstName = @firstName, lastName = @lastName, address = @address, type
= @type
where id = @studentID
update PostGradUser
set email = @email, password = @password
where id = @studentID
go


create proc addUndergradID
@studentID int, @undergradID varchar(10)
as
update GucianStudent
set undergradID = @undergradID
where id = @studentID

go
create proc ViewCoursesGrades
@studentID int
as
select  C.code,NC.grade
from NonGucianStudentTakeCourse NC inner join Course C on NC.cid=C.id 
where NC.sid=@studentID
go

create proc ViewMyThesis 
@StudentID int 
as
 select T.* from Thesis T inner join GUCianStudentRegisterThesis G on 
 T.serialNumber=G.serial_no 
 where G.sid=@StudentID

 select T.* from Thesis T inner join NonGUCianStudentRegisterThesis NG on 
 T.serialNumber=NG.serial_no 
 where NG.sid=@StudentID
 go

create proc ViewCoursePaymentsInstall
@studentID int
as
select P.id as 'Payment Number', P.amount as 'Amount of
Payment',P.fundPercentage as 'Percentage of
fund for payment', P.noOfInstallments as 'Number of installments',
I.amount as 'Installment Amount',I.date as 'Installment date', I.done as
'Installment done or not'
from NonGucianStudentPayForCourse NPC
inner join Payment P
on NPC.paymentNo = P.id and NPC.sid = @studentID
inner join Installment I
on I.paymentId = P.id
go

create proc ViewThesisPaymentsInstall
@studentID int
as
select P.id as 'Payment Number', P.amount as 'Amount of Payment',
P.fundPercentage as
'Fund',P.noOfInstallments as 'Number of installments',
I.amount as 'Installment amount',I.date as 'Installment date', I.done as
'Installment done or not'
from GUCianStudentRegisterThesis G
inner join Thesis T
on G.serial_no = T.serialNumber and G.sid = @studentID
inner join Payment P
on T.payment_id = P.id
inner join Installment I
on I.paymentId = P.id
union
select P.id as 'Payment Number',P.amount as 'Amount of Payment',
P.fundPercentage as
'Fund',P.noOfInstallments as 'Number of installments',
I.amount as 'Installment amount',I.date as 'Installment date', I.done as
'Installment done or not'
from NonGUCianStudentRegisterThesis NG
inner join Thesis T
on NG.serial_no = T.serialNumber and NG.sid = @studentID
inner join Payment P
on T.payment_id = P.id
inner join Installment I
on I.paymentId = P.id
go

create proc ViewUpcomingInstallments
@studentID int
as
select I.date as 'Date of Installment' ,I.amount as 'Amount'
from Installment I
inner join NonGucianStudentPayForCourse NPC
on I.paymentId = NPC.paymentNo and NPC.sid = @studentID and I.date >
CURRENT_TIMESTAMP
union
select I.date as 'Date of Installment' ,I.amount as 'Amount'
from Thesis T
inner join Payment P
on T.payment_id = P.id
inner join Installment I
on I.paymentId = P.id
inner join GUCianStudentRegisterThesis G
on G.serial_no = T.serialNumber and G.sid = @studentID
where I.date > CURRENT_TIMESTAMP
union
select I.date as 'Date of Installment' ,I.amount as 'Amount'
from Thesis T
inner join Payment P
on T.payment_id = P.id
inner join Installment I
on I.paymentId = P.id
inner join NonGUCianStudentRegisterThesis G
on G.serial_no = T.serialNumber and G.sid = @studentID
where I.date > CURRENT_TIMESTAMP
go

create proc ViewMissedInstallments
@studentID int
as
select I.date as 'Date of Installment' ,I.amount as 'Amount'
from Installment I
inner join NonGucianStudentPayForCourse NPC
on I.paymentId = NPC.paymentNo and NPC.sid = @studentID and I.date <
CURRENT_TIMESTAMP and
I.done = '0'
union
select I.date as 'Date of Installment' ,I.amount as 'Amount'
from Thesis T
inner join Payment P
on T.payment_id = P.id
inner join Installment I
on I.paymentId = P.id
inner join GUCianStudentRegisterThesis G
on G.serial_no = T.serialNumber and G.sid = @studentID
where I.date < CURRENT_TIMESTAMP and I.done = '0'
union
select I.date as 'Date of Installment' ,I.amount as 'Amount'
from Thesis T
inner join Payment P
on T.payment_id = P.id
inner join Installment I
on I.paymentId = P.id
inner join NonGUCianStudentRegisterThesis G
on G.serial_no = T.serialNumber and G.sid = @studentID
where I.date < CURRENT_TIMESTAMP and I.done = '0'
go


create proc AddProgressReport
@thesisSerialNo int, @progressReportDate date, @studentID
int,@progressReportNo int
as
declare @gucian int
if(exists(
select id
from GucianStudent
where id = @studentID
))
begin
set @gucian = '1'
end
else
begin
set @gucian = '0'
end
if(@gucian = '1')
begin
insert into GUCianProgressReport
values(@studentID,@progressReportNo,@progressReportDate,null,null,null,@thesisSerialNo,null)
end
else
begin
insert into NonGUCianProgressReport
values(@studentID,@progressReportNo,@progressReportDate,null,null,null,@thesisSerialNo,null)
end
go

create proc FillProgressReport
@thesisSerialNo int, @progressReportNo int, @state int, @description
varchar(200),@studentID int
as
declare @gucian bit
if(exists(
select * from GucianStudent
where id = @studentID
))
begin
set @gucian = '1'
end
else
begin
set @gucian = '0'
end
if(@gucian = '1')
begin
update GUCianProgressReport
set state = @state, description = @description, date = CURRENT_TIMESTAMP
where thesisSerialNumber = @thesisSerialNo and sid = @studentID and no =
@progressReportNo
end
else
begin
update NonGUCianProgressReport
set state = @state, description = @description, date = CURRENT_TIMESTAMP
where thesisSerialNumber = @thesisSerialNo and sid = @studentID and no =
@progressReportNo
end
go

create proc ViewEvalProgressReport
@thesisSerialNo int, @progressReportNo int,@studentID int
as
select eval
from GUCianProgressReport
where sid = @studentID and thesisSerialNumber = @thesisSerialNo and no =
@progressReportNo
union
select eval
from NonGUCianProgressReport
where sid = @studentID and thesisSerialNumber = @thesisSerialNo and no =
@progressReportNo
go

create proc addPublication
@title varchar(50), @pubDate datetime, @host varchar(50), @place
varchar(50), @accepted bit
as
insert into Publication values(@title,@pubDate,@place,@accepted,@host)
go

Create proc getIDPublication
@title varchar(50), @pubDate datetime, @host varchar(50), @place
varchar(50), @accepted bit,
@id int output
AS

if exists(select P.title,P.dateOfPublication,P.host,P.place,P.accepted
	from Publication P where P.title=@title and P.dateOfPublication=@pubDate and P.host=@host and P.place=@place and P.accepted=@accepted)
begin
set @id = (select P.id from Publication P where P.title=@title and P.dateOfPublication=@pubDate and P.host=@host and P.place=@place and P.accepted=@accepted)
end

go

create trigger deleteSupervisor
on Supervisor
instead of delete
as
delete from GUCianProgressReport where supid in (select id from deleted)
delete from NonGUCianProgressReport where supid in (select id from
deleted)
delete from GUCianStudentRegisterThesis where supid in (select id from
deleted)
delete from NonGUCianStudentRegisterThesis where supid in (select id from
deleted)
delete from Supervisor where id in (select id from deleted)
delete from PostGradUser where id in (select id from deleted)
 go

 
