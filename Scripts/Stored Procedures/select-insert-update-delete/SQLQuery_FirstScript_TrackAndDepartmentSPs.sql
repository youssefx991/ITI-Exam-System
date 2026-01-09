use ITI_ExamSystem




-- insertion into Department
create proc SP_Department_Insert @Department_Name varchar(20)
as
	IF @Department_Name IS NULL OR LTRIM(RTRIM(@Department_Name)) = ''
	BEGIN
		RAISERROR('Department cant be empty.', 16, 1);
		return;
    END
	IF EXISTS (
        SELECT 1
        FROM Department
        WHERE LOWER(DeptName) = LOWER(@Department_Name)
    )
    BEGIN
        RAISERROR('Department already exists.', 16, 1);
        RETURN;
    END
	insert into Department (DeptName) values (@Department_Name)



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
alter proc SP_Department_Update @Department_id int, @New_Name varchar(20)
as
	IF EXISTS (
        SELECT 1
        FROM Department
        WHERE LOWER(DeptName) = LOWER(@New_Name)
    )
    BEGIN
        RAISERROR('Department already exists.', 16, 1);
        RETURN;
    END
	update Department set DeptName = @New_Name
	where DeptID = @Department_id



--deleting department
create proc SP_Department_Delete @Department_id int
as
	delete from Department 
	where DeptID = @Department_id




	-----------------------------------------------------------------------
--insertion in track
alter proc SP_Track_Insert @Track_Name varchar(20), @Department_ID int
as
	IF EXISTS (
        SELECT 1
        FROM Track
        WHERE LOWER(TrackName) = LOWER(@Track_Name)
    )
    BEGIN
        RAISERROR('Track already exists.', 16, 1);
        RETURN;
    END
	IF NOT EXISTS (
        SELECT 1
        FROM Department
        WHERE DeptID = @Department_ID
    )
    BEGIN
        RAISERROR('Invalid Department id', 16, 1);
        RETURN;
    END
	insert into Track (TrackName, DeptID) values (@Track_Name, @Department_ID)


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
alter proc SP_Track_Update @Track_New_Name varchar(20), @Track_ID int
as
	IF EXISTS (
        SELECT 1
        FROM Track
        WHERE LOWER(TrackName) = LOWER(@Track_New_Name)
    )
    BEGIN
        RAISERROR('this Track already exists.', 16, 1);
        RETURN;
    END
	Update Track set TrackName = @Track_New_Name
	where TrackID = @Track_ID




--Move Track to another Department
create proc SP_Track_UpdateDept @Track_ID int, @New_Department_ID int
as
	IF NOT EXISTS (
        SELECT 1
        FROM Department
        WHERE DeptID = @New_Department_ID
    )
    BEGIN
        RAISERROR('Invalid Department id', 16, 1);
        RETURN;
    END
	Update Track set DeptID = @New_Department_ID
	where TrackID = @Track_ID




--Deletion from Track
alter proc SP_Track_Delete @Track_ID int
as
    IF NOT EXISTS (
        SELECT 1
        FROM Track
        WHERE TrackID = @Track_ID
    )
    BEGIN
        RAISERROR('Invalid Track id', 16, 1);
        RETURN;
    END
	delete from Track where TrackID = @Track_ID






SP_Department_selectAll
SP_Department_selectByID 5
SP_Department_Insert 'Java'
SP_Department_Update 5, 'New department change'
SP_Department_Delete 5


SP_Track_Insert 'new new track', 4
SP_track_SelectAll
SP_track_SelectByID 6
SP_Track_Update 'PD', 6
SP_Track_UpdateDept 6, 1
SP_Track_Delete 7
select * from Department
select * from Track
