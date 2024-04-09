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

