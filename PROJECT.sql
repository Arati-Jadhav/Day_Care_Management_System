--PARENT_TABLE
create table Parent_details(
parent_id number constraint parent_pk primary key, 
father_name varchar2 (20) not null,
mother_name varchar2(20)not null,
address varchar2(50) not null,
Parent_contact number(10,0) unique,
email varchar2(30) unique
);

CREATE SEQUENCE  PARENT_SEQ  
START WITH 116
INCREMENT BY 1 
MINVALUE 0 
MAXVALUE 150
NOCACHE 
NOORDER  
NOCYCLE ;
--DROP SEQUENCE  PARENT_SEQ
--DELETE FROM Parent_details ;
--select parent_seq.nextval
--from dual;
--ALTER SEQUENCE  PARENT_SEQ MAXVALUE 150 NOCACHE;

insert into Parent_details values(PARENT_SEQ.NEXTVAL, 'Vishal','Sharada', 'Tathwade',9765285070,'sv@gmail.com');
insert into Parent_details values (PARENT_SEQ.NEXTVAL, 'Swapnil','Nanda', 'Balewadi',9977554433,'ss@gmail.com');
insert into Parent_details values (PARENT_SEQ.NEXTVAL, 'Amit','Sangita','Baner',9764322411,'as@gmail.com');
insert into Parent_details values (PARENT_SEQ.NEXTVAL, 'Pramod','Smita', 'Jupiter',9744553321,'ps@gmail.com');
insert into Parent_details values (PARENT_SEQ.NEXTVAL, 'Prsad','Sarika', 'Balewadi',9723553321,'psp@gmail.com');
insert into Parent_details values (PARENT_SEQ.NEXTVAL, 'Vasant','Rajashree', 'Balewadi',9787523321,'vr@gmail.com');
insert into Parent_details values (PARENT_SEQ.NEXTVAL, 'Mahesh','Swati', 'Wakad',9712343321,'ms@gmail.com');
insert into Parent_details values (PARENT_SEQ.NEXTVAL, 'Prathamesh','Juily', 'Baner',9005533211,'pj@gmail.com');
insert into Parent_details values (PARENT_SEQ.NEXTVAL, 'Ranvir','Deepika', 'Dange_Chowk',9850020010,'rd@gmail.com');
insert into Parent_details values (PARENT_SEQ.NEXTVAL, 'Swapnil','Namita', 'Baner',9994453321,'sn@gmail.com');
insert into Parent_details values (PARENT_SEQ.NEXTVAL, 'Ganesh','Vrunda', 'Hinjewadi',9694458721,'gv@gmail.com');
insert into Parent_details values (PARENT_SEQ.NEXTVAL, 'Pravin','Arati', 'Punawale',9687643212,'pa@gmail.com');
insert into Parent_details values (PARENT_SEQ.NEXTVAL, 'Sushant','Monika', 'Wakad',9764453721,'sm@gmail.com');
insert into Parent_details values (PARENT_SEQ.NEXTVAL, 'Akshay','Radhika', 'Baner',8994455429,'ar@gmail.com');
insert into Parent_details values (PARENT_SEQ.NEXTVAL, 'Malhar','Jeeja', 'Punawale',9876253022,'mj@gmail.com');
insert into Parent_details values (PARENT_SEQ.NEXTVAL, 'Shubham','Sharda', 'Baner',9872553022,'sS@gmail.com');
insert into Parent_details values (PARENT_SEQ.NEXTVAL, 'Chetna','Mangesh', 'Punawale',9872557896,'CM@gmail.com');

SELECT * FROM PARENT_DETAILS;  

SELECT PARENT_SEQ.CURRVAL
FROM DUAL;

select * from user_sequences where sequence_name = 'PARENT_SEQ';
-------------------------------------------------------------------------------------------------
--TEACHER_TABLE

create table teacher(
teacher_id number(3,0) constraint teach_pk primary key,
first_name varchar2(20) not null,
last_name varchar2(20)not null,
email varchar2(20)unique,
salary number(6,0) not null, check (salary > 6000),
phone_number number unique,
address varchar2(50)not null
);


