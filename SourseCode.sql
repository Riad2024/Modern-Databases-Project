
--CPS541 
--Riad Hossain

set echo on;
set linesize 300;
set pagesize 250;

DROP TABLE EMPLOYEE cascade constraints;
--Creating EMPLOYEE Table
CREATE TABLE EMPLOYEE
 (Fname        VARCHAR2(12) NOT NULL,
  Minit        VARCHAR2(2),
  Lname        VARCHAR2(12) NOT NULL,
  Ssn          NUMBER(9) NOT NULL,
  Bdate        DATE,
  Address      VARCHAR2(30),
  Sex          VARCHAR2(1),
  Salary       NUMBER(7) NOT NULL,
  Super_ssn    NUMBER(9),
  Dno          NUMBER(1) NOT NULL,
  PRIMARY KEY (Ssn));

INSERT INTO EMPLOYEE
  VALUES('John', 'B', 'Smith', 123456789, '09 Jan, 1965', '731 Fondren, Houston, TX', 'M', 30000, 333445555, 5);
INSERT INTO EMPLOYEE
  VALUES('Franklin', 'T', 'Wong', 333445555, '08 Dec, 1955', '638 Voss, Houston, TX', 'M', 40000, 888665555, 5);
INSERT INTO EMPLOYEE
  VALUES('Alicia', 'J', 'Zelaya', 999887777, '19 Jan, 1968', '3321 Castle, Spring, TX', 'F', 25000, 987654321, 4);
INSERT INTO EMPLOYEE
  VALUES('Jennifer', 'S', 'Wallace', 987654321, '20 Jun, 1941', '291 Berry, Bellaire, TX', 'F', 43000, 888665555, 4);
INSERT INTO EMPLOYEE
  VALUES('Ramesh', 'K', 'Narayan', 666884444, '15 Sep, 1962', '975 Fire Oak, Humble, TX', 'M', 38000, 333445555, 5);
INSERT INTO EMPLOYEE
  VALUES('Joyce', 'A', 'English', 453453453, '31 Jul, 1972', '5631 Rice, Houston, TX', 'F', 25000, 333445555, 5);
INSERT INTO EMPLOYEE
  VALUES('Ahmad', 'V', 'Jabbar', 987987987, '29 Mar, 1969', '980 Dallas, Houston, TX', 'M', 25000, 987654321, 4);
INSERT INTO EMPLOYEE
  VALUES('James', 'E', 'Borg', 888665555, '10 Nov, 1937', '450 Stone, Houston, TX', 'M', 55000, NULL, 1);

DROP TABLE DEPARTMENT cascade constraints;
--Creating DEPARTMENT Table
CREATE TABLE DEPARTMENT(
  Dname              VARCHAR2(15) NOT NULL,
  Dnumber            NUMBER(2)  NOT NULL,
  Mgr_ssn            NUMBER(9),
  Mgr_start_date     DATE,
  PRIMARY KEY (Dnumber),
  UNIQUE (Dname),
  FOREIGN KEY (Mgr_ssn) REFERENCES EMPLOYEE(Ssn));

INSERT INTO DEPARTMENT
  VALUES('Research', 5, 333445555, '22 May, 1988');
INSERT INTO DEPARTMENT
  VALUES('Administration', 4, 987654321, '01 Jan, 1995');
INSERT INTO DEPARTMENT
  VALUES('Headquarters', 1, 888665555, '19 Jun, 1981');

DROP TABLE DEPT_LOCATION cascade constraints;
--Creating DEPT_LOCATION Table
CREATE TABLE DEPT_LOCATION(
  Dnumber          NUMBER(2)  NOT NULL,
  Dlocation        VARCHAR2(15)  NOT NULL,
  PRIMARY KEY (Dnumber, Dlocation),
  FOREIGN KEY (Dnumber) REFERENCES DEPARTMENT(Dnumber));

INSERT INTO DEPT_LOCATION
  VALUES(1, 'Houston');
INSERT INTO DEPT_LOCATION
  VALUES(4, 'Stafford');
INSERT INTO DEPT_LOCATION
  VALUES(5, 'Bellaire');
