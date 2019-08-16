
Error starting at line : 4 in command -
INSERT INTO DEPARTMENT(Dname,Dnumber,mgr_ssn,mgr_start_date)
VALUES('SCIENCE', NULL,999999999,1981-08-10)
Error at Command Line : 5 Column : 41
Error report -
SQL Error: ORA-00932: inconsistent datatypes: expected DATE got NUMBER
00932. 00000 -  "inconsistent datatypes: expected %s got %s"
*Cause:    
*Action:

Error starting at line : 4 in command -
INSERT INTO DEPARTMENT(Dname,Dnumber,mgr_ssn,mgr_start_date)
VALUES('SCIENCE', NULL,999999999,'10-NOV-1985')
Error report -
ORA-01400: cannot insert NULL into ("KUSH"."DEPARTMENT"."DNUMBER")


Error starting at line : 7 in command -
INSERT INTO DEPARTMENT(Dname,Dnumber,mgr_ssn,mgr_start_date)
VALUES('SCIENCE', 10,111111111,'10-NOV-1985')
Error report -
ORA-02291: integrity constraint (KUSH.SYS_C007287) violated - parent key not found


Error starting at line : 10 in command -
INSERT INTO DEPARTMENT(Dname,Dnumber,mgr_ssn,mgr_start_date)
VALUES('SCIENCE', 5,111111111,'10-NOV-1985')
Error report -
ORA-00001: unique constraint (KUSH.SYS_C007285) violated


Error starting at line : 16 in command -
DELETE FROM DEPARTMENT
WHERE Dnumer=5
Error at Command Line : 17 Column : 7
Error report -
SQL Error: ORA-00904: "DNUMER": invalid identifier
00904. 00000 -  "%s: invalid identifier"
*Cause:    
*Action:

Error starting at line : 16 in command -
DELETE FROM DEPARTMENT
WHERE DnumBer=5
Error report -
ORA-01013: user requested cancel of current operation


Error starting at line : 18 in command -
DELETE FROM DEPARTMENT
WHERE DnumBer=5
Error report -
ORA-01013: user requested cancel of current operation


Error starting at line : 18 in command -
DELETE FROM PROJECT
WHERE Pnumber=7
Error report -
ORA-01013: user requested cancel of current operation


1 row inserted.


1 row inserted.


1 row inserted.


Error starting at line : 21 in command -
INSERT INTO DEPARTMENT(Dname,Dnumber,mgr_ssn,mgr_start_date)
VALUES('SCIENCE', 101,666666613,'10-NOV-1985')
Error report -
ORA-00001: unique constraint (KUSH.SYS_C007286) violated


Error starting at line : 24 in command -
INSERT INTO PROJECT(Pname,Pnumber,Plocation,Dnum)
VALUES('abcd',13,'Ambala',101)
Error report -
ORA-00001: unique constraint (KUSH.SYS_C007295) violated


Error starting at line : 18 in command -
DELETE FROM PROJECT
WHERE Pnumber=7
Error report -
ORA-02292: integrity constraint (KUSH.SYS_C007303) violated - child record found


Error starting at line : 18 in command -
DELETE FROM PROJECT
WHERE Pnumber=7
Error report -
ORA-02292: integrity constraint (KUSH.SYS_C007303) violated - child record found


Error starting at line : 18 in command -
DELETE FROM PROJECT
WHERE Pnumber=7
Error report -
ORA-02292: integrity constraint (KUSH.SYS_C007303) violated - child record found