CREATE SEQUENCE  TEACHER_SEQ  
START WITH 501
INCREMENT BY 1 
MINVALUE 0 
MAXVALUE 510
NOCACHE 
NOORDER  
NOCYCLE ;

insert into teacher values(TEACHER_SEQ.NEXTVAL,'Disha', 'Thorat', 'dt@gmail.com',10000, 9121050010, 'Hinjewadi');
insert into teacher values(TEACHER_SEQ.NEXTVAL,'Arati', 'Mane', 'am@gmail.com',9000, 8180830219, 'Punawale');
insert into teacher values(TEACHER_SEQ.NEXTVAL,'Vrunda', 'Jadhav', 'vj@gmail.com',12000, 8066543210, 'Baner');
insert into teacher values(TEACHER_SEQ.NEXTVAL,'Neha', 'Sawale', 'ns@gmail.com',8000, 7655432217, 'Tathawade');
---------------------------------------------------------------------------------------------
--CLASS_TABLE

create table class(
class_id  varchar2(20)  constraint cls_pk primary key,
class_name varchar2(20),
start_age number (2,0) not null,
end_age number (2,0) not null,
teach_id number (3,0),
constraint teach_fk foreign key (teach_id) references teacher(teacher_id)
on delete set null
);

CREATE SEQUENCE CLASS_SEQ  
MINVALUE 0 
MAXVALUE 10 
INCREMENT BY 1 
START WITH 4
CACHE 20 
NOORDER  
NOCYCLE ;
--DROP SEQUENCE CLASS_SEQ ;


insert into class values('C'||CLASS_SEQ.NEXTVAL,'Infants',06,12,501);
insert into class values('C'||CLASS_SEQ.NEXTVAL,'Toddlers',12,24,502);
insert into class values('C'||CLASS_SEQ.NEXTVAL,'Preschoolers',24,48,503);
INSERT INTO CLASS VALUES('C'||CLASS_SEQ .NEXTVAL,NULL,48,60,504);

--SELECT * FROM CLASS;
---------------------------------------------------------------------------------------
--CHILD_DETAIL_TABLE
create table CHILD_DETAIL(
child_id varchar2(20) CONSTRAINT CHILD_PK PRIMARY KEY,
cls_id varchar2 (20),
constraint cls_fk foreign key (cls_id) references class (class_id)on delete set null,
first_name varchar2(20)not null,
last_name varchar2(20)not null,
gender varchar2(1)not null,
date_of_birth date,
Par_id number (3,0) ,
constraint parent_fk foreign key (Par_id) references Parent_details(parent_id)
on delete set null
);
----drop table CHILD_DETAIL;
--
----DELETE FROM child_detail;
--
INSERT  INTO child_detail VALUES('I1','C1','Amit','Patole','M','10-10-21',101);
INSERT  INTO child_detail VALUES('P1','C3','Swapnil','Mane','M','01-12-18',102);
INSERT  INTO child_detail VALUES('I2','C1','Akshay','Shinde','M','02-12-21',109);
INSERT  INTO child_detail VALUES('P2','C3','Malhar','Rane','M','02-05-19',113);
INSERT  INTO child_detail VALUES('P3','C3','Vaibhav','Shinde','M','18-10-19',103);
INSERT  INTO child_detail VALUES('T1','C2','Reshma','Salunke','F','03-03-21',114);
INSERT  INTO child_detail VALUES('T2','C2','Priya','Mane','F','01-02-21',106);
INSERT  INTO child_detail VALUES('T3','C2','Surabhi','Jadhav','F','09-06-21',104);
INSERT  INTO child_detail VALUES('I3','C1','Priya','Jadhav','F','05-02-22',110);
INSERT  INTO child_detail VALUES('I4','C1','Sachin','Adhav','M','15-01-22',111);
INSERT  INTO child_detail VALUES('T4','C2','Pramod','Mangale','M','21-09-21',105);
INSERT  INTO child_detail VALUES('P4','C3','Jay','Kakade','M','30-11-19',115);
INSERT  INTO child_detail VALUES('P5','C3','Neena','Sangale','F','05-05-20',107);
INSERT  INTO child_detail VALUES('I5','C1','Pratiksha','Mule','F','01-03-22',108);
INSERT  INTO child_detail VALUES('T5','C2','Kachan','Kul','F','01-10-20',112);
--
select * from child_detail;
--------------------------------------------------------------------------------------
----PAYMENT_TABLE
Create Table Payment(
Pay_Id  Varchar2(10) Constraint Pay_Pk Primary Key,
Amount Number(5,0) Not Null,
Paid_Amount number Not Null ,
Due_Amount number Null,
Paid_Date date not null,
C_Id Varchar2(20), 
Constraint Ch_Fk Foreign Key (C_Id) References Child_Detail (Child_Id)
On Delete Set Null
);

