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
    INSERT INTO Exam_Question (ExId, QId, QOrder)
    VALUES (@ExId, @QId, @QOrder);
END
GO

/* =========================
   Exam_Question DELETE
   ========================= */
CREATE OR ALTER PROC sp_ExamQuestion_Delete
    @ExId INT,
    @QId INT
AS
BEGIN
    DELETE FROM Exam_Question
    WHERE ExId = @ExId
      AND QId = @QId;
END
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
    UPDATE Exam_Question
    SET QOrder = @QOrder
    WHERE ExId = @ExId
      AND QId = @QId;
END
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