USE ITI_ExamSystem
GO
-------------------------------------------------------------INSERT QUESTION SP----------------------------------------------------------
CREATE OR ALTER PROCEDURE SP_Question_Insert
    @QText   VARCHAR(MAX),
    @QType   VARCHAR(10),   -- 'MCQ' or 'True/False'
    @QDegree INT,           -- 1 to 3
    @QAnswer VARCHAR(10),   -- depending on QType
    @CrsId  INT
    --@NewQId INT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRANSACTION;

    BEGIN TRY
        -- Check if course exists
        IF NOT EXISTS (SELECT 1 FROM Course WHERE CrsId = @CrsId)
            THROW 50001, 'Course ID does not exist.', 1;

        -- Insert the question
        INSERT INTO Question (QText, QType, QDegree, QAnswer, CrsId)
        VALUES (@QText, @QType, @QDegree, @QAnswer, @CrsId);

        -- Return the new Question ID
       -- SET @NewQId = SCOPE_IDENTITY();

        -- Commit transaction if everything is OK
        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        -- Rollback transaction safely
        ROLLBACK TRANSACTION;

        -- Re-throw the original error to the caller
        THROW;
    END CATCH
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

    BEGIN TRANSACTION;

    BEGIN TRY
        -- Check if the question exists
        IF NOT EXISTS (SELECT 1 FROM Question WHERE QId = @QId)
            THROW 50001, 'Question not found.', 1;


        -- Optional validation for course
        IF @CrsId is not Null
            IF NOT EXISTS (SELECT 1 FROM Course WHERE CrsId = @CrsId)
                THROW 50005, 'Course ID does not exist.', 1;

        -- Update only provided values
        UPDATE Question
        SET 
            QText   = COALESCE(@QText, QText),
            --QType   = COALESCE(@QType, QType),
            QDegree = COALESCE(@QDegree, QDegree),
            QAnswer = COALESCE(@QAnswer, QAnswer),
            CrsId   = COALESCE(@CrsId, CrsId)
        WHERE QId = @QId;

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
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

    BEGIN TRANSACTION;

    BEGIN TRY
        -- Check if question exists
        IF NOT EXISTS (SELECT 1 FROM Question WHERE QId = @QId)
            THROW 50001, 'Question not found.', 1;

        -- Delete related choices first (if any)
        DELETE FROM Choice
        WHERE QId = @QId;

        -- Delete the question
        DELETE FROM Question
        WHERE QId = @QId;

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;

        -- Re-throw the original error
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
CREATE OR ALTER PROCEDURE sp_Question_SelectByCourse
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
END;
GO

