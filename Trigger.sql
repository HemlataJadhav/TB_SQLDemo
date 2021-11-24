USE [db2021]
GO

--   *************** Create table Employee1************************

create table Employee1(ID int identity,Name nvarchar(100),Salary int ,Gender nvarchar(100),Department int)

-- ****************** insert values into table Employee1 **********************
insert into Employee1 values('harsh G',54231,'Male',1),('salman',76154,'Male',2),('karishma',76543,'Female',3)

select * from Employee1

-- ******************create table EmployeeAudit *****************************

create table EmployeeAudit(ID int primary key identity,AuditData nvarchar(100),AuditDate date)

select * from EmployeeAudit

-- ******************** Create Trigger on table Employee1 ************************

create or ALTER TRIGGER [dbo].[trig_Employee_For_insert]
ON [dbo].[Employee1]
FOR INSERT
AS
BEGIN
  -- Declare a variable to hold the ID Value
  DECLARE @ID INT

  -- Declare a variable to hold the Name value
  DECLARE @Name VARCHAR(100)

  -- Declare a variable to hold the Audit data
  DECLARE @AuditData VARCHAR(100)

  -- Get the ID and Name from the INSERTED Magic table
  SELECT @ID = id, @Name = Name FROM INSERTED

  -- Set the AuditData to be stored in the EmployeeAudit table
  SET @AuditData = 'New employee Added with ID  = ' + Cast(@ID AS VARCHAR(10)) + ' and Name ' + @Name

  -- Insert the data into the EmployeeAudit table
  INSERT INTO EmployeeAudit (AuditData, AuditDate) VALUES(@AuditData, GETDATE())
END


-- ************ here if we insert record of employee into Employee1 then the name and id of tht employee will get store into EmployeeAudit Table also

insert into Employee1 values('sweety',7652345,'Female',2)

select * from Employee1;
select * from EmployeeAudit;