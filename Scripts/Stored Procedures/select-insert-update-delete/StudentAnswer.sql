USE ITI_ExamSystem;
GO

/* =========================
   StudentAnswer INSERT
   ========================= */
CREATE OR ALTER PROC sp_StudentAnswer_Insert
    @StId INT,
    @ExId INT,
    @QId INT,
    @Answer VARCHAR(10)
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        -- Validate student exam registration
        IF NOT EXISTS (
            SELECT 1
            FROM Student_Exam
            WHERE StId = @StId AND ExId = @ExId
        )
            THROW 50001, 'Student is not registered in this exam.', 1;

        -- Validate question exists
        IF NOT EXISTS (SELECT 1 FROM Question WHERE QId = @QId)
            THROW 50002, 'Question does not exist.', 1;

        -- Validate question belongs to exam
        IF NOT EXISTS (
            SELECT 1
            FROM Exam_Question
            WHERE ExId = @ExId AND QId = @QId
        )
            THROW 50003, 'Question does not belong to this exam.', 1;

        -- Prevent duplicate answer
        IF EXISTS (
            SELECT 1
            FROM StudentAnswer
            WHERE StId = @StId AND ExId = @ExId AND QId = @QId
        )
            THROW 50004, 'Answer already submitted for this question.', 1;

        INSERT INTO StudentAnswer (StId, ExId, QId, Answer)
        VALUES (@StId, @ExId, @QId, @Answer);
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END;
GO


/* =========================
   StudentAnswer UPDATE
   ========================= */
CREATE OR ALTER PROC sp_StudentAnswer_Update
    @StId INT,
    @ExId INT,
    @QId INT,
    @Answer VARCHAR(10)
AS
BEGIN
    SET NOCOUNT ON;

    IF NOT EXISTS (
        SELECT 1
        FROM StudentAnswer
        WHERE StId = @StId AND ExId = @ExId AND QId = @QId
    )
        THROW 50005, 'Student answer not found.', 1;

    UPDATE StudentAnswer
    SET Answer = @Answer
    WHERE StId = @StId
      AND ExId = @ExId
      AND QId = @QId;
END;
GO


/* =========================
   StudentAnswer DELETE
   ========================= */
CREATE OR ALTER PROC sp_StudentAnswer_Delete
    @StId INT,
    @ExId INT,
    @QId INT
AS
BEGIN
    SET NOCOUNT ON;

    IF NOT EXISTS (
        SELECT 1
        FROM StudentAnswer
        WHERE StId = @StId AND ExId = @ExId AND QId = @QId
    )
        THROW 50006, 'Student answer not found.', 1;

    DELETE FROM StudentAnswer
    WHERE StId = @StId
      AND ExId = @ExId
      AND QId = @QId;
END;
GO


/* =========================
   StudentAnswer SELECT (by Student & Exam)
   ========================= */
CREATE OR ALTER PROC sp_StudentAnswer_SelectByStudentExamID
    @StId INT,
    @ExId INT
AS
BEGIN
    SELECT *
    FROM StudentAnswer
    WHERE StId = @StId
      AND ExId = @ExId;
END
GO

/* =========================
   StudentAnswer SELECT (by Student)
   ========================= */
CREATE OR ALTER PROC sp_StudentAnswer_SelectByStudentID
    @StId INT
AS
BEGIN
    SELECT *
    FROM StudentAnswer
    WHERE StId = @StId;
END
GO


/* =========================
   StudentAnswer SELECT (by Exam)
   ========================= */
CREATE OR ALTER PROC sp_StudentAnswer_SelectByExamID
    @ExId INT
AS
BEGIN
    SELECT *
    FROM StudentAnswer
    WHERE ExId = @ExId;
END
GO

/* =========================
   StudentAnswer SELECT (All)
   ========================= */
CREATE OR ALTER PROC sp_StudentAnswer_SelectAll
AS
BEGIN
    SELECT *
    FROM StudentAnswer;
END
GO