INSERT INTO DEPT_LOCATION
  VALUES(5, 'Sugarland');
INSERT INTO DEPT_LOCATION
  VALUES(5, 'Houston');

  DROP TABLE PROJECT cascade constraints;
--Creating PROJECT Table
CREATE TABLE PROJECT(
  Pname           VARCHAR2(15) NOT NULL,
  Pnumber         NUMBER(4)  NOT NULL,
  Plocation       VARCHAR2(15)  NOT NULL,
  Dnum            NUMBER(2)  NOT NULL,
  PRIMARY KEY (Pnumber),
  UNIQUE (Pname),
  FOREIGN KEY (Dnum) REFERENCES DEPARTMENT(Dnumber));

INSERT INTO PROJECT
  VALUES('ProductX', 1, 'Bellaire', 5);
INSERT INTO PROJECT
  VALUES('ProductY', 2, 'Sugarland', 5);
INSERT INTO PROJECT
  VALUES('ProductZ', 3, 'Houston', 5);
INSERT INTO PROJECT
  VALUES('Computerization', 10, 'Stafford', 4);
INSERT INTO PROJECT
  VALUES('Reorganization', 20, 'Houston', 1);
INSERT INTO PROJECT
  VALUES('Newbenefits', 30, 'Stafford', 4);

DROP TABLE WORKS_ON cascade constraints;
--Creating WORKS_ON Table
CREATE TABLE WORKS_ON(
  Essn       NUMBER(9) NOT NULL,
  Pno        NUMBER(2) NOT NULL,
  Hours      FLOAT(6),
  PRIMARY KEY (Essn, Pno),
  FOREIGN KEY (Essn) REFERENCES EMPLOYEE(Ssn),
  FOREIGN KEY (Pno) REFERENCES PROJECT(Pnumber));

INSERT INTO WORKS_ON
  VALUES(123456789, 1, 32.5);
INSERT INTO WORKS_ON
  VALUES(123456789, 2, 7.5);
INSERT INTO WORKS_ON
  VALUES(666884444, 3, 40.0);
INSERT INTO WORKS_ON
  VALUES(453453453, 1, 20.0);
INSERT INTO WORKS_ON
  VALUES(453453453, 2, 20.0);
INSERT INTO WORKS_ON
  VALUES(333445555, 2, 10.0);
INSERT INTO WORKS_ON
  VALUES(333445555, 3, 10.0);
INSERT INTO WORKS_ON
  VALUES(333445555, 10, 10.0);
INSERT INTO WORKS_ON
  VALUES(333445555, 20, 10.0);
INSERT INTO WORKS_ON
  VALUES(999887777, 30, 30.0);
INSERT INTO WORKS_ON
  VALUES(999887777, 10, 10.0);
INSERT INTO WORKS_ON
  VALUES(987987987, 10, 35.0);
INSERT INTO WORKS_ON
  VALUES(987987987, 30, 5.0);
INSERT INTO WORKS_ON
  VALUES(987654321, 30, 20.0);
INSERT INTO WORKS_ON
  VALUES(987654321, 20, 15.0);
INSERT INTO WORKS_ON
  VALUES(888665555, 20, NULL);



DROP TABLE DEPENDENT cascade constraints;
--Creating DEPENDENT Table
CREATE TABLE DEPENDENT(
  Essn             NUMBER(9) NOT NULL,
  Dependent_name   VARCHAR2(12) NOT NULL,
  Sex              VARCHAR2(1),
  Bdate            DATE,
  Relationship     VARCHAR2(12),
  PRIMARY KEY (Essn, Dependent_name),
  FOREIGN KEY (Essn) REFERENCES EMLPOYEE(Ssn));

INSERT INTO DEPENDENT
  VALUES(333445555, 'Alice', 'F', '05 Apr, 1986', 'Daughter');
INSERT INTO DEPENDENT
  VALUES(333445555, 'Theodore', 'M', '25 Oct, 1983', 'Son');
INSERT INTO DEPENDENT
  VALUES(333445555, 'Joy', 'F', '03 May, 1958', 'Spouse');
INSERT INTO DEPENDENT
  VALUES(987654321, 'Abner', 'M', '28 Feb, 1942', 'Spouse');
