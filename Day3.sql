select *
from Employee;
print @@rowcount;
print @@error;
print @@version;
----------------------------
-- @@error must run in single batch separated from running code
-- to end running batch and start another one using GO

use World
SELECT *
FROM Employee
where salar = 1000
GO
print @@ERROR;

-- @@rowcount must run in same batch with running code
use World
SELECT *
FROM Employee
select @@rowcount;
-------------------------------------
declare @x int;
set @x = 10;
print @x;

declare @max_emp_sal int;
set @max_emp_sal = (select max(salary)
                    from Employee);
print @max_emp_sal;

-- Table variable
declare @table_var table
                   (
                       salary int
                   );
insert into @table_var
select salary
from Employee;
select *
from @table_var;

-- Table type
create type table_type as table
(
    id   int
);

declare @test_table_type table_type;
insert into @test_table_type
select EmpNo
from Employee;
select *
from @test_table_type;

