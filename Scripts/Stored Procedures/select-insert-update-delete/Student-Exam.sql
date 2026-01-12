

CREATE OR ALTER PROCEDURE sp_Student_Exam_Insert
    @StId INT,
    @ExId INT
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        -- Validate student
        IF NOT EXISTS (SELECT 1 FROM Student WHERE StId = @StId)
            THROW 50001, 'Student does not exist.', 1;

        -- Validate exam
        IF NOT EXISTS (SELECT 1 FROM Exam WHERE ExId = @ExId)
            THROW 50002, 'Exam does not exist.', 1;

        -- Prevent duplicate registration
        IF EXISTS (
            SELECT 1
            FROM Student_Exam
            WHERE StId = @StId AND ExId = @ExId
        )
            THROW 50003, 'Student already registered for this exam.', 1;

        INSERT INTO Student_Exam (StId, ExId, FinalGrade)
        VALUES (@StId, @ExId, NULL);
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END;
GO



CREATE OR ALTER PROCEDURE sp_Student_Exam_Select
    @StId INT,
    @ExId INT
AS
BEGIN
    SET NOCOUNT ON;

    IF NOT EXISTS (
        SELECT 1
        FROM Student_Exam
        WHERE StId = @StId AND ExId = @ExId
    )
        THROW 50004, 'Student exam record not found.', 1;

    SELECT 
        S.StId,
        S.StName,
        E.ExId,
        E.ExDate,
        SE.FinalGrade
    FROM Student_Exam SE
    JOIN Student S ON SE.StId = S.StId
    JOIN Exam E ON SE.ExId = E.ExId
    WHERE SE.StId = @StId
      AND SE.ExId = @ExId;
END;
GO




CREATE OR ALTER PROCEDURE sp_Student_Exam_Update
    @StId INT,
    @ExId INT,
    @FinalGrade DECIMAL(5,2)
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        IF NOT EXISTS (
            SELECT 1
            FROM Student_Exam
            WHERE StId = @StId AND ExId = @ExId
        )
            THROW 50005, 'Student exam record not found.', 1;

        IF @FinalGrade < 0 OR @FinalGrade > 100
            THROW 50006, 'Final grade must be between 0 and 100.', 1;

        UPDATE Student_Exam
        SET FinalGrade = @FinalGrade
        WHERE StId = @StId
          AND ExId = @ExId;
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END;
GO



CREATE OR ALTER PROCEDURE sp_Student_Exam_Delete
    @StId INT,
    @ExId INT
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        IF NOT EXISTS (
            SELECT 1
            FROM Student_Exam
            WHERE StId = @StId AND ExId = @ExId
        )
            THROW 50007, 'Student exam record not found.', 1;

        -- Delete answers first (NO ACTION FK)
        DELETE FROM StudentAnswer
        WHERE StId = @StId AND ExId = @ExId;

        DELETE FROM Student_Exam
        WHERE StId = @StId AND ExId = @ExId;
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END;
GO