ALTER TABLE PAYMENT MODIFY Due_Amount NULL;
--
SELECT * FROM PAYMENT;
TRUNCATE TABLE PAYMENT;
--DROP TABLE PAYMENT;
--
CREATE SEQUENCE PAYMENT_SEQ  
MINVALUE 1 
MAXVALUE 1100
INCREMENT BY 1 
START WITH 1000
CACHE 20 
NOORDER  
NOCYCLE ;
--DROP SEQUENCE PAYMENT_SEQ;
DROP SEQUENCE PAYMENT_SEQ;

SELECT PAYMENT_SEQ.CURRVAL
FROM DUAL;

--TRUNCATE TABLE PAYMENT; 
INSERT INTO PAYMENT VALUES('P'||PAYMENT_SEQ.NEXTVAL,15000,15000,0000,'01-09-2022','I2');
INSERT INTO PAYMENT VALUES('P'||PAYMENT_SEQ.NEXTVAL,15000,10000,5000,'08-09-2022','I1');
INSERT INTO PAYMENT VALUES('P'||PAYMENT_SEQ.NEXTVAL,25000,15000,10000,'02-09-2022','P1');
INSERT INTO PAYMENT VALUES('P'||PAYMENT_SEQ.NEXTVAL,25000,5000,20000,'03-09-2022','P2');
INSERT INTO PAYMENT VALUES('P'||PAYMENT_SEQ.NEXTVAL,25000,25000,0000,'02-09-2022','P3');
INSERT INTO PAYMENT VALUES('P'||PAYMENT_SEQ.NEXTVAL,20000,10000,10000,'08-09-2022','T1');
INSERT INTO PAYMENT VALUES('P'||PAYMENT_SEQ.NEXTVAL,20000,20000,0000,'05-09-2022','T2');
INSERT INTO PAYMENT VALUES('P'||PAYMENT_SEQ.NEXTVAL,20000,20000,0000,'03-09-2022','T3');
INSERT INTO PAYMENT VALUES('P'||PAYMENT_SEQ.NEXTVAL,15000,10000,5000,'07-09-2022','I4');
INSERT INTO PAYMENT VALUES('P'||PAYMENT_SEQ.NEXTVAL,20000,10000,10000,'04-09-2022','T4');
INSERT INTO PAYMENT VALUES('P'||PAYMENT_SEQ.NEXTVAL,25000,10000,15000,'05-09-2022','P4');
INSERT INTO PAYMENT VALUES('P'||PAYMENT_SEQ.NEXTVAL,25000,24000,1000,'05-09-2022','P5');
INSERT INTO PAYMENT VALUES('P'||PAYMENT_SEQ.NEXTVAL,15000,15000,0000,'10-09-2022','I5');
INSERT INTO PAYMENT VALUES('P'||PAYMENT_SEQ.NEXTVAL,20000,14000,6000,'09-09-2022','T5');
INSERT INTO PAYMENT VALUES('P'||PAYMENT_SEQ.NEXTVAL,15000,15000,0000,'08-09-2022','I3');

SELECT * FROM PAYMENT;