INSERT INTO DEPENDENT
  VALUES(123456789, 'Michael', 'M', '04 Jan, 1988', 'Son');
INSERT INTO DEPENDENT
  VALUES(123456789, 'Alice', 'F', '30 Dec, 1988', 'Daughter');
INSERT INTO DEPENDENT
  VALUES(123456789, 'Elizabeth', 'F', '05 May, 1967', 'Spouse');


--Printing EMPLYOEE Table
SELECT * FROM EMPLOYEE;


--Printing DEPARTMENT Table
SELECT * FROM DEPARTMENT;


--Printing DEPT_LOCATION Table
SELECT * FROM DEPT_LOCATION;


--Printing WORKS_ON Table
SELECT * FROM WORKS_ON;


--Printing PROJECT Table
SELECT * FROM PROJECT;


--Printing DEPENDENT Table
SELECT * FROM DEPENDENT;

DROP TABLE EMPLOYEE cascade constraints;
--Creating EMPLOYEE Table
CREATE TABLE EMPLOYEE(
  Fname        VARCHAR2(16)    NOT NULL,
  Minit        VARCHAR2(2),
  Lname        VARCHAR2(16)    NOT NULL,
  Ssn          NUMBER(9)       NOT NULL,
  Bdate        DATE,
  Address      VARCHAR2(35),
  Sex          VARCHAR2(1),
  Salary       NUMBER(10),
  Super_ssn    NUMBER(9),
  Dno          NUMBER(1)       NOT NULL);

INSERT INTO EMPLOYEE
  VALUES('John', 'B', 'Smith', 123456789, '09 Jan, 1965', '731 Fondren, Houston, TX', 'M', 30000, 333445555, 5);
INSERT INTO EMPLOYEE
  VALUES('Franklin', 'T', 'Wong', 333445555, '08 Dec, 1955', '638 Voss, Houston, TX', 'M', 40000, 888665555, 5);
INSERT INTO EMPLOYEE
  VALUES('Alicia', 'J', 'Zelaya', 999887777, '19 Jan, 1968', '3321 Castle, Spring, TX', 'F', 25000, 987654321, 4);
INSERT INTO EMPLOYEE
  VALUES('Jennifer', 'S', 'Wallace', 987654321, '20 Jun, 1941', '291 Berry, Bellaire, TX', 'F', 43000, 888665555, 4);
INSERT INTO EMPLOYEE
  VALUES('Ramesh', 'K', 'Narayan', 666884444, '15 Sep, 1962', '975 Fire Oak, Humble, TX', 'M', 38000, 333445555, 5);
INSERT INTO EMPLOYEE
  VALUES('Joyce', 'A', 'English', 453453453, '31 Jul, 1972', '5631 Rice, Houston, TX', 'F', 25000, 333445555, 5);
INSERT INTO EMPLOYEE
  VALUES('Ahmad', 'V', 'Jabbar', 987987987, '29 Mar, 1969', '980 Dallas, Houston, TX', 'M', 25000, 987654321, 4);
INSERT INTO EMPLOYEE
  VALUES('James', 'E', 'Borg', 888665555, '10 Nov, 1937', '450 Stone, Houston, TX', 'M', 55000, NULL, 1);

DROP TABLE DEPARTMENT cascade constraints;
--Creating DEPARTMENT Table
CREATE TABLE DEPARTMENT(
  Dname              VARCHAR2(16)  NOT NULL,
  Dnumber            NUMBER(2)     NOT NULL,
  Mgr_ssn            NUMBER(9)     NOT NULL,
  Mgr_start_date     DATE);

INSERT INTO DEPARTMENT
  VALUES('Research', 5, 333445555, '22 May, 1988');
INSERT INTO DEPARTMENT
  VALUES('Administration', 4, 987654321, '01 Jan, 1995');
INSERT INTO DEPARTMENT
  VALUES('Headquarters', 1, 888665555, '19 Jun, 1981');

DROP TABLE DEPT_LOCATION cascade constraints;
--Creating DEPT_LOCATION Table
CREATE TABLE DEPT_LOCATION(
  Dnumber          NUMBER(2)     NOT NULL,
  Dlocation        VARCHAR2(16)  NOT NULL);

