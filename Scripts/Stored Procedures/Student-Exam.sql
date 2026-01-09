

CREATE PROCEDURE sp_Student_Exam_Insert
    @StId INT,
    @ExId INT
AS
BEGIN
    INSERT INTO Student_Exam (StId, ExId, FinalGrade)
    VALUES (@StId, @ExId, NULL)
END
GO


CREATE PROCEDURE sp_Student_Exam_Select
    @StId INT,
    @ExId INT
AS
BEGIN
    SELECT S.StName, E.ExId, SE.FinalGrade
    FROM Student_Exam SE
    JOIN Student S ON SE.StId = S.StId
    JOIN Exam E ON SE.ExId = E.ExId
    WHERE SE.StId = @StId AND SE.ExId = @ExId
END
GO
CREATE PROCEDURE sp_Student_Exam_Update
    @StId INT,
    @ExId INT,
    @FinalGrade DECIMAL(5,2)
AS
BEGIN
    UPDATE Student_Exam
    SET FinalGrade = @FinalGrade
    WHERE StId = @StId AND ExId = @ExId
END
GO


CREATE PROCEDURE sp_Student_Exam_Delete
    @StId INT,
    @ExId INT
AS
BEGIN
    DELETE FROM Student_Exam
    WHERE StId = @StId AND ExId = @ExId
END
GO

