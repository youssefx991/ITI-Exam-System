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
    INSERT INTO StudentAnswer (StId, ExId, QId, Answer)
    VALUES (@StId, @ExId, @QId, @Answer);
END
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
    UPDATE StudentAnswer
    SET Answer = @Answer
    WHERE StId = @StId
      AND ExId = @ExId
      AND QId = @QId;
END
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
    DELETE FROM StudentAnswer
    WHERE StId = @StId
      AND ExId = @ExId
      AND QId = @QId;
END
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