--
SELECT * FROM PAYMENT;
---------------------------------------------------------------------------------------------
--ATTENDENCE_TABLE
create table Attendance (
attendance_date date,
c_id varchar2(20),
constraint c_fk foreign key (c_id) references CHILD_DETAIL (child_id)on delete set null,
CONSTRAINT date_child_pk primary key (attendance_date,c_id),
child_status varchar2(10),
teacher_id number,
teacher_status varchar2(10)
);


--
--
CREATE SEQUENCE Attendance_SEQ
START WITH 1
INCREMENT BY 1 
MINVALUE 1 
MAXVALUE 30
NOCACHE    
CYCLE ;
--DROP SEQUENCE Attendance_SEQ;
SELECT * FROM Attendance;
--DELETE FROM Attendance;
---------------------------26-09-22(FIRST DAY)----------------------)

--------------------------------FIRST WEEK------------------------------------------                                                                                                                                                        
--
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.NEXTVAL,'I1','P',501,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'I2','P',501,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'I3','P',501,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'I4','A',501,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'I5','P',501,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'T1','P',502,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'T2','P',502,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'T3','P',502,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'T4','P',502,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'T5','P',502,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'P1','P',503,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'P2','P',503,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'P3','P',503,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'P4','P',503,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'P5','P',503,'P');

SELECT * FROM Attendance;
--
-----------------------------------27-09-22(SECOND DAY)----------------
--
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.NEXTVAL,'I1','P',501,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'I2','P',501,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'I3','P',501,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'I4','P',501,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'I5','P',501,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'T1','P',502,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'T2','P',502,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'T3','P',502,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'T4','A',502,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'T5','P',502,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'P1','P',503,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'P2','P',503,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'P3','A',503,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'P4','P',503,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'P5','P',503,'P');

----------------------------------28-09-22(THIRD DAY)------------------
--
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.NEXTVAL,'I1','P',501,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'I2','P',501,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'I3','P',501,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'I4','P',501,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'I5','P',501,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'T1','P',502,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'T2','P',502,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'T3','P',502,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'T4','P',502,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'T5','P',502,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'P1','P',503,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'P2','P',503,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'P3','P',503,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'P4','P',503,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'P5','P',503,'P');



-------------------------29-09-2022(FOURTH DAY)----------------------------------
--
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.NEXTVAL,'I1','P',501,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'I2','P',501,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'I3','P',501,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'I4','P',501,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'I5','P',501,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'T1','P',502,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'T2','P',502,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'T3','P',502,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'T4','P',502,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'T5','P',502,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'P1','P',503,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'P2','P',503,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'P3','P',503,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'P4','P',503,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'P5','P',503,'P');

-------------------------30-09-2022(FIFTH DAY)----------------------------------


INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.NEXTVAL,'I1','A',501,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'I2','P',501,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'I3','P',501,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'I4','P',501,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'I5','P',501,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'T1','P',502,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'T2','P',502,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'T3','P',502,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'T4','P',502,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'T5','P',502,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'P1','P',503,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'P2','P',503,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'P3','P',503,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'P4','P',503,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'P5','P',503,'P');
----------------------------01-10-2022(SIX DAY)--------------------------
--
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.NEXTVAL,'I1','P',501,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'I2','P',501,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'I3','P',501,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'I4','P',501,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'I5','P',501,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'T1','P',502,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'T2','P',502,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'T3','P',502,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'T4','P',502,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'T5','P',502,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'P1','P',503,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'P2','P',503,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'P3','P',503,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'P4','P',503,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'P5','P',503,'P');


--SELECT Attendance_SEQ.NEXTVAL FROM DUAL;
SELECT * FROM Attendance;
------------------------SECOND WEEK-------------------------------------------


