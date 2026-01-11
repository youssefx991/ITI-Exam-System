
CREATE OR ALTER PROCEDURE sp_Topic_Insert
    @TopicID INT,
    @TopicName VARCHAR(100),
    @CrsId INT
AS
BEGIN
    -- Validate Course
    IF NOT EXISTS (
        SELECT 1 FROM Course WHERE CrsId = @CrsId
    )
    BEGIN
        RAISERROR('Invalid Course ID.', 16, 1);
        RETURN;
    END

    -- Validate unique TopicID (and optional name per course)
    IF EXISTS (
        SELECT 1
        FROM Topic
        WHERE TopicID = @TopicID
           OR (CrsId = @CrsId AND LOWER(TopicName) = LOWER(@TopicName))
    )
    BEGIN
        RAISERROR('Topic ID or Topic name already exists for this course.', 16, 1);
        RETURN;
    END

    INSERT INTO Topic (TopicID, TopicName, CrsId)
    VALUES (@TopicID, @TopicName, @CrsId);
END
GO



CREATE PROCEDURE sp_Topic_Select
    @CrsId INT
AS
BEGIN
    SELECT TopicID, TopicName
    FROM Topic
    WHERE CrsId = @CrsId
END
GO


CREATE OR ALTER PROCEDURE sp_Topic_Update
    @TopicID INT,
    @TopicName VARCHAR(100)
AS
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM Topic WHERE TopicID = @TopicID
    )
    BEGIN
        RAISERROR('Topic not found.', 16, 1);
        RETURN;
    END

    UPDATE Topic
    SET TopicName = @TopicName
    WHERE TopicID = @TopicID;
END
GO



CREATE PROCEDURE sp_Topic_Delete
    @TopicID INT
AS
BEGIN
    DELETE FROM Topic
    WHERE TopicID = @TopicID
END
GO

CREATE  PROCEDURE sp_Topic_SelectAll
AS
BEGIN
    SELECT 
        TopicID,
        TopicName,
        CrsID AS CourseID
    FROM Topic;
END;
