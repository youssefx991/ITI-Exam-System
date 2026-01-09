use ITI_ExamSystem




-- insertion into Department
create proc SP_Department_Insert @Department_Name varchar(20)
as
	insert into Department values (@Department_Name)



--selecting all departments
alter proc SP_Department_selectAll
as
	select DeptID as Department_ID,DeptName as Department_Name from Department


--selecting by ID
create proc SP_Department_selectByID @id int
as
	select deptName as Department_Name from Department
	where DeptID = @id


--updating department name
create proc SP_Department_Update @Department_id int, @New_Name varchar(20)
as
	update Department set DeptName = @New_Name
	where DeptID = @Department_id



--deleting department
create proc SP_Department_Delete @Department_id int
as
	delete from Department 
	where DeptID = @Department_id





--insertion in track
alter proc SP_Track_Insert @Track_Name varchar(20), @Department_ID int
as
	if  NOT EXISTS (select 1 from Department where DeptID = @Department_ID)
	BEGIN
        select 'there is no Existing department with id' + convert(varchar,@Department_ID)
		return;
    END
	insert into Track values (@Track_Name, @Department_ID)


--select from track
create proc SP_Track_SelectAll
as
	select TrackID as TrackID, TrackName as Track_Name, DeptID as Dpartment_ID from Track


--select from track by ID
create proc SP_Track_SelectByID @Track_ID int
as
	select TrackID as Track_ID, TrackName as Track_Name, DeptID as Dpartment_ID from Track
	where TrackID = @Track_ID


--Update in track
create proc SP_Track_Update @Track_Name varchar(20), @Track_ID int
as
	Update Track set TrackName = @Track_Name
	where TrackID = @Track_ID

--Deletion from Track
create proc SP_Track_Delete @Track_ID int
as
	delete from Track where TrackID = @Track_ID






SP_Department_selectAll
SP_Department_selectByID 3
SP_Department_Insert 'Game Development'
SP_Department_Update 2, 'dept updated name'
SP_Department_Delete 2


SP_Track_Insert 'pd', 1
SP_track_SelectAll
SP_track_SelectByID 4
SP_Track_Update 'newTrackName', 4
SP_Track_Delete 4
select * from Department
select * from Track