--
--
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.NEXTVAL,'I1','P',504,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'I2','P',504,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'I3','P',504,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'I4','P',504,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'I5','P',504,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'T1','P',502,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'T2','P',502,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'T3','P',502,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'T4','P',502,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'T5','P',502,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'P1','P',503,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'P2','A',503,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'P3','P',503,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'P4','P',503,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'P5','P',503,'P');
--
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.NEXTVAL,'I1','P',501,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'I2','P',501,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'I3','P',501,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'I4','P',501,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'I5','P',501,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'T1','P',502,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'T2','P',502,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'T3','P',502,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'T4','P',502,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'T5','P',502,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'P1','P',503,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'P2','P',503,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'P3','P',503,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'P4','P',503,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'P5','P',503,'P');
--
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.NEXTVAL,'I1','P',501,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'I2','A',501,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'I3','P',501,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'I4','P',501,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'I5','P',501,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'T1','P',502,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'T2','P',502,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'T3','P',502,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'T4','P',502,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'T5','P',502,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'P1','P',503,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'P2','P',503,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'P3','P',503,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'P4','A',503,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'P5','P',503,'P');
--
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.NEXTVAL,'I1','P',501,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'I2','P',501,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'I3','P',501,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'I4','P',501,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'I5','P',501,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'T1','P',502,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'T2','P',502,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'T3','P',502,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'T4','P',502,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'T5','P',502,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'P1','P',503,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'P2','P',503,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'P3','P',503,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'P4','P',503,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'P5','P',503,'P');
--
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.NEXTVAL,'I1','P',501,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'I2','P',501,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'I3','P',501,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'I4','P',501,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'I5','P',501,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'T1','P',502,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'T2','P',502,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'T3','P',502,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'T4','P',502,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'T5','P',502,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'P1','P',503,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'P2','P',503,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'P3','P',503,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'P4','P',503,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'P5','P',503,'P');
--
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.NEXTVAL,'I1','P',501,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'I2','P',501,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'I3','P',501,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'I4','P',501,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'I5','P',501,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'T1','P',502,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'T2','P',502,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'T3','P',502,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'T4','P',502,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'T5','P',502,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'P1','P',503,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'P2','P',503,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'P3','A',503,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'P4','P',503,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'P5','P',503,'P');

--SELECT Attendance_SEQ.NEXTVAL FROM DUAL;
SELECT * FROM Attendance;

----------------------02-02-2022(THIRD WEEK)------------------------------------------
--
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.NEXTVAL,'I1','P',504,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'I2','P',504,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'I3','P',504,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'I4','P',504,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'I5','P',504,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'T1','A',502,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'T2','P',502,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'T3','P',502,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'T4','P',502,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'T5','P',502,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'P1','P',503,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'P2','p',503,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'P3','P',503,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'P4','P',503,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'P5','P',503,'P');
--
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.NEXTVAL,'I1','P',501,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'I2','P',501,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'I3','P',501,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'I4','P',501,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'I5','P',501,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'T1','P',502,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'T2','P',502,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'T3','P',502,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'T4','P',502,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'T5','P',502,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'P1','P',503,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'P2','P',503,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'P3','P',503,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'P4','P',503,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'P5','P',503,'P');
--
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.NEXTVAL,'I1','P',501,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'I2','p',501,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'I3','P',501,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'I4','P',501,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'I5','P',501,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'T1','P',502,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'T2','P',502,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'T3','P',502,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'T4','P',502,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'T5','P',502,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'P1','P',503,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'P2','P',503,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'P3','P',503,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'P4','p',503,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'P5','P',503,'P');
--
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.NEXTVAL,'I1','P',501,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'I2','P',501,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'I3','P',501,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'I4','P',501,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'I5','P',501,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'T1','P',502,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'T2','P',502,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'T3','P',502,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'T4','P',502,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'T5','A',502,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'P1','A',504,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'P2','P',504,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'P3','P',504,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'P4','P',504,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'P5','P',504,'P');
--
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.NEXTVAL,'I1','P',501,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'I2','P',501,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'I3','P',501,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'I4','P',501,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'I5','P',501,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'T1','A',504,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'T2','P',504,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'T3','P',504,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'T4','P',504,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'T5','P',504,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'P1','P',503,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'P2','P',503,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'P3','P',503,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'P4','P',503,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'P5','P',503,'P');
-
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.NEXTVAL,'I1','P',501,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'I2','A',501,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'I3','P',501,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'I4','P',501,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'I5','P',501,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'T1','P',502,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'T2','P',502,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'T3','P',502,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'T4','P',502,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'T5','P',502,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'P1','P',503,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'P2','P',503,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'P3','P',503,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'P4','P',503,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'P5','P',503,'P');
--
--
----SELECT Attendance_SEQ.NEXTVAL FROM DUAL;
SELECT * FROM Attendance;

