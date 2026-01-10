USE ITI_ExamSystem;
GO

/* =========================
   Exam INSERT
   ========================= */
CREATE OR ALTER PROC sp_Exam_Insert
    @ExId INT,
    @CrsId INT,
    @ExDate DATETIME = NULL
AS
BEGIN
    -- Validate Course
    IF NOT EXISTS (
        SELECT 1 FROM Course WHERE CrsId = @CrsId
    )
    BEGIN
        RAISERROR('Invalid Course ID.', 16, 1);
        RETURN;
    END

    -- Validate unique Exam ID
    IF EXISTS (
        SELECT 1 FROM Exam WHERE ExId = @ExId
    )
    BEGIN
        RAISERROR('Exam ID already exists.', 16, 1);
        RETURN;
    END

    INSERT INTO Exam (ExId, ExDate, CrsId)
    VALUES (@ExId, ISNULL(@ExDate, GETDATE()), @CrsId);
END
GO


/* =========================
   Exam UPDATE
   ========================= */
CREATE OR ALTER PROC sp_Exam_Update
    @ExId INT,
    @ExDate DATETIME
AS
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM Exam WHERE ExId = @ExId
    )
    BEGIN
        RAISERROR('Exam not found.', 16, 1);
        RETURN;
    END

    UPDATE Exam
    SET ExDate = @ExDate
    WHERE ExId = @ExId;
END
GO


/* =========================
   Exam DELETE
   ========================= */
CREATE OR ALTER PROC sp_Exam_Delete
    @ExId INT
AS
BEGIN
    DELETE FROM Exam
    WHERE ExId = @ExId;
END
GO

/* =========================
   Exam SELECT BY ID
   ========================= */
CREATE OR ALTER PROC sp_Exam_SelectById
    @ExId INT
AS
BEGIN
    SELECT *
    FROM Exam
    WHERE ExId = @ExId;
END
GO

/* =========================
   Exam SELECT BY COURSE
   ========================= */
CREATE OR ALTER PROC sp_Exam_SelectByCourseID
    @CrsId INT
AS
BEGIN
    SELECT *
    FROM Exam
    WHERE CrsId = @CrsId
    ORDER BY ExDate DESC;
END
GO

/* =========================
   Exam SELECT ALL
   ========================= */
CREATE OR ALTER PROC sp_Exam_SelectAll
AS
BEGIN
    SELECT *
    FROM Exam
    ORDER BY ExDate DESC;
END
GO
