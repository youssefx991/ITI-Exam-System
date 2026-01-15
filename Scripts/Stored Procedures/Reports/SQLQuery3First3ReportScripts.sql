
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


exec SP_Report_StudentWithDepartment 3



--•	Report that takes the student ID and returns the grades of the student in all courses. %
create or alter proc SP_Report_StudentGrades @student_ID int
as
    if not exists (
        select 1 
        from Student
        where StId = @student_ID
    )
    begin
        RAISERROR('invalid student ID',16,1)
        return;
    end
    select s.StId, s.StName, s.StEmail,c.CrsName, se.FinalGrade, c.MaxDegree, ((se.FinalGrade / c.MaxDegree) *100) as exam_percent 
    from Student s join Student_Exam se on
        s.StId = se.StId join Exam e on
        se.ExId = e.ExId join Course c on
        e.CrsId = c.CrsId
        where s.StId = @student_ID




exec SP_Report_StudentGrades 3

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
    select i.InsName, c.CrsName, count(s.StId) 
    from Instructor i join Instructor_Course ic on i.InsId = ic.InsId 
    join Course c on c.CrsId = ic.CrsId 
    join Student s on s.TrackID = c.TrackID
    where i.InsId = @instructor_id 
    group by i.InsName,c.CrsName




exec SP_Report_InstructorCourses 8

