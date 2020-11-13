USE [AdventureWorksDW2014]
GO
WITH random
as
(
SELECT TOP 100
      c1.[FirstName],
	  c1.[LastName],
	  c1.notes,
      c1.homePhone,
      CAST(RAND(CHECKSUM(NEWID()))*3 as int) randomemail 
  FROM [dbo].Employees c1
CROSS JOIN
Customer c2
)
select  
Firstname, 
Lastname,
notes,
homePhone,
email=
CASE
	when randomemail =0 then 
	lower(left(FirstName,1)+[LastName])+'@hotmail.com'
	when randomemail =1 then 
	lower(left(FirstName,1)+[LastName])+'@gmail.com'
	else
	lower(left(FirstName,1)+[LastName])+'@yahoo.com'
END
from random
 