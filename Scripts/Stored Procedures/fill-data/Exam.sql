USE ITI_ExamSystem;
GO

DECLARE 
    @CrsId INT,
    @i INT,
    @ExamDate DATETIME,
    @ExamId INT = 1;   -- manual PK generator

DECLARE course_cursor CURSOR FOR
SELECT CrsId FROM Course
ORDER BY CrsId;

OPEN course_cursor;
FETCH NEXT FROM course_cursor INTO @CrsId;

WHILE @@FETCH_STATUS = 0
BEGIN
    SET @i = 1;

    WHILE @i <= 3
    BEGIN
        SET @ExamDate = DATEADD(DAY, @i * 7, GETDATE());

        EXEC sp_Exam_Insert
            @ExId   = @ExamId,
            @CrsId  = @CrsId,
            @ExDate = @ExamDate;

        SET @ExamId += 1;
        SET @i += 1;
    END

    FETCH NEXT FROM course_cursor INTO @CrsId;
END

CLOSE course_cursor;
DEALLOCATE course_cursor;
GO

EXEC [dbo].[sp_Exam_SelectAll]