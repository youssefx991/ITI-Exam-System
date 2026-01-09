
CREATE PROCEDURE sp_Topic_Insert
    @TopicName VARCHAR(100),
    @CrsId INT
AS
BEGIN
    INSERT INTO Topic (TopicName, CrsId)
    VALUES (@TopicName, @CrsId)
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


CREATE PROCEDURE sp_Topic_Update
    @TopicID INT,
    @TopicName VARCHAR(100)
AS
BEGIN
    UPDATE Topic
    SET TopicName = @TopicName
    WHERE TopicID = @TopicID
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
