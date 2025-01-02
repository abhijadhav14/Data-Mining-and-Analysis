


drop table insure;
drop table insurance;
drop table Admission_Discharge_Patient;
drop table tests;
drop table ward;
drop table patient_prescription;
drop table patient;
drop table staff;
drop table job_designation;


create table job_designation(
job_id varchar2(20) primary key not null,
job_name varchar(25) not null,
shift varchar2(15),
year_of_experience int);

create table staff(
s_id varchar2(20) primary key not null,
s_fname varchar2(20),
s_lname varchar2(20),
date_of_emp date,
adrress varchar2(60),
phone_no varchar2(20),
job_id varchar2(20),
foreign key (job_id) references job_designation(job_id),
salary int);

create table patient(
p_id varchar2(20) primary key not null,
p_fname varchar2(20),
p_lname varchar2(20),
address varchar2(40),
phone_no varchar2(20),
email_id varchar2(20),
age int,
gender varchar2(8));

create table patient_prescription(
prec_id varchar2(20) primary key not null,
diagnosis varchar2(20),
medicine varchar2(20),
prec_date date,
s_id varchar2(20),
p_id varchar2(20),
foreign key (s_id) references staff(s_id),
foreign key (p_id) references patient(p_id));

create table ward(
w_no varchar2(20) primary key not null,
no_of_beds int,
phone_no varchar2(20),
s_id varchar2(20),
foreign key (s_id) references staff(s_id)
);

create table tests(
t_id varchar2(20) primary key not null,
t_name varchar2(20),
t_date date,
s_id varchar2(20),
foreign key (s_id) references staff(s_id),
prec_id varchar2(20),
foreign key (prec_id) references patient_prescription(prec_id));

create table Admission_Discharge_Patient(
id_no varchar2(20) not null,
p_id varchar2(20) not null,
primary key(id_no,p_id),
bed_no int,
w_no varchar2(20),
date_admitted date,
date_discharged date,
remarks varchar2(20));

create table insurance(
c_id varchar2(20) not null primary key,
c_name varchar2(20),
Contact_Fname varchar2(20),
Contact_Lname varchar2(20),
phone_no varchar2(20));

create table insure(
p_id varchar2(20) not null primary key,
c_id varchar2(20),
foreign key (c_id) references insurance(c_id),
insuranc_type varchar2(25),
amount int,
date_in date);

insert into job_designation values('jb01','physician','day','10');
insert into job_designation values('jb02','nurse','day','12');
insert into job_designation values('jb03','surgen','night','15');
insert into job_designation values('jb04','anthropologist',null,'05');
insert into job_designation values('jb05','ward boy','day','10');
insert into job_designation values('jb06','lab technician','day','18');
insert into job_designation values('jb07','radiologist','day','10');

insert into staff values('sf01','rohit','mishra','10-feb-1998','17th cross5th main jaynagar bangalore','9886256641','jb01','40000');
insert into staff values('sf02','pooja','mehta','23-jan-1995','vidyanagar hubli','9886257656','jb02','50000');
insert into staff values('sf03','anand','prakash','15-apr-1998','banshankri 2nd phase bangalore','9900692198','jb03','55000');
insert into staff values('sf04','prashant','patil','07-feb-1984','shirure park 2nd phase hubli','9900692199','jb01','35000');
insert into staff values('sf05','amit','kulkarni','10-sep-1984','malleshwaran bangalore','9900692099','jb04','30000');
insert into staff values('sf06','shruthi','shettar','27-feb-1976','gokulroad hubli','9944692099','jb02','40000');

insert into patient values('pt01','sonal','kulkarni','gokul road hubli','9844692099','sonal@gmail.com','23','female');
insert into patient values('pt02','saiprasad','bhat','madhura colony hubli','9844693099','prasad12@gmail.com','22','male');
insert into patient values('pt03','neha','patil','madhura colony hubli','7734693099','patil@rediff.com','25','female');
insert into patient values('pt04','anand','patil','maleshwaram 6th cross bangalore','6786534590','anand@rediff.com','25','male');

insert into ward values('wd01',2,'224651','sf06');
insert into ward values('wd02',2,'772934','sf01');
insert into ward values('wd03',2,'427654','sf02');
insert into ward values('wd04',3,'248403','sf06');

