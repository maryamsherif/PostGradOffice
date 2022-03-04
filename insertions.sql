USE PostGradOffice
GO

Insert into PostGradUser ( email , password )
Values ('maryam.sherif@student.guc.edu.eg','maryamsherif');

Insert into PostGradUser ( email , password )
Values ('sara.sherif@student.guc.edu.eg','sarasherif');

Insert into PostGradUser ( email , password )
Values ('mayar.ibrahim@student.guc.edu.eg','mayaribrahim');

Insert into PostGradUser( email , password )
Values ('sonya.medhat@student.guc.edu.eg','sonyamedhat');

Insert into PostGradUser( email , password )
Values ('malak.mohamed@student.guc.edu.eg','malakmohamed');

Insert into PostGradUser ( email , password )
Values ('ahmed.karim@student.guc.edu.eg','ahmedkarim');

Insert into PostGradUser( email , password )
Values ('wael.hamed@student.guc.edu.eg','waelhamed');

Insert into PostGradUser( email , password )
Values ('omar.hassan@student.guc.edu.eg','omarhassan');

Insert into PostGradUser ( email , password )
Values ('ramy.karim@gmail.com','ramykarim');

Insert into PostGradUser ( email , password )
Values ('seif.gamal@gmail.com','seifgamal');

Insert into PostGradUser ( email , password )
Values ('mervat.abukhier@gmail.com','mervatabukhier');

Insert into PostGradUser ( email , password )
Values ('slim@gmail.com','slimslim');

Insert into PostGradUser ( email , password )
Values ('milad.ghantous@gmail.com','milad.ghantous');

Insert into PostGradUser ( email , password ) 
Values ('Ramy.Hussien@gmail.com','ramyhussien');

Insert into PostGradUser ( email , password )
Values ('salma.mahmoud@gmail.com','salmamahmoud');

Insert into PostGradUser ( email , password )
Values ('alaa.talaat@gmail.com','alaatalaat');

Insert into PostGradUser ( email , password )
Values ('mona.hany@gmail.com','monahany');

Insert into PostGradUser ( email , password )
Values ('mohamed.ayman@gmail.com','mohamedayman');

Insert into PostGradUser ( email , password )
Values ('mostafa.khaled@gmail.com','mostafakhaled');

Insert into PostGradUser ( email , password )
Values ('amr.gamal@gmail.com','amrgamal');

INSERT INTO PostGradUser ( email , password )
values ('Michael202@hotmail.com','Michael202');

INSERT INTO PostGradUser ( email , password )
values ('MarcoR342@gmail.com','MarcoRach202');

INSERT INTO PostGradUser ( email , password )
values ('AhmedTarek481@gmail.com','AhmedWalid598');

INSERT INTO PostGradUser ( email , password )
values ('NadaSharaf@outlook.com','NadaSh567');

INSERT INTO PostGradUser ( email , password )
values ('WalaaMetwally@gmail.com','WalaaMetGuc23');

INSERT INTO PostGradUser ( email , password )
values ('Angela_Robert54@hotmail.com','AngelaHarvard67');

select * from PostGradUser

Insert Into GucianStudent(id,firstName , lastName , type , faculty , address , GPA )
Values (1,'Maryam','Sherif','Guc','MET','Nasr City',0.7);

Insert Into GucianStudent ( id, firstName , lastName , type , faculty , address , GPA )
Values (2,'Sara','Sherif','Guc','Civil','Masr ElGdida',0.8);

Insert Into GucianStudent ( id, firstName , lastName , type , faculty , address , GPA )
Values (3,'Mayar','Ibrahim','Guc','Mecha','Tagamoa',0.9);

Insert Into GucianStudent( id, firstName , lastName , type , faculty , address , GPA )
Values (4,'Sonya','Medhat','Guc','IET','Nasr City',1.0);

Insert Into GucianStudent ( id, firstName , lastName , type , faculty , address , GPA )
Values (5,'Malak','Mohamed','Guc','BI','ElMohandseen',1.1);

Insert Into GucianStudent( id, firstName , lastName , type , faculty , address , GPA )
Values (6,'Ahmed','Karim','Guc','Law','6th October',1.2);

Insert Into GucianStudent( id, firstName , lastName , type , faculty , address , GPA )
Values (7,'Wael','Hamed','Guc','Managem','Sheikh Zayed',1.3);

Insert Into GucianStudent ( id, firstName , lastName , type , faculty , address , GPA )
Values (8,'Omar','Hassan','Guc','Arch','Madinaty',1.4);

