USE ITI_ExamSystem;
GO

CREATE OR ALTER PROCEDURE sp_Exam_Answers
(
    @ExId INT,
    @StudentName VARCHAR(100),

    @Ans1 CHAR(1),
    @Ans2 CHAR(1),
    @Ans3 CHAR(1),
    @Ans4 CHAR(1),
    @Ans5 CHAR(1),
    @Ans6 CHAR(1),
    @Ans7 CHAR(1),
    @Ans8 CHAR(1),
    @Ans9 CHAR(1),
    @Ans10 CHAR(1)
)
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @StId INT;

    BEGIN TRY
        --------------------------------------------------
        -- 1️⃣ Get Student ID
        --------------------------------------------------
        SELECT @StId = StId
        FROM Student
        WHERE StName = @StudentName;

        IF @StId IS NULL
            THROW 50001, 'Student not found.', 1;

        --------------------------------------------------
        -- 2️⃣ Validate Exam Exists
        --------------------------------------------------
        IF NOT EXISTS (SELECT 1 FROM Exam WHERE ExId = @ExId)
            THROW 50002, 'Exam does not exist.', 1;

        --------------------------------------------------
        -- 3️⃣ Validate Student Registered in Exam
        --------------------------------------------------
        IF NOT EXISTS (
            SELECT 1
            FROM Student_Exam
            WHERE StId = @StId AND ExId = @ExId
        )
            THROW 50003, 'Student is not registered in this exam.', 1;

        --------------------------------------------------
        -- 4️⃣ Prevent Double Submission
        --------------------------------------------------
        IF EXISTS (
            SELECT 1
            FROM StudentAnswer
            WHERE StId = @StId AND ExId = @ExId
        )
            THROW 50004, 'Student already submitted this exam.', 1;

        --------------------------------------------------
        -- 5️⃣ Validate Exam Has 10 Questions
        --------------------------------------------------
        IF (
            SELECT COUNT(*)
            FROM Exam_Question
            WHERE ExId = @ExId
        ) <> 10
            THROW 50005, 'Exam must contain exactly 10 questions.', 1;

        --------------------------------------------------
        -- 6️⃣ Insert Answers (Mapped by Question Order)
        --------------------------------------------------
        INSERT INTO StudentAnswer (StId, ExId, QId, Answer)
        SELECT
            @StId,
            @ExId,
            EQ.QId,
            A.Answer
        FROM Exam_Question EQ
        JOIN
        (
            SELECT 1 AS QOrder, @Ans1  AS Answer UNION ALL
            SELECT 2, @Ans2  UNION ALL
            SELECT 3, @Ans3  UNION ALL
            SELECT 4, @Ans4  UNION ALL
            SELECT 5, @Ans5  UNION ALL
            SELECT 6, @Ans6  UNION ALL
            SELECT 7, @Ans7  UNION ALL
            SELECT 8, @Ans8  UNION ALL
            SELECT 9, @Ans9  UNION ALL
            SELECT 10,@Ans10
        ) A
        ON EQ.QOrder = A.QOrder
        WHERE EQ.ExId = @ExId;

    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END;
GO