INSERT INTO DEPT_LOCATION
  VALUES(1, 'Houston');
INSERT INTO DEPT_LOCATION
  VALUES(4, 'Stafford');
INSERT INTO DEPT_LOCATION
  VALUES(5, 'Bellaire');
INSERT INTO DEPT_LOCATION
  VALUES(5, 'Sugarland');
INSERT INTO DEPT_LOCATION
  VALUES(5, 'Houston');

DROP TABLE PROJECT cascade constraints;
--Creating PROJECT Table
CREATE TABLE PROJECT(
  Pname           VARCHAR2(16)   NOT NULL,
  Pnumber         NUMBER(4)      NOT NULL,
  Plocation       VARCHAR2(16),
  Dnum            NUMBER(2)      NOT NULL);

INSERT INTO PROJECT
  VALUES('ProductX', 1, 'Bellaire', 5);
INSERT INTO PROJECT
  VALUES('ProductY', 2, 'Sugarland', 5);
INSERT INTO PROJECT
  VALUES('ProductZ', 3, 'Houston', 5);
INSERT INTO PROJECT
  VALUES('Computerization', 10, 'Stafford', 4);
INSERT INTO PROJECT
  VALUES('Reorganization', 20, 'Houston', 1);
INSERT INTO PROJECT
  VALUES('Newbenefits', 30, 'Stafford', 4);

DROP TABLE WORKS_ON cascade constraints;
--Creating WORKS_ON Table
CREATE TABLE WORKS_ON(
  Essn       NUMBER(9)   NOT NULL,
  Pno        NUMBER(2)   NOT NULL,
  Hours      FLOAT(6));

INSERT INTO WORKS_ON
  VALUES(123456789, 1, 32.5);
INSERT INTO WORKS_ON
  VALUES(123456789, 2, 7.5);
INSERT INTO WORKS_ON
  VALUES(666884444, 3, 40.0);
INSERT INTO WORKS_ON
  VALUES(453453453, 1, 20.0);
INSERT INTO WORKS_ON
  VALUES(453453453, 2, 20.0);
INSERT INTO WORKS_ON
  VALUES(333445555, 2, 10.0);
INSERT INTO WORKS_ON
  VALUES(333445555, 3, 10.0);
INSERT INTO WORKS_ON
  VALUES(333445555, 10, 10.0);
INSERT INTO WORKS_ON
  VALUES(333445555, 20, 10.0);
INSERT INTO WORKS_ON
  VALUES(999887777, 30, 30.0);
INSERT INTO WORKS_ON
  VALUES(999887777, 10, 10.0);
INSERT INTO WORKS_ON
  VALUES(987987987, 10, 35.0);
INSERT INTO WORKS_ON
  VALUES(987987987, 30, 5.0);
INSERT INTO WORKS_ON
  VALUES(987654321, 30, 20.0);
INSERT INTO WORKS_ON
  VALUES(987654321, 20, 15.0);
INSERT INTO WORKS_ON
  VALUES(888665555, 20, NULL);


DROP TABLE DEPENDENT cascade constraints;
--Creating DEPENDENT Table
CREATE TABLE DEPENDENT(
  Essn             NUMBER(9)      NOT NULL,
  Dependent_name   VARCHAR2(16)   NOT NULL,
  Sex              VARCHAR2(1),
  Bdate            DATE,
  Relationship     VARCHAR2(16));

INSERT INTO DEPENDENT
  VALUES(333445555, 'Alice', 'F', '05 Apr, 1986', 'Daughter');
INSERT INTO DEPENDENT
  VALUES(333445555, 'Theodore', 'M', '25 Oct, 1983', 'Son');
INSERT INTO DEPENDENT
  VALUES(333445555, 'Joy', 'F', '03 May, 1958', 'Spouse');
INSERT INTO DEPENDENT
  VALUES(987654321, 'Abner', 'M', '28 Feb, 1942', 'Spouse');
INSERT INTO DEPENDENT
  VALUES(123456789, 'Michael', 'M', '04 Jan, 1988', 'Son');
INSERT INTO DEPENDENT
  VALUES(123456789, 'Alice', 'F', '30 Dec, 1988', 'Daughter');
