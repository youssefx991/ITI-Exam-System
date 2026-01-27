use ITI_ExamSystem
go

--Report that takes the instructor ID and returns the name of the courses that he teaches and the number of student per course.
create or alter proc SP_Report_InstructorCourses @instructor_id int
as
    if not exists (
        select 1 
        from Instructor
        where InsId = @instructor_id
    )
    begin
        RAISERROR('invalid instructor ID',16,1)
        return;
    end
    select i.InsName, c.CrsName, count(s.StId) as [number of students]
    from Instructor i join Instructor_Course ic on i.InsId = ic.InsId 
    join Course c on c.CrsId = ic.CrsId 
    join Student s on s.TrackID = c.TrackID
    where i.InsId = @instructor_id 
    group by i.InsName,c.CrsName
go
exec SP_Report_InstructorCourses 8
