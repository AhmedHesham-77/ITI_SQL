-- UDT
create type u_id from int not null;

create type u_age from tinyint not null;

create table test
(
    id  u_id,
    age u_age
);

select *
from test;

SELECT *
from Works_On;

create view VWorksOn as
(
select *
from Works_On
    );

SELECT *
from VWorksOn;

ALTER VIEW VWorksOn AS (SELECT ProjectNo
                        FROM Works_On);

SELECT *
from VWorksOn;


CREATE VIEW VDep(DepId, DepName, DepLoc) AS
(
SELECT *
FROM Company.Department
    );

SELECT *
FROM VDep;

INSERT INTO test
VALUES (1, 20),
       (2, 11),
       (3, 60);


INSERT INTO VTest
VALUES (5, 22);

----------------------------------------------------------------------------------
-- Assignment
--Q1
CREATE VIEW VEmp_Proj AS
SELECT CONCAT(FName, ' ', LName) NAME, ProjectName
FROM Works_On W
         JOIN dbo.Employee E on W.EmpNo = E.EmpNo
         JOIN dbo.Project P on W.ProjectNo = P.ProjectNo
WHERE job = 'clerk';

--Q2
CREATE VIEW VProj_Emp_Count AS
SELECT P.ProjectName, COALESCE(COUNT(EmpNo), 0) Emp_Num
FROM Project P
         LEFT JOIN Works_On W ON P.ProjectNo = W.ProjectNo
GROUP BY P.ProjectName;

--Q3
CREATE SCHEMA HR;
SELECT * INTO HR.Employee FROM Employee;

--Q4
CREATE TYPE CityUDD FROM Nvarchar(10);

--Q5
CREATE TYPE Tel FROM Nvarchar(11) NOT NULL;

--Q6
CREATE DEFAULT VALUE AS 'Not Applied';

--Q7
CREATE RULE Check_City AS @Col IN ('Assiut','Cairo','Alex','Ismalia','Mansoura');

--Q8
sp_bindefault VALUE,CityUDD;
sp_bindrule Check_City,CityUDD;

--Q9
CREATE TABLE Student(
  ID SMALLINT,
  CITY CityUDD,
  Telephone_Num Tel
);