select * from GucianStudent

Insert into GUCStudentPhoneNumber ( id , phone ) 
values ( 1 , '01113476333')

Insert into GUCStudentPhoneNumber ( id , phone ) 
values ( 2 , '012278675524')

Insert into GUCStudentPhoneNumber ( id , phone ) 
values ( 3 , '01384907490')

Insert into GUCStudentPhoneNumber ( id , phone ) 
values ( 4 , '011338903')

select * from GUCStudentPhoneNumber

Insert Into NonGucianStudent ( id, firstName , lastName , type , faculty , address , GPA )
Values (14,'Ramy','Hussien','Non','Applied Arts','ElShorouk City',2.0);

Insert Into NonGucianStudent ( id, firstName , lastName , type , faculty , address , GPA )
Values (15,'Salma','Mahmoud','Non','Engineering','Nasr City',1.9);

Insert Into NonGucianStudent( id, firstName , lastName , type , faculty , address , GPA )
Values (16,'Alaa','Talaat','Non','MET','Tagamoa',1.8);

Insert Into NonGucianStudent ( id, firstName , lastName , type , faculty , address , GPA )
Values (17,'Mona','Hany','Non','IET','ElMohandseen',1.7);

Insert Into NonGucianStudent ( id, firstName , lastName , type , faculty , address , GPA )
Values (18,'Mohamed','Ayman','Non','Civil','Sheikh Zayed',1.6);

Insert Into NonGucianStudent( id, firstName , lastName , type , faculty , address , GPA )
Values (19,'Mostafa','Khaled','Non','BI','Masr ElGdida',1.5);

Insert Into NonGucianStudent ( id, firstName , lastName , type , faculty , address , GPA )
Values (20,'Amr','Gamal','Non','Management','Madinaty',1.4);

select * from NonGucianStudent

Insert into NonGUCStudentPhoneNumber( id , phone ) 
values ( 17 , '01211457902')

Insert into NonGUCStudentPhoneNumber ( id , phone ) 
values ( 18 , '01134890322')

Insert into NonGUCStudentPhoneNumber ( id , phone ) 
values ( 16 , '01234566789')

Insert into NonGUCStudentPhoneNumber ( id , phone ) 
values ( 19, '01234905880')

select * from NonGUCStudentPhoneNumber

INSERT INTO Course ( fees , creditHours , code )
values ( 10000, 4 , 'CSEN401');

INSERT INTO Course ( fees , creditHours , code )
values (15000, 6 , 'BIOT1');

INSERT INTO Course( fees , creditHours , code )
values (11000, 2 , 'MATH401');

INSERT INTO Course( fees , creditHours , code )
values (12000, 4 , 'HR201');

INSERT INTO Course( fees , creditHours , code )
values (14000, 6 , 'MECH201');

INSERT INTO Course( fees , creditHours , code )
values (13000, 4 , 'DB601');

INSERT INTO Course ( fees , creditHours , code )
values (16000, 6 , 'CSEN301');


insert into NonGucianStudentTakeCourse values (14,1,56);
insert into NonGucianStudentTakeCourse values (15,2,67);
insert into NonGucianStudentTakeCourse values (16,3,97);
insert into NonGucianStudentTakeCourse values (17,4,83);
insert into NonGucianStudentTakeCourse values (18,5,95);



Insert into Supervisor ( id, name , faculty )
Values (9, 'Ramy','Civil');

Insert into Supervisor (id,name , faculty )
Values (10,'Seif','Mechatronics');

Insert into Supervisor ( id,name , faculty )
Values (11,'Mervat','MET');

Insert into Supervisor ( id,name , faculty )
Values (12,'Slim','BI');

Insert into Supervisor ( id,name , faculty )
Values (13,'Milad','Law');

select * from Supervisor

INSERT INTO Payment (amount, noOfInstallments ,fundPercentage)
values (10000,4,10);

INSERT INTO Payment  (amount, noOfInstallments ,fundPercentage)
values (15000,3,15);

INSERT INTO Payment  (amount, noOfInstallments ,fundPercentage)
values (20000,2,5);

INSERT INTO Payment (amount, noOfInstallments ,fundPercentage)
values (25000,3,12);

INSERT INTO Payment  (amount, noOfInstallments ,fundPercentage)
values (10000,4,13);

INSERT INTO Payment  (amount, noOfInstallments ,fundPercentage)
values (13000,3,14);

INSERT INTO Payment  (amount, noOfInstallments ,fundPercentage)
values (12500,2,11);

