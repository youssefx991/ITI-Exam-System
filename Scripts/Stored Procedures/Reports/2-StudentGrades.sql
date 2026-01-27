use ITI_ExamSystem
go

--Report that takes the student ID and returns the grades of the student in all courses. %
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
    select s.StId, s.StName, s.StEmail,c.CrsName, se.FinalGrade
    from Student s join Student_Exam se on
        s.StId = se.StId join Exam e on
        se.ExId = e.ExId join Course c on
        e.CrsId = c.CrsId
        where s.StId = @student_ID
go
exec SP_Report_StudentGrades 1
