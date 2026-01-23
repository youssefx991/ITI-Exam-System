-- Switch context to the ITI_ExamSystem database
USE ITI_ExamSystem
GO 

CREATE OR ALTER PROCEDURE sp_Question_InsertAI
    @QText NVARCHAR(500),     
    @QType VARCHAR(10),       
    @QAnswer CHAR(1),          
    @Difficulty VARCHAR(10),   
    @CrsId INT,               
    @ChoiceA NVARCHAR(200) = NULL, 
    @ChoiceB NVARCHAR(200) = NULL, 
    @ChoiceC NVARCHAR(200) = NULL 
AS
BEGIN
   
    SET NOCOUNT ON;

    DECLARE @QId INT;

    DECLARE @QDegree INT;

    IF NOT EXISTS (SELECT 1 FROM Course WHERE CrsId = @CrsId)
        THROW 50001, 'Course ID does not exist.', 1;

    IF @QType NOT IN ('MCQ', 'TF')
        THROW 50011, 'Invalid question type.', 1;

    IF @QType = 'TF' AND @QAnswer NOT IN ('T','F')
        THROW 50009, 'TF questions must have answer T or F.', 1;

    IF @QType = 'MCQ' AND @QAnswer NOT IN ('A','B','C')
        THROW 50010, 'MCQ answer must be A, B, or C.', 1;

    IF @QType = 'MCQ'
    BEGIN
        IF @ChoiceA IS NULL OR @ChoiceB IS NULL OR @ChoiceC IS NULL
            THROW 50008, 'MCQ questions require 3 choices.', 1;
    END

    SELECT @QId = ISNULL(MAX(QId), 0) + 1
    FROM Question;

    SET @QDegree =
        CASE LOWER(@Difficulty)
            WHEN 'easy' THEN 1
            WHEN 'medium' THEN 2
            WHEN 'hard' THEN 3
            ELSE 2               
        END;

    INSERT INTO Question (QId, QText, QType, QDegree, QAnswer, CrsId)
    VALUES (@QId, @QText, @QType, @QDegree, @QAnswer, @CrsId);

    IF @QType = 'MCQ'
    BEGIN

        INSERT INTO Choice (ChoiceLabel, ChoiceText, QId)
        VALUES
            ('A', @ChoiceA, @QId),
            ('B', @ChoiceB, @QId),
            ('C', @ChoiceC, @QId);
    END
END;
GO
