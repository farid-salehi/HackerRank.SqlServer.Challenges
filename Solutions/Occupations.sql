Declare @temp  Table(num int ,[Name] nvarchar(10), OCCUPATION nvarchar(10))
insert into @temp(num, [Name], OCCUPATION)
select  
ROW_NUMBER() OVER (
    PARTITION BY OCCUPATION
    ORDER BY [name]
), 
[name] ,
OCCUPATION
from OCCUPATIONS



declare @max int = (select max(num) from @temp)
Declare @res Table(Doctor nvarchar(20), Professor nvarchar(20), Singer  nvarchar(20), Actor nvarchar(20))

declare @i int= 1
while(@i<=@max)
Begin
declare @Doctor nvarchar(20)= (select Name from @temp where OCCUPATION = 'Doctor' and num = @i)
declare @Professor nvarchar(20)= (select Name from @temp where OCCUPATION = 'Professor' and num = @i)
declare @Singer nvarchar(20)= (select Name from @temp where OCCUPATION = 'Singer' and num = @i)
declare @Actor nvarchar(20)= (select Name from @temp where OCCUPATION = 'Actor' and num = @i)
insert into @res(Doctor,Professor,Singer,Actor)
values(@Doctor,@Professor,@Singer,@Actor)
set @i = @i+1
End

select * from @res