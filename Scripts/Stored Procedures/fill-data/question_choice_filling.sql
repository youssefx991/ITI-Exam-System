USE ITI_ExamSystem
GO 


CREATE OR ALTER PROCEDURE sp_Insert_Question
    @QText NVARCHAR(500),
    @QType VARCHAR(10),        -- MCQ / TF
    @QAnswer CHAR(1),          -- A/B/C or T/F
    @Difficulty VARCHAR(10),   -- Easy / Medium / Hard
    @CrsId INT,
    @ChoiceA NVARCHAR(200) = NULL,
    @ChoiceB NVARCHAR(200) = NULL,
    @ChoiceC NVARCHAR(200) = NULL
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @QId INT;
    DECLARE @QDegree INT;

    -- Generate QId (non-identity)
    SELECT @QId = ISNULL(MAX(QId), 0) + 1 FROM Question;

    -- Map difficulty to degree
    SET @QDegree =
        CASE LOWER(@Difficulty)
            WHEN 'easy' THEN 1
            WHEN 'medium' THEN 2
            WHEN 'hard' THEN 3
            ELSE 2
        END;

    -- Insert question
    INSERT INTO Question (QId, QText, QType, QDegree, QAnswer, CrsId)
    VALUES (@QId, @QText, @QType, @QDegree, @QAnswer, @CrsId);

    -- Insert MCQ choices (A, B, C only)
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
