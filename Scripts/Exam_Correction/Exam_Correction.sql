USE ITI_ExamSystem;
GO

CREATE OR ALTER PROCEDURE sp_Exam_Correction
(
    @ExId INT,
    @StudentName VARCHAR(100)
)
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @StId INT;
    DECLARE @TotalDegree INT;
    DECLARE @StudentDegree INT;
    DECLARE @FinalGrade FLOAT;

    BEGIN TRY
        ---------------------------------------------
        -- 1️⃣ Get Student ID
        ---------------------------------------------
        SELECT @StId = StId
        FROM Student
        WHERE StName = @StudentName;

        IF @StId IS NULL
            THROW 60001, 'Student not found.', 1;

        ---------------------------------------------
        -- 2️⃣ Validate exam + submission
        ---------------------------------------------
        IF NOT EXISTS (
            SELECT 1 FROM StudentAnswer
            WHERE StId = @StId AND ExId = @ExId
        )
            THROW 60002, 'Student did not submit this exam.', 1;

        ---------------------------------------------
        -- 3️⃣ Calculate total exam degree
        ---------------------------------------------
        SELECT @TotalDegree = SUM(Q.QDegree)
        FROM Exam_Question EQ
        JOIN Question Q ON EQ.QId = Q.QId
        WHERE EQ.ExId = @ExId;

        ---------------------------------------------
        -- 4️⃣ Calculate student earned degree
        ---------------------------------------------
        SELECT @StudentDegree = SUM(Q.QDegree)
        FROM StudentAnswer SA
        JOIN Question Q ON SA.QId = Q.QId
        WHERE SA.StId = @StId
          AND SA.ExId = @ExId
          AND SA.Answer = Q.QAnswer;

        IF @StudentDegree IS NULL
            SET @StudentDegree = 0;

        ---------------------------------------------
        -- 5️⃣ Calculate percentage
        ---------------------------------------------
        SET @FinalGrade =
            CAST(@StudentDegree AS FLOAT) * 100 / @TotalDegree;

        ---------------------------------------------
        -- 6️⃣ Save grade
        ---------------------------------------------
        UPDATE Student_Exam
        SET FinalGrade = @FinalGrade
        WHERE StId = @StId AND ExId = @ExId;

        ---------------------------------------------
        -- 7️⃣ Return grade (optional)
        ---------------------------------------------
        SELECT @FinalGrade AS FinalGrade;

    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END;
GO
