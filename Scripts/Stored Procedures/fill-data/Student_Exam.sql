USE ITI_ExamSystem;
GO

DECLARE @sid INT = 1;
DECLARE @eid INT = 1;
WHILE @sid <= 50
BEGIN
    SET @eid = 1;
    WHILE @eid <= 65
    BEGIN
        exec sp_Student_Exam_Insert @StId = @sid, @ExId = @eid;
        SET @eid = @eid + 1;
    END
    SET @sid = @sid + 1;
END