insert into patient_prescription values('pc01','malaria','luminal','12-jun-2000','sf01','pt01');
insert into patient_prescription values('pc02','jaundice','coartem','10-feb-1998','sf01','pt02');
insert into patient_prescription values('pc03','aids','ziagen','05-may-2005','sf05','pt01');
insert into patient_prescription values('pc04','fever','crocin plus','15-dec-2002','sf03','pt04');

insert into tests values('ts01','hb rbc','12-feb-2002','sf06','pc01');
insert into tests values('ts02','ct scan','12-dec-2009','sf05','pc02');
insert into tests values('ts03','mri scan','08-jan-2004','sf06','pc01');
insert into tests values('ts04','pathology','08-sep-1999','sf03','pc03');

insert into admission_discharge_patient values('ad01','pt01','1004','wd01','10-jun-2000','20-jul-2000','fit and fine');
insert into admission_discharge_patient values('ad02','pt02','1005','wd01','08-mar-1998','30-apr-1999','psrtially fit');
insert into admission_discharge_patient values('ad03','pt03','1006','wd02','01-jan-2000','30-jan-2000','wound healed');
insert into admission_discharge_patient values('ad04','pt04','1007','wd03','15-sep-1998','10-nov-2000','wound nothealed');

insert into insurance values('cp01','icici lombard','punith','kumar','9990068756');
insert into insurance values('cp02','bharti axis','amit','kumar','999006887');
insert into insurance values('cp03','national','ravi','patil','778906887');
insert into insurance values('cp04','reliance','pooja','kamat','778909879');


insert into insure values('pt01','cp01','accidential','100000','12-feb-2000');
insert into insure values('pt02','cp02','sick','20000','10-mar-1999');
insert into insure values('pt03','cp04','stroke','200000','15-nov-2004');
insert into insure values('pt04','cp04','paralysis','100000','10-feb-2010');
 
 commit


desc insurance;


select * from insurance;

select * from admission_discharge_patient;

select * from job_designation;

select * from tests;


Q1:
select p.* 
from patient p , tests t , patient_prescription pp 
where p.p_id = pp.p_id 
and pp.prec_id = t.prec_id 
and t.t_name like '%mri%' 
and t.t_date like '%-01-%';

select * from insure;

desc insure;

select * from patient p;

Q2:

desc patient_prescription;

select * from patient_prescription;

select * from patient;


select p.* 
from patient p , patient_prescription pp 
where p.p_id = pp.p_id 
and pp.diagnosis like '%malaria'
and pp.medicine is not null;


Q3:

select * from staff;

select * from job_designation;



select s_fname , s_lname , (1.1*salary)
from staff s , job_designation jd
where s.job_id = jd.job_id
and jd.job_name like '%physician%';


Q4:

select s_fname , salary
from staff s 
where s.s_fname like 's%';


Q5:

select * from ward;

select p.* 
from patient p , admission_discharge_patient adp , ward w
where p.p_id = adp.p_id 
and w.w_no in ('wd01' 'wd02' 'wd03') ; 


Q6: 

select * from staff;

select s.*
from staff s
where s.salary between 25000 and 45000;


Q7:

select * from patient;

select * from admission_discharge_patient;

select p.*
from patient p , admission_discharge_patient adp
where p.p_id = adp.p_id 
and adp.date_admitted between 


select s.*
from staff s
where s.salary not between 25000 and 45000;


select p.* 
from patient p , admission_discharge_patient adp , ward w
where p.p_id = adp.p_id 
and w.w_no not in ('wd01''wd02','wd03'); 


Q11:

select p_fname from patient
intersect 
select s_fname from staff;


Q12:

select * from staff;
select * from ward

select s.s_fname
from staff s , ward w
where s.s_id = w.s_id
union
select s.s_fname 
from staff s , tests t
where s.s_id = t.s_id;



Q13:

select * from staff;

select p.p_fname from patient p
minus
select s.s_fname from staff s,job_designation j
where j.job_id=s.job_id and j.job_name='physician';


Q13:

select * from patient;

select * from insure;
select * from insurance;


Q14:

select p.p_fname from patient p
where p.gender='female' 
intersect
select p.p_fname from patient p , insure i
where p.p_id=i.p_id and amount > 100000;


Q15:

select p.p_fname from patient p ,admission_discharge_patient adp
where p.p_id=adp.p_id
union
select p.p_fname from patient p , tests t ,patient_prescription pp
where p.p_id=pp.p_id and pp.prec_id=t.prec_id;


