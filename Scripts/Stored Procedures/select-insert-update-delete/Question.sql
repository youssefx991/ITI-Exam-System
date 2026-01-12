USE ITI_ExamSystem
GO
-------------------------------------------------------------INSERT QUESTION SP----------------------------------------------------------
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

    -- Validate course
    IF NOT EXISTS (SELECT 1 FROM Course WHERE CrsId = @CrsId)
        THROW 50001, 'Course ID does not exist.', 1;

    -- Validate question type
    IF @QType NOT IN ('MCQ', 'TF')
        THROW 50011, 'Invalid question type.', 1;

    -- Validate answer
    IF @QType = 'TF' AND @QAnswer NOT IN ('T','F')
        THROW 50009, 'TF questions must have answer T or F.', 1;

    IF @QType = 'MCQ' AND @QAnswer NOT IN ('A','B','C')
        THROW 50010, 'MCQ answer must be A, B, or C.', 1;

    -- Validate MCQ choices
    IF @QType = 'MCQ'
    BEGIN
        IF @ChoiceA IS NULL OR @ChoiceB IS NULL OR @ChoiceC IS NULL
            THROW 50008, 'MCQ questions require 3 choices.', 1;
    END

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

--------------------------------------------------PARTIAL UPADATE QUESTION SP-----------------------------------------------------------------------------------
CREATE OR ALTER PROCEDURE sp_Question_Update
    @QId       INT,
    @QText     VARCHAR(MAX) = NULL,
    --@QType     VARCHAR(10) = NULL,   -- 'MCQ' or 'T/F'
    @QDegree   INT = NULL,           -- 1 to 3
    @QAnswer   VARCHAR(10) = NULL,
    @CrsId     INT = NULL
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        -- Check if the question exists
        IF NOT EXISTS (SELECT 1 FROM Question WHERE QId = @QId)
            THROW 50001, 'Question not found.', 1;

        IF @CrsId IS NOT NULL AND NOT EXISTS (SELECT 1 FROM Course WHERE CrsId = @CrsId)
                THROW 50005, 'Course ID does not exist.', 1;
        IF @QDegree IS NOT NULL AND @QDegree <= 0
            THROW 50006, 'Question degree must be positive.', 1;

        IF @QAnswer IS NOT NULL AND LEN(@QAnswer) = 0
            THROW 50007, 'Answer cannot be empty.', 1;

        -- Update only provided values
        UPDATE Question
        SET 
            QText   = COALESCE(@QText, QText),
            --QType   = COALESCE(@QType, QType),
            QDegree = COALESCE(@QDegree, QDegree),
            QAnswer = COALESCE(@QAnswer, QAnswer),
            CrsId   = COALESCE(@CrsId, CrsId)
        WHERE QId = @QId;
    END TRY
    BEGIN CATCH
        THROW; -- re-throw the original error
    END CATCH
END;
GO
----------------------------------------------------------DELETE QUESTION SP--------------------------------------------------------
CREATE OR ALTER PROCEDURE sp_Question_Delete
    @QId INT
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        -- Check if question exists
        IF NOT EXISTS (SELECT 1 FROM Question WHERE QId = @QId)
            THROW 50001, 'Question not found.', 1;

        -- Delete related choices first 
        DELETE FROM Choice
        WHERE QId = @QId;

        -- Delete the question
        DELETE FROM Question
        WHERE QId = @QId;

    END TRY
    BEGIN CATCH
 
        THROW;
    END CATCH
END;

GO

----------------------------------------------------------SELECT QUESTION BY QID SP---------------------------------------------------
CREATE OR ALTER PROCEDURE sp_Question_SelectByID
    @QId INT
AS
BEGIN
    SET NOCOUNT ON;

    -- Check if the question exists
    IF NOT EXISTS (SELECT 1 FROM Question WHERE QId = @QId)
        THROW 50001, 'Question not found.', 1;

    -- Select the question
    SELECT 
        QId, 
        QText, 
        QType, 
        QDegree, 
        QAnswer, 
        CrsId
    FROM Question
    WHERE QId = @QId;
END;

GO
---------------------------------------------------------------SELECT QUESTIONS BY CRID SP------------------------------------------------
CREATE OR ALTER PROCEDURE sp_Questions_SelectByCourse
    @CrsId INT
AS
BEGIN
    SET NOCOUNT ON;

    -- Check if the course exists
    IF NOT EXISTS (SELECT 1 FROM Course WHERE CrsId = @CrsId)
        THROW 50001, 'Course ID does not exist.', 1;

    -- Select questions for the course
    SELECT 
        QId,
        QText, 
        QType, 
        QDegree, 
        QAnswer
    FROM Question
    WHERE CrsId = @CrsId
    ORDER BY QId 
END;
GO

