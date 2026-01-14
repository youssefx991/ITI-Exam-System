-- Switch context to the ITI_ExamSystem database
USE ITI_ExamSystem
GO 

-- Create or update stored procedure used to insert AI-generated questions
CREATE OR ALTER PROCEDURE sp_Question_InsertAI
    @QText NVARCHAR(500),      -- Question text
    @QType VARCHAR(10),        -- Question type: MCQ or TF
    @QAnswer CHAR(1),          -- Correct answer: A/B/C or T/F
    @Difficulty VARCHAR(10),   -- Difficulty level: Easy / Medium / Hard
    @CrsId INT,                -- Course ID
    @ChoiceA NVARCHAR(200) = NULL, -- MCQ choice A (optional for TF)
    @ChoiceB NVARCHAR(200) = NULL, -- MCQ choice B (optional for TF)
    @ChoiceC NVARCHAR(200) = NULL  -- MCQ choice C (optional for TF)
AS
BEGIN
    -- Disable row-count messages for cleaner output and better performance
    SET NOCOUNT ON;

    -- Variable to hold the generated Question ID
    DECLARE @QId INT;

    -- Variable to store numeric degree mapped from difficulty
    DECLARE @QDegree INT;

    -- =====================
    -- VALIDATIONS
    -- =====================

    -- Ensure the provided course ID exists
    IF NOT EXISTS (SELECT 1 FROM Course WHERE CrsId = @CrsId)
        THROW 50001, 'Course ID does not exist.', 1;

    -- Ensure question type is valid
    IF @QType NOT IN ('MCQ', 'TF')
        THROW 50011, 'Invalid question type.', 1;

    -- Validate answer for True/False questions
    IF @QType = 'TF' AND @QAnswer NOT IN ('T','F')
        THROW 50009, 'TF questions must have answer T or F.', 1;

    -- Validate answer for MCQ questions
    IF @QType = 'MCQ' AND @QAnswer NOT IN ('A','B','C')
        THROW 50010, 'MCQ answer must be A, B, or C.', 1;

    -- Validate MCQ choices
    IF @QType = 'MCQ'
    BEGIN
        -- MCQ questions must have all three choices
        IF @ChoiceA IS NULL OR @ChoiceB IS NULL OR @ChoiceC IS NULL
            THROW 50008, 'MCQ questions require 3 choices.', 1;
    END

    -- =====================
    -- QUESTION ID GENERATION
    -- =====================

    -- Generate new Question ID manually (Question table is not IDENTITY)
    SELECT @QId = ISNULL(MAX(QId), 0) + 1
    FROM Question;

    -- =====================
    -- DIFFICULTY MAPPING
    -- =====================

    -- Convert difficulty text into numeric degree
    SET @QDegree =
        CASE LOWER(@Difficulty)
            WHEN 'easy' THEN 1
            WHEN 'medium' THEN 2
            WHEN 'hard' THEN 3
            ELSE 2               -- Default to Medium if invalid value is passed
        END;

    -- =====================
    -- INSERT QUESTION
    -- =====================

    -- Insert the question into the Question table
    INSERT INTO Question (QId, QText, QType, QDegree, QAnswer, CrsId)
    VALUES (@QId, @QText, @QType, @QDegree, @QAnswer, @CrsId);

    -- =====================
    -- INSERT MCQ CHOICES
    -- =====================

    -- Insert choices only if question type is MCQ
    IF @QType = 'MCQ'
    BEGIN
        -- Insert three choices (A, B, C) linked to the question
        INSERT INTO Choice (ChoiceLabel, ChoiceText, QId)
        VALUES
            ('A', @ChoiceA, @QId),
            ('B', @ChoiceB, @QId),
            ('C', @ChoiceC, @QId);
    END
END;
GO
