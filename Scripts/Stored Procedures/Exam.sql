USE ITI_ExamSystem;
GO

/* =========================
   Exam INSERT
   ========================= */
CREATE OR ALTER PROC sp_Exam_Insert
    @CrsId INT,
    @ExDate DATETIME = NULL,
    @NewExamID INT OUTPUT
AS
BEGIN
    INSERT INTO Exam (ExDate, CrsId)
    VALUES (ISNULL(@ExDate, GETDATE()), @CrsId);

    SET @NewExamID = SCOPE_IDENTITY();
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
