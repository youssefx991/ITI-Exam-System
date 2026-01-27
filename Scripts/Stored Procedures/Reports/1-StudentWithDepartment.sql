use ITI_ExamSystem
go

create or alter proc SP_Report_StudentWithDepartment @Department_ID int
as
    if not exists (
        select 1 
        from Department
        where DeptID = @Department_ID
    )
    begin
        RAISERROR('invalid student ID',16,1)
        return;
    end
	select s.StId as student_id, s.StName as student_name, s.StEmail as student_email,t.TrackName as track_name, d.DeptName as department_name
	from Student s join Track t on s.TrackID = t.TrackID join Department d on d.DeptID = t.DeptID
	where t.DeptID = @Department_ID


go
exec SP_Report_StudentWithDepartment 3