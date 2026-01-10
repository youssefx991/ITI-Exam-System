USE ITI_ExamSystem;
GO

DECLARE 
    @CrsId INT,
    @i INT,
    @NewExamID INT,
    @ExamDate DATETIME;

DECLARE course_cursor CURSOR FOR
SELECT CrsId FROM Course;

OPEN course_cursor;
FETCH NEXT FROM course_cursor INTO @CrsId;

WHILE @@FETCH_STATUS = 0
BEGIN
    SET @i = 1;

    WHILE @i <= 3
    BEGIN
        SET @ExamDate = DATEADD(DAY, @i * 7, GETDATE());

        EXEC sp_Exam_Insert
            @CrsId = @CrsId,
            @ExDate = @ExamDate,
            @NewExamID = @NewExamID OUTPUT;

        SET @i = @i + 1;
    END

    FETCH NEXT FROM course_cursor INTO @CrsId;
END

CLOSE course_cursor;
DEALLOCATE course_cursor;
GO



