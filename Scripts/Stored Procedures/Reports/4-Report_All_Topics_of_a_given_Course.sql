use ITI_ExamSystem
go

CREATE or alter PROCEDURE sp_Course_GetTopics
    @CrsId INT
AS
BEGIN
    SELECT 
        T.TopicID,
        T.TopicName,
        C.CrsName,
        C.CrsId
    FROM Topic T
    INNER JOIN Course C ON T.CrsId = C.CrsId
    WHERE T.CrsId = @CrsId
    ORDER BY T.TopicID;
END
GO


EXEC sp_Course_GetTopics @CrsId = 5;
