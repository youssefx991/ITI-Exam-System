CREATE PROCEDURE sp_Instructor_Course_Insert
    @InsId INT,
    @CrsId INT
AS
BEGIN
    INSERT INTO Instructor_Course (InsId, CrsId)
    VALUES (@InsId, @CrsId)
END
GO


CREATE PROCEDURE sp_Instructor_Course_Select
    @InsId INT
AS
BEGIN
    SELECT IC.InsId, I.InsName, IC.CrsId, C.CrsName
    FROM Instructor_Course IC
    JOIN Instructor I ON IC.InsId = I.InsId
    JOIN Course C ON IC.CrsId = C.CrsId
    WHERE IC.InsId = @InsId
END
GO


CREATE PROCEDURE sp_Instructor_Course_Delete
    @InsId INT,
    @CrsId INT
AS
BEGIN
    DELETE FROM Instructor_Course
    WHERE InsId = @InsId AND CrsId = @CrsId
END
GO



-- Show all instructor courses
CREATE  PROCEDURE sp_Instructor_Course_SelectAll
AS
BEGIN
    SELECT 
        IC.InsID,
        I.InsName,
        IC.CrsID,
        C.CrsName
    FROM Instructor_Course IC
    INNER JOIN Instructor I ON IC.InsID = I.InsID
    INNER JOIN Course C ON IC.CrsID = C.CrsID;
END;
GO

