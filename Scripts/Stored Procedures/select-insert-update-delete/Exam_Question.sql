USE ITI_ExamSystem;
GO

/* =========================
   Exam_Question INSERT
   ========================= */
CREATE OR ALTER PROC sp_ExamQuestion_Insert
    @ExId INT,
    @QId INT,
    @QOrder INT
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        -- Validate exam
        IF NOT EXISTS (SELECT 1 FROM Exam WHERE ExId = @ExId)
            THROW 50001, 'Exam does not exist.', 1;

        -- Validate question
        IF NOT EXISTS (SELECT 1 FROM Question WHERE QId = @QId)
            THROW 50002, 'Question does not exist.', 1;

        -- Ensure question belongs to same course as exam
        IF NOT EXISTS (
            SELECT 1
            FROM Exam E
            JOIN Question Q ON E.CrsId = Q.CrsId
            WHERE E.ExId = @ExId AND Q.QId = @QId
        )
            THROW 50003, 'Question does not belong to exam course.', 1;

        -- Prevent duplicate question in same exam
        IF EXISTS (
            SELECT 1
            FROM Exam_Question
            WHERE ExId = @ExId AND QId = @QId
        )
            THROW 50004, 'Question already added to this exam.', 1;

        -- Prevent duplicate order inside same exam
        IF EXISTS (
            SELECT 1
            FROM Exam_Question
            WHERE ExId = @ExId AND QOrder = @QOrder
        )
            THROW 50005, 'Question order already used in this exam.', 1;

        INSERT INTO Exam_Question (ExId, QId, QOrder)
        VALUES (@ExId, @QId, @QOrder);
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END;
GO


/* =========================
   Exam_Question DELETE
   ========================= */
CREATE OR ALTER PROC sp_ExamQuestion_Delete
    @ExId INT,
    @QId INT
AS
BEGIN
    SET NOCOUNT ON;

    IF NOT EXISTS (
        SELECT 1
        FROM Exam_Question
        WHERE ExId = @ExId AND QId = @QId
    )
        THROW 50008, 'Exam question record not found.', 1;

    DELETE FROM Exam_Question
    WHERE ExId = @ExId AND QId = @QId;
END;
GO


/* =========================
   Exam_Question UPDATE
   ========================= */
CREATE OR ALTER PROC sp_ExamQuestion_Update
    @ExId INT,
    @QId INT,
    @QOrder INT
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        IF NOT EXISTS (
            SELECT 1
            FROM Exam_Question
            WHERE ExId = @ExId AND QId = @QId
        )
            THROW 50006, 'Exam question record not found.', 1;

        IF EXISTS (
            SELECT 1
            FROM Exam_Question
            WHERE ExId = @ExId AND QOrder = @QOrder AND QId <> @QId
        )
            THROW 50007, 'Question order already used in this exam.', 1;

        UPDATE Exam_Question
        SET QOrder = @QOrder
        WHERE ExId = @ExId AND QId = @QId;
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END;
GO


/* =========================
   Exam_Question SELECT (by Exam)
   ========================= */
CREATE OR ALTER PROC sp_ExamQuestion_SelectByExamID
    @ExId INT
AS
BEGIN
    SELECT *
    FROM Exam_Question
    WHERE ExId = @ExId
    ORDER BY QOrder;
END
GO

/* =========================
   Exam_Question SELECT (by Question)
   ========================= */
CREATE OR ALTER PROC sp_ExamQuestion_SelectByQuestionID
    @QId INT
AS
BEGIN
    SELECT *
    FROM Exam_Question
    WHERE QId = @QId
    ORDER BY ExId;
END
GO

/* =========================
   Exam_Question SELECT (All)
   ========================= */
CREATE OR ALTER PROC sp_ExamQuestion_SelectAll
AS
BEGIN
    SELECT *
    FROM Exam_Question
END
GO