INSERT INTO Payment  (amount, noOfInstallments ,fundPercentage)
values (21000,5,20);

INSERT INTO Payment  (amount, noOfInstallments ,fundPercentage)
values (14000,3,10);

INSERT INTO Payment  (amount, noOfInstallments ,fundPercentage)
values (9000,2,9);

INSERT INTO Payment  (amount, noOfInstallments ,fundPercentage)
values (16000,3,12);

INSERT INTO Payment  (amount, noOfInstallments ,fundPercentage)
values (13500,3,15);

INSERT INTO Payment (amount, noOfInstallments ,fundPercentage)
values (20000,2,12);

INSERT INTO Payment  (amount, noOfInstallments ,fundPercentage)
values (17000,4,17);

INSERT INTO Payment  (amount, noOfInstallments ,fundPercentage)
values (11000,3,20);

INSERT INTO Payment  (amount, noOfInstallments ,fundPercentage)
values (19000,5,30);

INSERT INTO Payment  (amount, noOfInstallments ,fundPercentage)
values (19000,7,50);

INSERT INTO Payment  (amount, noOfInstallments ,fundPercentage)
values (19000,5,60);

select * from Payment

INSERT INTO Thesis (field , type , title , startDate,endDate,DefenseDate, grade,payment_id,noOfExtensions)
values ('Medical Eng','MS','Effect of Med','11/11/2014',
'11/11/2016','12/7/2016',82,1,2);

INSERT INTO Thesis (field , type , title , startDate,endDate,DefenseDate, grade,payment_id,noOfExtensions)
values ('Electrical Eng','MS','Elect is imp','3/1/2015',
'3/1/2017','1/5/2017',64,2,3);

INSERT INTO Thesis (field , type , title , startDate,endDate,DefenseDate, grade,payment_id,noOfExtensions)
values ('Comp Eng','MS','Artifical I','7/6/2016',
'7/6/2018','5/8/2018',76,3,4);

INSERT INTO Thesis (field , type , title , startDate,endDate,DefenseDate, grade,payment_id,noOfExtensions)
values ('Manag Tech','MS','Technology','11/11/2000',
'11/11/2002','11/1/2002',86,4,5);

INSERT INTO Thesis (field , type , title , startDate,endDate,DefenseDate, grade,payment_id,noOfExtensions)
values ('Pharma Eng','MS','Pharma and Eng','12/9/2006',
'12/5/2008','7/13/2008',76,5,6);

INSERT INTO Thesis (field , type , title , startDate,endDate,DefenseDate, grade,payment_id,noOfExtensions)
values ('Bio tech','MS','Pharma','4/8/2012',
'4/8/2014','3/8/2014',52,6,7);

INSERT INTO Thesis (field , type , title , startDate,endDate,DefenseDate, grade,payment_id,noOfExtensions)
values ('Market','MS','social media','10/25/2018',
'10/25/2020','9/12/2020',99,7,8);

INSERT INTO Thesis (field , type , title , startDate,endDate,DefenseDate, grade,payment_id,noOfExtensions)
values ('Eco','PHD','Eco and dev.','9/26/2007',
'9/26/2009','9/19/2009',95,8,9);

INSERT INTO Thesis (field , type , title , startDate,endDate,DefenseDate, grade,payment_id,noOfExtensions)
values ('Mecha','PHD','Wind tunnel','12/28/2004',
'12/28/2006','10/12/2006',82,9,10);

INSERT INTO Thesis (field , type , title , startDate,endDate,DefenseDate, grade,payment_id,noOfExtensions)
values ('P.Design','PHD','urban surfaces','11/17/2011',
'5/11/2013','3/12/2019','A',10,1);

INSERT INTO Thesis (field , type , title , startDate,endDate,DefenseDate, grade,payment_id,noOfExtensions)
values ('Design','PHD','graphic design','8/27/2005',
'9/20/2007','7/12/2007',84,11,2);

INSERT INTO Thesis (field , type , title , startDate,endDate,DefenseDate, grade,payment_id,noOfExtensions)
values ('Media Design','PHD','TV shows','11/11/2015',
'12/17/2017','7/12/2017','A',12,3);

INSERT INTO Thesis (field , type , title , startDate,endDate,DefenseDate, grade,payment_id,noOfExtensions)
values ('Material Eng','PHD','Graphene','7/11/2005',
'9/14/2007','7/19/2007',75,13,4);

INSERT INTO Thesis (field , type , title , startDate,endDate,DefenseDate, grade,payment_id,noOfExtensions)
values ('Finance','PHD','Electronics','8/12/2003',
'10/15/2005','8/12/2005',58,15,5);