INSERT INTO DEPENDENT
  VALUES(123456789, 'Elizabeth', 'F', '05 May, 1967', 'Spouse');


-- Query 0
-- Q0

SELECT Bdate, Address
FROM EMPLOYEE
WHERE Fname='John' AND Minit='B' AND Lname='Smith';

-- Query 1
-- Q1

SELECT Fname, Lname, Address
FROM EMPLOYEE, DEPARTMENT
WHERE Dname='Research' AND Dnumber=Dno;

-- Query 2
-- Q2

SELECT Pnumber, Dnum, Lname, Address, Bdate
FROM PROJECT, DEPARTMENT, EMPLOYEE
WHERE Dnum=Dnumber AND Mgr_ssn=Ssn AND Plocation='Stafford';

-- Q1A
-- Will give an error, because of fully unqualified attribute name

SELECT Fname, EMPLOYEE.Name, Address
FROM EMPLOYEE, DEPARTMENT
WHERE DEPARTMENT.Name='Research' AND DEPARTMENT.Dnumber=EMPLOYEE.Dnumber;

-- Q1'

SELECT EMPLOYEE.Fname, EMPLOYEE.LName, EMPLOYEE.Address
FROM EMPLOYEE, DEPARTMENT
WHERE DEPARTMENT.DName = 'Research' AND DEPARTMENT.Dnumber = EMPLOYEE.Dno;

-- Query 8
-- Q8

SELECT E.Fname, E.Lname, S.Fname, S.Lname
FROM EMPLOYEE E, EMPLOYEE S
WHERE E.Super_ssn=S.Ssn;

-- Q1B

SELECT E.Fname, E.LName, E.Address
FROM EMPLOYEE E, DEPARTMENT D
WHERE D.DName = 'Research' AND D.Dnumber = E.Dno;

-- Query 9
--  Q9

SELECT Ssn
FROM EMPLOYEE;

-- Query 10
--  Q10

SELECT Ssn, Dname
FROM EMPLOYEE, DEPARTMENT;


-- Q1C
SELECT * FROM EMPLOYEE
WHERE Dno = 5;

--- Q1D

SELECT * FROM EMPLOYEE, DEPARTMENT
WHERE Dname = 'Research' AND Dno = Dnumber;

-- Q10A

SELECT * FROM EMPLOYEE, DEPARTMENT;

-- Query 11
-- Q11

SELECT ALL Salary FROM EMPLOYEE;

-- Q11A

SELECT DISTINCT Salary FROM EMPLOYEE;


-- Query 4
-- Q4A

( SELECT DISTINCT Pnumber
 FROM PROJECT, DEPARTMENT, EMPLOYEE
 WHERE Dnum = Dnumber AND Mgr_ssn = Ssn AND Lname = 'Smith' )
 UNION
( SELECT DISTINCT Pnumber
 FROM PROJECT, WORKS_ON, EMPLOYEE
 WHERE Pnumber = Pno AND Essn = Ssn AND Lname = 'Smith' );

-- Query 12
-- Q12

SELECT *
FROM EMPLOYEE
WHERE Address LIKE '%Houston, TX%';

-- Query 12A
-- Q12 
--No row will be selected, because % is needed

SELECT Fname, Lname FROM EMPLOYEE
WHERE Bdate LIKE '_ _ 7 _ _ _ _ _ _ _';


-- Query 13
-- Q13

SELECT E.Fname, E.Lname, 1.1 * E.Salary AS Increased_sal 
FROM EMPLOYEE E, WORKS_ON W, PROJECT P
WHERE E.Ssn = W.Essn AND W.Pno = P.Pnumber AND P.Pname = 'ProductX';

-- Query 14
-- Q14

SELECT * FROM EMPLOYEE
WHERE (Salary BETWEEN 30000 AND 40000) AND Dno = 5;

-- Query 15
-- Q15

SELECT D.Dname, E.Lname, E.Fname, P.Pname
FROM DEPARTMENT D, EMPLOYEE E, WORKS_ON W, PROJECT P
WHERE D.Dnumber = E.Dno AND E.Ssn = W.Essn AND W.Pno = P.Pnumber
ORDER BY D.Dname DESC, E.Lname ASC, E.Fname ASC;