---------------------------------WEEK FOURTH ----------------------------
--
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.NEXTVAL,'I1','P',501,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'I2','A',501,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'I3','P',501,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'I4','P',501,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'I5','P',501,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'T1','P',502,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'T2','P',502,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'T3','P',502,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'T4','P',502,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'T5','P',502,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'P1','P',503,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'P2','p',503,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'P3','A',503,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'P4','P',503,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'P5','P',503,'P');
--
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.NEXTVAL,'I1','P',501,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'I2','P',501,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'I3','P',501,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'I4','P',501,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'I5','P',501,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'T1','P',502,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'T2','P',502,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'T3','P',502,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'T4','P',502,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'T5','P',502,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'P1','P',503,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'P2','P',503,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'P3','P',503,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'P4','P',503,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'P5','P',503,'P');
--
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.NEXTVAL,'I1','P',501,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'I2','p',501,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'I3','P',501,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'I4','A',501,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'I5','P',501,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'T1','P',502,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'T2','P',502,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'T3','P',502,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'T4','P',502,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'T5','P',502,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'P1','P',503,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'P2','P',503,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'P3','P',503,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'P4','p',503,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'P5','P',503,'P');
--
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.NEXTVAL,'I1','P',501,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'I2','P',501,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'I3','P',501,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'I4','P',501,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'I5','P',501,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'T1','P',502,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'T2','P',502,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'T3','P',502,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'T4','P',502,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'T5','A',502,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'P1','A',504,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'P2','P',504,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'P3','P',504,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'P4','P',504,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'P5','A',504,'P');
--
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.NEXTVAL,'I1','P',501,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'I2','P',501,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'I3','P',501,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'I4','P',501,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'I5','P',501,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'T1','A',504,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'T2','P',504,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'T3','P',504,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'T4','P',504,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'T5','P',504,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'P1','P',503,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'P2','P',503,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'P3','P',503,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'P4','A',503,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'P5','P',503,'P');
--
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.NEXTVAL,'I1','P',501,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'I2','A',501,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'I3','P',501,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'I4','P',501,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'I5','P',501,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'T1','P',502,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'T2','P',502,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'T3','P',502,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'T4','P',502,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'T5','P',502,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'P1','P',504,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'P2','P',504,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'P3','P',504,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'P4','P',504,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'P5','P',504,'P');
--
----SELECT Attendance_SEQ.NEXTVAL FROM DUAL;
--
--
--------------------------------FIFTH WEEK--------------------------------------
--
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.NEXTVAL,'I1','P',501,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'I2','P',501,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'I3','P',501,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'I4','P',501,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'I5','P',501,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'T1','P',502,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'T2','P',502,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'T3','P',502,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'T4','P',502,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'T5','P',502,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'P1','P',503,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'P2','P',503,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'P3','P',503,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'P4','P',503,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'P5','P',503,'P');
-
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.NEXTVAL,'I1','P',501,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'I2','A',501,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'I3','P',501,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'I4','P',501,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'I5','P',501,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'T1','P',502,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'T2','P',502,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'T3','P',502,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'T4','P',502,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'T5','P',502,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'P1','P',503,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'P2','P',503,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'P3','P',503,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'P4','P',503,'P');
INSERT INTO Attendance VALUES((SYSDATE) + Attendance_SEQ.CURRVAL,'P5','P',503,'P');


SELECT * FROM ATTENDANCE;
COMMIT;
--TRUNCATE TABLE Attendance;