INSERT INTO Thesis (field , type , title , startDate,endDate,DefenseDate, grade,payment_id,noOfExtensions)
values ('Human Resources','MS','Productivity','9/13/2019',
'6/16/2021','4/12/2021',59,16,6);


INSERT INTO Thesis (field , type , title , startDate,endDate,DefenseDate, grade,payment_id,noOfExtensions)
values ('Human Resources','MS','Productivity','9/13/2019',
'7/7/2022','4/12/2021',95,17,4);


INSERT INTO Thesis (field , type , title , startDate,endDate,DefenseDate, grade,payment_id,noOfExtensions)
values ('Self study','MS','Productivity','9/13/2019',
'5/5/2022','4/12/2021',76,18,5);




select * from Thesis

 Insert into Publication ( title , dateOfPublication , place , accepted , host )
Values ('Bio Technology','11/11/2011','H13',1,'Ahmed');

Insert into Publication ( title , dateOfPublication , place , accepted , host )
Values ('COVID-19','12/21/2012','H14',0,'Mervat');

Insert into Publication ( title , dateOfPublication , place , accepted , host ) 
Values ('Hate crimes','3/13/2013','D4.01',1,'Slim');

Insert into Publication ( title , dateOfPublication , place , accepted , host )
Values ('Evolution','2/20/2020','C7.02',0,'Haitham');

Insert into Publication ( title , dateOfPublication , place , accepted , host )
Values ('Consumer behavior','1/15/2015','H3',1,'Ali');


insert into ThesisHasPublication values (12,1);
insert into ThesisHasPublication values (13,2);
insert into ThesisHasPublication values (14,3);
insert into ThesisHasPublication values (15,4);
insert into ThesisHasPublication values (16,5);


INSERT INTO Examiner ( id , name ,fieldOfWork ,isNational )
values ( 21, 'Michael','Applied Arts', 0);

INSERT INTO Examiner ( id , name ,fieldOfWork ,isNational )
values (22, 'Marco','Pharmacy',0);

INSERT INTO Examiner ( id , name ,fieldOfWork ,isNational )
values ( 23, 'Ahmed','Engineering', 1);

INSERT INTO Examiner ( id , name ,fieldOfWork ,isNational )
values ( 24, 'Nada',' Business', 1);

INSERT INTO Examiner ( id , name ,fieldOfWork ,isNational )
values ( 25, 'Walaa',' Management', 0);

INSERT INTO Examiner ( id , name ,fieldOfWork ,isNational )
values ( 26, 'Angela',' Computer Science', 1);

select * from Examiner

--INSERT INTO Defense ( serialNumber , date , location , grade )
--values(1,'12/7/2016', 'B1.301',10);

--INSERT INTO Defense( serialNumber , date , location , grade )
--values(2,'1/5/2017', 'C1.201', 15);

--INSERT INTO Defense ( serialNumber , date , location , grade )
--values(3,'5/8/2018', 'D4.202',13);

--INSERT INTO Defense ( serialNumber , date , location , grade )
--values(4,'11/1/2002', 'C2.105',19);

--INSERT INTO Defense ( serialNumber , date , location , grade )
--values(5,'7/13/2008', 'D4.202',12);

--INSERT INTO Defense ( serialNumber , date , location , grade )
--values(6,'3/8/2014', 'C2.104', 11);

--INSERT INTO Defense ( serialNumber , date , location , grade )
--values(7,'9/12/2020', 'C5.204',20);

--INSERT INTO Defense ( serialNumber , date , location , grade )
--values(8,'9/19/2009', 'D2.212',17);

--INSERT INTO Defense ( serialNumber , date , location , grade )
--values(9,'10/12/2006', 'D2.101',11);

--INSERT INTO Defense ( serialNumber , date , location , grade )
--values(10,'3/12/2019', 'C3.201',10) ;

--INSERT INTO Defense ( serialNumber , date , location , grade )
--values(11,'7/12/2007', 'D1.211',9);

--INSERT INTO Defense ( serialNumber , date , location , grade )
--values(12,'7/12/2017', 'D2.101',8);

--INSERT INTO Defense ( serialNumber , date , location , grade )
--values(13,'7/19/2007', 'B2.311',18);

--INSERT INTO Defense ( serialNumber , date , location , grade )
--values(14,'8/12/2005', 'C1.201',7);

--INSERT INTO Defense ( serialNumber , date , location , grade )
--values(15,'4/12/2021', 'D1.201',12);