-- INSERT, DELETE, and UPDATE Queries


-- U1

INSERT INTO EMPLOYEE
VALUES ('Richard', 'K', 'Marini', 653298653, '30 Dec, 1962', '98 Oak Forest, Katy, TX', 'M', 37000, 653298653, 4);

-- U1A

INSERT INTO EMPLOYEE (Fname, Lname, Dno, Ssn)
VALUES ('Richard', 'Marini', 4, 653298653);

-- U2

INSERT INTO EMPLOYEE (Fname, Lname, Ssn, Dno)
VALUES ('Robert', 'Hatcher', 980760540, 2);

-- U2A 
-- will give an error, because of a NOT NULL attribute named Ssn

INSERT INTO EMPLOYEE (Fname, Lname, Dno)
VALUES ('Robert', 'Hatcher', 5);

-- U3A

DROP TABLE WORKS_ON_INFO cascade constraints;
--Creating WORKS_ON_INFO Table
j
CREATE TABLE WORKS_ON_INFO
(Emp_name VARCHAR(15), 
 Proj_name VARCHAR(15), 
 Hours_per_week DECIMAL(3,1));

-- U3B

INSERT INTO WORKS_ON_INFO (Emp_name, Proj_name, Hours_per_week)
SELECT E.Lname, P.Pname, W.Hours
FROM PROJECT P, WORKS_ON W, EMPLOYEE E
WHERE P.Pnumber = W.Pno AND W.Essn = E.Ssn;

-- U5

UPDATE PROJECT
SET Plocation = 'Bellaire', Dnum = 5
WHERE Pnumber = 10;

-- U6

UPDATE EMPLOYEE
SET Salary = Salary * 1.1
WHERE Dno = 5;


-- Query 18. Retrieve the names of all employees who do not have supervisors.
-- Q18
SELECT Fname, Lname
FROM EMPLOYEE
WHERE Super_ssn IS NULL;

-- Q4A
SELECT DISTINCT Pnumber
FROM PROJECT
WHERE Pnumber IN ( SELECT Pnumber
                   FROM PROJECT, DEPARTMENT, EMPLOYEE
                   WHERE Dnum = Dnumber AND Mgr_ssn = Ssn AND Lname = 'Smith')
                 OR
                 Pnumber IN ( SELECT Pno
                              FROM WORKS_ON, EMPLOYEE
                              WHERE Essn = Ssn AND Lname = 'Smith');

-- Sql tuples of values within parentheses
SELECT DISTINCT Essn
FROM WORKS_ON
WHERE (Pno, Hours) IN ( SELECT Pno, Hours
                        FROM WORKS_ON
                        WHERE Essn = '123456789');

-- Employees whose salary is greater than the salary of all the employees in department 5
SELECT Lname, Fname
FROM EMPLOYEE
WHERE Salary > ALL ( SELECT Salary
                     FROM EMPLOYEE
                     WHERE Dno = 5);

-- Query 16. Retrieve the name of each employee who has a dependent with the same first name 
-- and is the same sex as the employee.
-- Q16
SELECT E.Fname, E.Lname
FROM EMPLOYEE E
WHERE E.Ssn IN ( SELECT D.Essn
                 FROM DEPENDENT D
                 WHERE E.Fname = D.Dependent_name AND E.Sex = D.Sex);

SELECT EMPLOYEE.Fname, EMPLOYEE.Lname
FROM EMPLOYEE
WHERE EMPLOYEE.Ssn IN ( SELECT DEPENDENT.Essn
                 FROM DEPENDENT
                 WHERE EMPLOYEE.Fname = DEPENDENT.Dependent_name AND EMPLOYEE.Sex = DEPENDENT.Sex);
-- Q16A
SELECT E.Fname, E.Lname
FROM EMPLOYEE E, DEPENDENT D
WHERE E.Ssn = D.Essn AND E.Sex = D.Sex AND E.Fname = D.Dependent_name;

