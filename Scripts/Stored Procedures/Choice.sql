USE ITI_ExamSystem
GO
--------------------------------------------------------------------------------------------
CREATE OR ALTER PROCEDURE sp_Choice_Insert
    @QId INT,
    @ChoiceLabel CHAR(1),
    @ChoiceText VARCHAR(200)

AS
BEGIN
    SET NOCOUNT ON; -- No mesaage of "# rows affected"

    BEGIN TRY

        INSERT INTO dbo.Choice (QId, ChoiceLabel, ChoiceText)
        VALUES (@QId, @ChoiceLabel, @ChoiceText);
    END TRY
    BEGIN CATCH

        THROW; -- return original error
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
CREATE OR ALTER PROCEDURE sp_Choices_SlectByQId
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