select * from Defense

Insert into ExaminerEvaluateDefense (date,serialNo,examinerId) 
values ('12/7/2016',1,21)

Insert into ExaminerEvaluateDefense (date,serialNo,examinerId) 
values ('1/5/2017',2,22)

Insert into ExaminerEvaluateDefense (date,serialNo,examinerId) 
values ('5/8/2018',3,23)

Insert into ExaminerEvaluateDefense (date,serialNo,examinerId) 
values ('11/1/2002',4,24)

Insert into ExaminerEvaluateDefense (date,serialNo,examinerId) 
values ('7/13/2008',5,25)

Insert into ExaminerEvaluateDefense (date,serialNo,examinerId) 
values ('3/8/2014',6,26)


INSERT INTO GUCianProgressReport (no,sid ,supid,thesisSerialNumber)
values (1,1,9,17);

INSERT INTO GUCianProgressReport (no,sid ,supid,thesisSerialNumber)
values (2,2,10,18);

INSERT INTO GUCianProgressReport (no,sid ,supid,thesisSerialNumber)
values (3,3,11,19);

INSERT INTO GUCianProgressReport (no,sid ,supid,thesisSerialNumber)
values (4,4,12,20);

INSERT INTO NonGUCianProgressReport(no,sid ,supid,thesisSerialNumber)
values (5,14,9,12);

INSERT INTO NonGUCianProgressReport (no,sid ,supid,thesisSerialNumber)
values (6,15,10,13);

INSERT INTO NonGUCianProgressReport (no,sid ,supid,thesisSerialNumber)
values (7,16,11,14);

INSERT INTO NonGUCianProgressReport (no,sid ,supid,thesisSerialNumber)
values (8,17,12,15);


select * from NonGUCianProgressReport
select * from GUCianProgressReport

INSERT INTO Installment (date, paymentId, amount, done )
values ('2/3/2016',1,15000,1);

INSERT INTO Installment (date, paymentId, amount, done )
values ('3/1/2015', 2,16000, 1);

INSERT INTO Installment (date, paymentId, amount, done )
values ('7/6/2016', 3,17500, 0);

INSERT INTO Installment (date, paymentId, amount, done )
values ('11/11/2000',4,14500, 1);

INSERT INTO Installment (date, paymentId, amount, done )
values ('8/12/2006',5,12000, 1);

INSERT INTO Installment (date, paymentId, amount, done )
values ('4/8/2012',6,16000, 0);

INSERT INTO Installment (date, paymentId, amount, done )
values ('10/25/2018',7,17500, 0);

INSERT INTO Installment (date, paymentId, amount, done )
values ('9/26/2007',8,11000, 1);

INSERT INTO Installment (date, paymentId, amount, done )
values ('12/28/2004',9,10000, 1);

INSERT INTO Installment (date, paymentId, amount, done )
values ('11/17/2011',10,20000, 0);

INSERT INTO Installment (date, paymentId, amount, done )
values ('8/27/2005',11,19000, 0);

INSERT INTO Installment (date, paymentId, amount, done )
values ('11/11/2015',12,16000, 1);

INSERT INTO Installment (date, paymentId, amount, done )
values ('7/11/2005',13,16400, 0);

INSERT INTO Installment (date, paymentId, amount, done )
values ('8/12/2003',14,18000, 1);

INSERT INTO Installment (date, paymentId, amount, done )
values ('9/13/2019',15,21000, 1);

INSERT INTO Installment (date, paymentId, amount, done )
values ('9/15/2015',16,21000, 0);


Insert into NonGUCianStudentRegisterThesis 
values (14,9,12);

Insert into NonGUCianStudentRegisterThesis 
values (15,10,13);

Insert into NonGUCianStudentRegisterThesis 
values (16,11,14);

Insert into NonGUCianStudentRegisterThesis 
values (17,12,15);

Insert into NonGUCianStudentRegisterThesis 
values (18,13,16);

Insert into GUCianStudentRegisterThesis 
values (1,9,17);

Insert into GUCianStudentRegisterThesis 
values (2,10,18);

Insert into GUCianStudentRegisterThesis 
values (3,11,19);

Insert into GUCianStudentRegisterThesis 
values (4,12,20);

 insert into PostGradUser (email,password) values ('mohamedsalah@mail','mohamedsalah')
 insert into PostGradUser (email,password) values ('yasserhegazy@mail','yasserhegazy')

 insert into Admin (id) values (37)
 insert into Admin (id )values (38)



