SELECT *
FROM EMPLOYEE
WHERE Lname='Jones' OR Lname='James';


SELECT *
FROM EMPLOYEE
WHERE Fname='Kim' OR Fname='Wilson';







select e.ssn,e.fname,e.lname ,w.hours
from employee e , works_on w where
e.ssn=w.essn
group by e.ssn,e.fname,e.lname ,w.hours
having count(w.pno)>1;

SELECT PNUMBER,PNAME, plocation,COUNT(*) AS no_of_employees
FROM PROJECT ,WORKS_ON
WHERE PNUMBER=PNO
GROUP BY PNUMBER,PNAME, PLOCATION ;

SELECT e.Ssn,e.fname,e.lname,p.Pnumber,p.pname,w.hours
from employee e, dept_locations d,works_on w,project p
where e.dno=d.dnumber and e.ssn=w.essn and w.pno=p.pnumber and d.dlocation='Houston' and d.dnumber=5;

select lname,fname
from employee where ssn in(
select essn from works_on
GROUP BY essn
having sum(hours)>40);


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


SELECT P.PNAME,SUM(HOURS)FROM PROJECT P,
 WORKS_ON W WHERE P.PNUMBER=W.PNO GROUP BY P.PNAME;
 
 
 
 SELECT FNAME, LNAME
FROM EMPLOYEE
WHERE SSN
IN (SELECT Distinct(ESSN)
FROM DEPENDENT
Group By ESSN
Having count(ESSN) > 2);


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

