use ITI_ExamSystem

-- 1. Report: All Topics of a given Course
CREATE PROCEDURE sp_Course_GetTopics
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

-- 1. Get all topics of course ID 5
EXEC sp_Course_GetTopics @CrsId = 5;
