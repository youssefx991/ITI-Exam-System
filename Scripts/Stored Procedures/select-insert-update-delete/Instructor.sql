CREATE PROCEDURE sp_Instructor_Insert
    @InsName VARCHAR(100),
    @InsEmail VARCHAR(100),
    @TrackID INT
AS
BEGIN
    INSERT INTO Instructor (InsName, InsEmail, TrackID)
    VALUES (@InsName, @InsEmail, @TrackID)
END
GO

CREATE PROCEDURE sp_Instructor_Update
    @InsId INT,
    @InsName VARCHAR(100) = NULL, -- if there is no value --> then it gets the old one, tb law fe value ? --> it will be updated <3
    @InsEmail VARCHAR(100) = NULL,
    @TrackID INT = NULL
AS
BEGIN
    UPDATE Instructor
    SET InsName = ISNULL(@InsName, InsName),
        InsEmail = ISNULL(@InsEmail, InsEmail),
        TrackID = ISNULL(@TrackID, TrackID)
    WHERE InsId = @InsId
END
GO

CREATE PROCEDURE sp_Instructor_Delete
    @InsId INT
AS
BEGIN
    DELETE FROM Instructor
    WHERE InsId = @InsId
END
GO

CREATE PROCEDURE sp_Instructor_Select
    @InsId INT = NULL  -- If NULL, return all instructors, if provided, return specific one
AS
BEGIN
    SELECT 
        I.InsId,
        I.InsName,
        I.InsEmail,
        I.TrackID,
        T.TrackName,
        D.DeptName
    FROM Instructor I
    JOIN Track T ON I.TrackID = T.TrackID
    JOIN Department D ON T.DeptID = D.DeptID
    WHERE (@InsId IS NULL OR I.InsId = @InsId)
    ORDER BY I.InsId
END
GO

--test cases

/*
-- Insert a new instructor
EXEC sp_Instructor_Insert 'Dr. Ahmed Hassan', 'ahmed.hassan@iti.com', 1;

-- Update only the email
EXEC sp_Instructor_Update @InsId = 3, @InsEmail = 'ahmed.new@iti.com';

-- Update only the track (e.g., move to another track)
EXEC sp_Instructor_Update @InsId = 3, @TrackID = 4;

-- Update name and email
EXEC sp_Instructor_Update @InsId = 3, 
                          @InsName = 'Dr. Ahmed Ali', 
                          @InsEmail = 'ahmed.ali@iti.com';

-- Get all instructors with their track and department
EXEC sp_Instructor_Select;

-- Get specific instructor
EXEC sp_Instructor_Select @InsId = 5;

-- Delete an instructor
EXEC sp_Instructor_Delete @InsId = 5;

*/