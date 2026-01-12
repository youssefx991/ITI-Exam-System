USE ITI_ExamSystem
GO
--------------------------------------------------------------------------------------------
CREATE OR ALTER PROCEDURE sp_Choice_Insert
    @QId INT,
    @ChoiceLabel CHAR(1),
    @ChoiceText VARCHAR(200)
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        -- Question exists
        IF NOT EXISTS (SELECT 1 FROM Question WHERE QId = @QId)
            THROW 50001, 'Question does not exist.', 1;

        -- Only MCQ questions have choices
        IF NOT EXISTS (
            SELECT 1 FROM Question
            WHERE QId = @QId AND QType = 'MCQ'
        )
            THROW 50002, 'Choices allowed only for MCQ questions.', 1;

        -- Valid label
        IF @ChoiceLabel NOT IN ('A','B','C')
            THROW 50003, 'Invalid choice label.', 1;

        -- Prevent duplicates
        IF EXISTS (
            SELECT 1 FROM Choice
            WHERE QId = @QId AND ChoiceLabel = @ChoiceLabel
        )
            THROW 50004, 'Choice already exists.', 1;

        INSERT INTO Choice (QId, ChoiceLabel, ChoiceText)
        VALUES (@QId, @ChoiceLabel, @ChoiceText);
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END;
GO

---------------------------------------------------------------------------------------------------
CREATE OR ALTER PROCEDURE sp_Choice_Update
    @QId INT,
    @ChoiceLabel CHAR(1),
    @ChoiceText VARCHAR(200) = NULL
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        IF @ChoiceText IS NOT NULL AND LTRIM(RTRIM(@ChoiceText)) = ''
            THROW 50005, 'Choice text cannot be empty.', 1;

        IF NOT EXISTS (
            SELECT 1
            FROM Choice
            WHERE QId = @QId AND ChoiceLabel = @ChoiceLabel
        )
            THROW 50003, 'Choice not found.', 1;

        UPDATE dbo.Choice
        SET ChoiceText = COALESCE(@ChoiceText, ChoiceText) -- if Choice Text is null then use old value
        WHERE QId = @QId
          AND ChoiceLabel = @ChoiceLabel;

    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END;
GO
---------------------------------------------------------------------------------------------
CREATE OR ALTER PROCEDURE sp_Choice_Delete
    @QId INT,
    @ChoiceLabel CHAR(1)
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        --  Check existence
        IF NOT EXISTS (
            SELECT 1
            FROM Choice
            WHERE QId = @QId AND ChoiceLabel = @ChoiceLabel
        )
            THROW 50004, 'Choice not found.', 1;

        DELETE FROM Choice
        WHERE QId = @QId
          AND ChoiceLabel = @ChoiceLabel;
    END TRY
    BEGIN CATCH

        THROW;
    END CATCH
END;
GO
-----------------------------------------------------------------------------------------------------------------
CREATE OR ALTER PROCEDURE sp_Choices_DeleteByQId
    @QId INT
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY

        -- Check existence
        IF NOT EXISTS (
            SELECT 1
            FROM Choice
            WHERE QId = @QId
        )
        THROW 50004, 'No choices found for this Question.', 1;

        DELETE FROM Choice
        WHERE QId = @QId;
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END;
GO

----------------------------------------------------------------------------------------------------------------
CREATE OR ALTER PROCEDURE sp_Choices_SelectByQId
    @QId INT
AS
BEGIN
    SET NOCOUNT ON;
 
    IF NOT EXISTS (SELECT 1 FROM Choice WHERE QId = @QId)
        THROW 50003, 'Question choices do not exist.', 1;
    SELECT
        ChoiceLabel,
        ChoiceText
    FROM dbo.Choice
    WHERE QId = @QId
    ORDER BY ChoiceLabel;
END;
GO
------------------------------------------------------------------------------------------------------------------
CREATE OR ALTER PROCEDURE sp_Choice_SelectByQesCho
    @QId INT,
    @ChoiceLabel CHAR(1)
AS
BEGIN
    SET NOCOUNT ON;
     IF NOT EXISTS (SELECT 1 FROM Choice WHERE QId = @QId AND ChoiceLabel = @ChoiceLabel )
        THROW 50003, 'Choice does not exist for this question.', 1;
    SELECT
        QId,
        ChoiceLabel,
        ChoiceText
    FROM dbo.Choice
    WHERE QId = @QId
      AND ChoiceLabel = @ChoiceLabel;
END;
GO