-- Q16B
SELECT E.Fname, E.Lname
FROM EMPLOYEE E
WHERE EXISTS ( SELECT *
               FROM DEPENDENT D
               WHERE E.Ssn = D.Essn AND E.Sex = D.Sex AND E.Fname = D.Dependent_name);

-- Query 6. Retrieve the names of employees who have no dependents.
-- Q6
SELECT Fname, Lname
FROM EMPLOYEE
WHERE NOT EXISTS ( SELECT *
                   FROM DEPENDENT
                   WHERE Ssn = Essn);

-- Query 7. List the names of managers who have at least one dependent
-- Q7
SELECT Fname, Lname
FROM EMPLOYEE
WHERE EXISTS ( SELECT *
               FROM DEPENDENT
               WHERE Ssn = Essn )
      AND
      EXISTS ( SELECT *
               FROM DEPARTMENT
               WHERE Ssn = Mgr_ssn);

-- Q3A
SELECT Fname, Lname
FROM EMPLOYEE
WHERE NOT EXISTS (( SELECT Pnumber
                    FROM PROJECT
                    WHERE Dnum = 5)
                    EXCEPT ( SELECT Pno
                             FROM WORKS_ON
                             WHERE Ssn = Essn));

SELECT Fname, Lname
FROM EMPLOYEE
WHERE NOT EXISTS (( SELECT Pnumber
                    FROM PROJECT
                    WHERE Dnum = 5)
                    MINUS ( SELECT Pno
                             FROM WORKS_ON
                             WHERE Ssn = Essn));
                            

-- Q3B
SELECT Lname, Fname
FROM EMPLOYEE
WHERE NOT EXISTS ( SELECT *
                   FROM WORKS_ON B
                   WHERE ( B.Pno IN ( SELECT Pnumber
                                      FROM PROJECT
                                      WHERE Dnum = 5 )
                   AND
                   NOT EXISTS ( SELECT *
                                FROM WORKS_ON C
                                WHERE C.Essn = Ssn
                                AND C.Pno = B.Pno )));

-- Query 17. Retrieve the Social Security numbers of all employees who work on project numbers 1, 2, or 3.
-- Q17
SELECT DISTINCT Essn
FROM WORKS_ON
WHERE Pno IN (1, 2, 3);

-- Q8A
SELECT E.Lname AS Employee_name, S.Lname AS Supervisor_name
FROM EMPLOYEE E, EMPLOYEE S
WHERE E.Super_ssn = S.Ssn;

-- Q1A
SELECT Fname, Lname, Address
FROM (EMPLOYEE JOIN DEPARTMENT ON Dno = Dnumber)
WHERE Dname = 'Research';

-- Q1B
SELECT Fname, Lname, Address
FROM (EMPLOYEE NATURAL JOIN
     (DEPARTMENT AS DEPT (Dname, Dno, Mssn, Msdate)))
WHERE Dname = 'Research';

-- Q8B
SELECT E.Lname AS Employee_name,
       S.Lname AS Supervisor_name
FROM ( EMPLOYEE E LEFT OUTER JOIN EMPLOYEE S
       ON E.Super_ssn = S.Ssn);

-- Q2A
SELECT Pnumber, Dnum, Lname, Address, Bdate
FROM ((PROJECT JOIN DEPARTMENT ON Dnum = Dnumber)
       JOIN EMPLOYEE ON Mgr_ssn = Ssn)
WHERE Plocation = 'Stafford';

-- Q8C
SELECT E.Lname, S.Lname
FROM EMPLOYEE E, EMPLOYEE S
WHERE E.Super_ssn += S.Ssn;

SELECT E.Lname, S.Lname
FROM EMPLOYEE E, EMPLOYEE S
WHERE E.Super_ssn = E.Super_ssn + S.Ssn;

-- Query 19. Find the sum of the salaries of all employees, the maximum salary, 
-- the minimum salary, and the average salary.
-- Q19
SELECT SUM (Salary), MAX (Salary), MIN (Salary), AVG (Salary)
FROM EMPLOYEE;

-- Q19A
SELECT SUM (Salary) AS Total_Sal, MAX (Salary) AS Highest_Sal,
       MIN (Salary) AS Lowest_Sal, AVG (Salary) AS Average_Sal
FROM EMPLOYEE;