Q16:

select p.p_fname from patient p ,admission_discharge_patient adp
where p.p_id=adp.p_id
minus
select p.p_fname from patient p , tests t ,patient_prescription pp
where p.p_id=pp.p_id and pp.prec_id=t.prec_id;

Q21:

select s.s_fname , s.salary from staff s order by salary desc;

Q22:

select s.s_fname , s.salary , year_of_experience 
from staff s , job_designation j
where s.job_id = j.job_id order by j.year_of_experience desc;


Q23:

select count(*) from patient;


Q24:

select count(distinct s.salary) from staff s;


Q25:

select count(*) from patient p, admission_discharge_patient adp 
where adp.w_no='%02';


Q26:

select s.s_fname from staff s , job_designation j 
where 


Q27:

select sum(no_of_beds) as total


select job_id, sum(salary) from staff;


select job_id,sum(salary) from staff group by job_id having sum(salary) > 50000;

select max(salary) from staff;


select avg(s.salary) 
from staff s, job_designation j
where s.job_id = j.job_id and j.job_name = 'physician';


select p.p_id , count(t.t_id)
from tests t , patient p , patient_prescription pp
where p.p_id = pp.p_id and pp.prec_id = t.prec_id
group by p.p_id;


select *
from tests t , patient p , patient_prescription pp
where p.p_id = pp.p_id and pp.prec_id = t.prec_id;


select count(s.s_id) , j.job_id
from staff s , job_designation j
where s.job_id = j.job_id and j.shift like '%day%'
group by j.job_id;



select s.s_id , count(pp.p_id) , sum(i.amount)
from staff s , patient_prescription pp , insure i
where s.s_id = pp.s_id and pp.p_id = i.p_id
group by s.s_id;


select s.s_id , count(pp.p_id) , sum(i.amount)
from staff s , patient_prescription pp , insure i , job_designation j
where s.s_id = pp.s_id and pp.p_id = i.p_id and s.job_id = j.job_id and j.job_name like '%phy%'
group by s.s_id order by s.s_id;




select s.s_fname , count(pp.p_id)
from staff s , patient_prescription pp , job_designation j
where s.s_id = pp.s_id  and s.job_id = j.job_id and j.job_name like '%phy%'
group by s.s_fname having count(pp.p_id) >= 2;



select s.s_fname , count(t.t_id)
from staff s ,  tests t , patient_prescription pp
where s.s_id = pp.s_id and pp.prec_id = t.prec_id
group by s.s_fname 
having count(t.t_id) > 2;



select w.w_no , sum(adp.date_discharged - adp.date_admitted) days_occupied
from admission_discharge_patient adp  , ward w
where adp.w_no = w.w_no 
group by w.w_no
order by w.w_no;




select p.p_fname , count(c_id)
from patient p , insure i
where p.p_id=i.p_id 
group by p.p_fname
having i.c_id > 1;




select s.s_id , substr(date_admitted,4,3),count(adp.p_id)
from staff s , admission_discharge_patient adp , patient p , patient_prescription pp
where p.p_id = adp.p_id and p.p_id =
group by
order by;




select p.*
from patient p , patient_prescription pp , job_designation j , staff s
where p.p_id = pp.p_id and pp.s_id = s.s_id  and s.job_id = j.job_id and j.job_name like '%anth%';


select p.* 
from patient p , patient_prescription pp
where p.p_id = pp.p_id and s_id = (select s_id from job_designation j , staff s where s.job_id = j.job_id and job_name like '%anth%');



select s_id from job_designation j , staff s where s.job_id = j.job_id and job_name like '%anth%';








43:
select s.s_fname , s.s_lname
from staff s , job_designation j
where s.job_id = j.job_id and j.job_name like '%phy%' and s_id in (select s_id  from patient p , patient_prescription pp  where p.p_fname like '%sonal%' and p.p_id = pp.p_id );


select * from patient_prescription;

select * from patient;

select * from staff;

select * from job_designation;





44:

select p_fname 
from patient p 
where p.p_id in (select p_id from insure where c_id in (select c_id from insurance  where c_name like '%reli%'));


select * from insurance;

select * from insure;





45:

select *
from staff s, job_designation j
where s.job_id = j.job_id and  j.year_of_experience <= all  (select year_of_experience from job_designation j );


