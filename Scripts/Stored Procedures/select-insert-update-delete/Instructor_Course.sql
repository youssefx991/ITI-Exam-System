CREATE OR ALTER PROCEDURE sp_Instructor_Course_Insert
    @InsId INT,
    @CrsId INT
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        -- Validate Instructor
        IF NOT EXISTS (SELECT 1 FROM Instructor WHERE InsId = @InsId)
            THROW 50001, 'Instructor does not exist.', 1;

        -- Validate Course
        IF NOT EXISTS (SELECT 1 FROM Course WHERE CrsId = @CrsId)
            THROW 50002, 'Course does not exist.', 1;

        -- Prevent duplicate assignment
        IF EXISTS (
            SELECT 1
            FROM Instructor_Course
            WHERE InsId = @InsId AND CrsId = @CrsId
        )
            THROW 50003, 'Instructor already assigned to this course.', 1;

        INSERT INTO Instructor_Course (InsId, CrsId)
        VALUES (@InsId, @CrsId);
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END;
GO



CREATE OR ALTER PROCEDURE sp_Instructor_Course_Select
    @InsId INT
AS
BEGIN
    SET NOCOUNT ON;

    IF NOT EXISTS (SELECT 1 FROM Instructor WHERE InsId = @InsId)
        THROW 50004, 'Instructor does not exist.', 1;

    SELECT 
        IC.InsId,
        I.InsName,
        IC.CrsId,
        C.CrsName
    FROM Instructor_Course IC
    JOIN Instructor I ON IC.InsId = I.InsId
    JOIN Course C ON IC.CrsId = C.CrsId
    WHERE IC.InsId = @InsId;
END;
GO



CREATE OR ALTER PROCEDURE sp_Instructor_Course_Delete
    @InsId INT,
    @CrsId INT
AS
BEGIN
    SET NOCOUNT ON;

    IF NOT EXISTS (
        SELECT 1
        FROM Instructor_Course
        WHERE InsId = @InsId AND CrsId = @CrsId
    )
        THROW 50005, 'Instructor is not assigned to this course.', 1;

    DELETE FROM Instructor_Course
    WHERE InsId = @InsId
      AND CrsId = @CrsId;
END;
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