-- Query 20. Find the sum of the salaries of all employees of the ‘Research’ department, as well as 
-- the maximum salary, the minimum salary, and the average salary in this department.
-- Q20
SELECT SUM (Salary), MAX (Salary), MIN (Salary), AVG (Salary)
FROM (EMPLOYEE JOIN DEPARTMENT ON Dno = Dnumber)
WHERE Dname = 'Research';

-- Queries 21 and 22. Retrieve the total number of employees in the company 
-- (Q21) and the number of employees in the ‘Research’ department (Q22).
-- Q21
SELECT COUNT (*)
FROM EMPLOYEE;

--Q22
SELECT COUNT (*)
FROM EMPLOYEE, DEPARTMENT
WHERE DNO = DNUMBER AND DNAME = 'Research';

-- Query 23. Count the number of distinct salary values in the database.
-- Q23
SELECT COUNT (DISTINCT Salary)
FROM EMPLOYEE;

-- Q5
SELECT Lname, Fname
FROM EMPLOYEE
WHERE ( SELECT COUNT (*)
        FROM DEPENDENT
        WHERE Ssn = Essn ) > = 2;

-- Query 24. For each department, retrieve the department number, the number 
-- of employees in the department, and their average salary.
-- Q24
SELECT Dno, COUNT (*), AVG (Salary)
FROM EMPLOYEE
GROUP BY Dno;

-- Query 25. For each project, retrieve the project number, the project name, and 
-- the number of employees who work on that project.
-- Q25
SELECT Pnumber, Pname, COUNT (*)
FROM PROJECT, WORKS_ON
WHERE Pnumber = Pno
GROUP BY Pnumber, Pname;

-- Query 26. For each project on which more than two employees work, retrieve the 
-- project number, the project name, and the number of employees who work on the project.
-- Q26
SELECT Pnumber, Pname, COUNT (*)
FROM PROJECT, WORKS_ON
WHERE Pnumber = Pno
GROUP BY Pnumber, Pname
HAVING COUNT (*) > 2;

-- Query 27. For each project, retrieve the project number, the project name, and 
-- the number of employees from department 5 who work on the project
-- Q27
SELECT Pnumber, Pname, COUNT (*)
FROM PROJECT, WORKS_ON, EMPLOYEE
WHERE Pnumber = Pno AND Ssn = Essn AND Dno = 5
GROUP BY Pnumber, Pname;

-- The condition (SALARY > 40000) applies only to the 
-- COUNT function in the SELECT clause
SELECT Dno, COUNT (*)
FROM EMPLOYEE
WHERE Salary > 40000
GROUP BY Dno
HAVING COUNT (*) > 5;

-- Query 28. For each department that has more than five employees, retrieve the 
-- department number and the number of its employees who are making more than $40,000
-- Q28
SELECT Dno, COUNT (*)
FROM EMPLOYEE
WHERE Salary > 40000 AND Dno IN
                    ( SELECT Dno
                    FROM EMPLOYEE
GROUP BY Dno
                    HAVING COUNT (*) > 5)
GROUP BY Dno;

-- Q28′
WITH BIGDEPTS (Dno) AS
    ( SELECT Dno
      FROM EMPLOYEE
      GROUP BY Dno
      HAVING COUNT (*) > 5)
SELECT Dno, COUNT (*)
FROM EMPLOYEE
WHERE Salary > 40000 AND Dno IN BIGDEPTS
GROUP BY Dno;

-- U6′
UPDATE EMPLOYEE
SET Salary = 
CASE WHEN Dno = 5 THEN Salary + 2000
     WHEN Dno = 4 THEN Salary + 1500
     WHEN Dno = 1 THEN Salary + 3000
     ELSE Salary + 0 ;

-- Q29
WITH RECURSIVE SUP_EMP (SupSsn, EmpSsn) AS
    ( SELECT SupervisorSsn, Ssn
      FROM EMPLOYEE
      UNION
      SELECT E.Ssn, S.SupSsn
      FROM EMPLOYEE AS E, SUP_EMP AS S
      WHERE E.SupervisorSsn = S.EmpSsn)
 SELECT *
 FROM SUP_EMP;
