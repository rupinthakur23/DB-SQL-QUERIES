CREATE table EMPLOYEE(
Fname VARCHAR(15) NOT  NULL,
Minit VARCHAR(15),
Lname VARCHAR(15) NOT NULL,
Ssn CHAR(9) NOT NULL,
Bdate DATE,
Address VARCHAR(50),
Sex CHAR,
Salary DECIMAL(10,2),
Super_ssn CHAR(9),
DNO INT NOT NULL,
PRIMARY KEY(Ssn)
);


CREATE table DEPARTMENT(
Dname VARCHAR(15) NOT  NULL,
Dnumber INT NOT NULL,
Mgr_ssn CHAR(9) NOT NULL,
Mgr_start_date DATE,
PRIMARY KEY(Dnumber),
UNIQUE (Dname));


CREATE table DEPT_LOCATIONS(
Dnumber INT NOT NULL,
Dlocation VARCHAR(15) NOT NULL,
PRIMARY KEY (Dnumber, Dlocation),
FOREIGN KEY(Dnumber) REFERENCES DEPARTMENT(Dnumber));


CREATE table PROJECT(
Pname VARCHAR(20) NOT NULL,
Pnumber INT NOT NULL,
Plocation VARCHAR(15),
Dnum INT NOT NULL,
PRIMARY KEY(Pnumber),
UNIQUE(Pname),
FOREIGN KEY(Dnum) REFERENCES DEPARTMENT(Dnumber)); 


CREATE  table WORKS_ON (
Essn  CHAR(9) NOT NULL,
Pno INT NOT NULL,
Hours DECIMAL(3,1) NOT NULL,
PRIMARY KEY(Essn, Pno),
FOREIGN KEY(Essn) REFERENCES EMPLOYEE(Ssn),
FOREIGN KEY(Pno) REFERENCES PROJECT(Pnumber));

CREATE table DEPENDENT(
Essn CHAR(9) NOT NULL,
Dependent_name VARCHAR(15) NOT NULL,
Sex CHAR,
Bdate DATE,
RELARTIONSHIP VARCHAR(8),
PRIMARY KEY(Essn, Dependent_name),
FOREIGN KEY(Essn) REFERENCES EMPLOYEE(Ssn));

Select * from employee;

Select * from department;
Select * from dept_locations;
Select * from works_on;
Select * from project;
Select * from dependent;

SELECT PNUMBER,PNAME,PLOCATION,COUNT(*) AS NO_OF_EMP
FROM PROJECT ,WORKS_ON
WHERE PNUMBER=PNO
GROUP BY PNUMBER;

select lname,fname
from employee where ssn in(

select essn from works_on
GROUP BY essn
having sum(hours)>40);

select essn from works_on
GROUP BY essn
having sum(hours)>40;



select e.fname,e.lname,count(*) as countofemp

from employee e

where e.super_ssn
in(
select e.super_ssn 
from    employee  s 
where  e.super_ssn = s.ssn)

GROUP by e.super_ssn
; 


SELECT P.PNAME,SUM(HOURS)FROM PROJECT P,
 WORKS_ON W WHERE P.PNUMBER=W.PNO GROUP BY P.PNAME;
 
 
 SELECT FNAME, LNAME
FROM EMPLOYEE
WHERE SSN
IN (SELECT Distinct(ESSN)
FROM DEPENDENT
Group By ESSN
Having count(ESSN) > 2);


select PNUMBER,pname,plocation,count(*)
from project,works_on
where PNUMBER=works_on.pno
group by PNUMBER,pname,plocation;


SELECT FNAME, LNAME
FROM EMPLOYEE,DEPENDENT
WHERE SSN = ESSN and relartionship='Children'
group by FNAME,Lname
having count(*)>1
;

SELECT E.Fname,E.Lname
FROM EMPLOYEE E, DEPARTMENT D,dept_locations f
WHERE E.Dno=D.Dnumber and d.dnumber=f.dnumber
	AND f.Dlocation='Atlanta';

SELECT Dname, count(*)
from  dept_locations e, department d,project p
where dlocation='Houston' and e.dnumber=d.dnumber and p.dnum=d.dnumber
group by Dname;


SELECT e.Ssn,e.fname,e.lname,p.Pnumber,p.pname,w.hours
from employee e, dept_locations d,works_on w,project p
where e.dno=d.dnumber and e.ssn=w.essn and w.pno=p.pnumber and d.dlocation='Houston' and d.dnumber=5;



select e.super_ssn
from   employee  e, employee  s
where  e.super_ssn = s.ssn
GROUP BY e.super_ssn;

SELECT *
FROM EMPLOYEE
WHERE SUPER_SSN IN
(select *
from employee 
where SSN
IN (select DISTINCT(super_ssn), count(*)
    FROM EMPLOYEE
    GROUP BY super_ssn));

SELECT fname, lname, num_of_employees FROM    
(SELECT super_ssn as ssn, count(*) as num_of_employees
FROM EMPLOYEE e1
GROUP BY super_ssn) t1
LEFT JOIN
(SELECT ssn, fname, Lname
        FROM EMPLOYEE
        WHERE ssn 
        IN (SELECT DISTINCT super_ssn
            FROM EMPLOYEE) ) t2
ON t1.ssn = t2.ssn;

SELECT * FROM employee 
where super_SSN is NULL;
    
SELECT employee.fname
FROM EMPLOYEE e
where 



select e.ssn,e.fname,e.lname 
from employee e , works_on w where
e.ssn=w.essn
group by e.ssn,e.fname,e.lname 
having count(w.pno)>1


delete from department;
desc employee;

select e.ssn,e.fname,e.lname 
from employee e , works_on w where
e.ssn=w.essn
group by e.ssn,e.fname,e.lname 
having count(w.pno)>1


delete from department;


delete from works_on;


delete from dependent;

delete from employee;

insert into employee values ('James', 'E', 'Jordan', '888665151', '10-NOV-1927', '450 Stone,Houston,TX', 'M', 55000, null, 1);

alter table department drop constraint SYS_C007284;
alter table employee add (foreign key(super_ssn) references  employee (ssn) on delete SET null) ;
ALTER TABLE EMPLOYEE 
ADD 
(FOREIGN KEY(dno) REFERENCES  Department (dnumber) ON DELETE SET NULL) ;




