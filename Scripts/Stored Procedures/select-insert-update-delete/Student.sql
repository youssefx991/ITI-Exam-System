CREATE OR ALTER PROCEDURE sp_Student_Insert
    @StId INT,
    @StName VARCHAR(100),
    @StEmail VARCHAR(100),
    @TrackID INT
AS
BEGIN
    -- Validate Track
    IF NOT EXISTS (
        SELECT 1 FROM Track WHERE TrackID = @TrackID
    )
    BEGIN
        RAISERROR('Invalid Track ID.', 16, 1);
        RETURN;
    END

    -- Validate unique ID and Email
    IF EXISTS (
        SELECT 1 FROM Student
        WHERE StId = @StId OR StEmail = @StEmail
    )
    BEGIN
        RAISERROR('Student ID or Email already exists.', 16, 1);
        RETURN;
    END

    INSERT INTO Student (StId, StName, StEmail, TrackID)
    VALUES (@StId, @StName, @StEmail, @TrackID);
END
GO

CREATE OR ALTER PROCEDURE sp_Student_Update
    @StId INT,
    @StName VARCHAR(100) = NULL,
    @StEmail VARCHAR(100) = NULL,
    @TrackID INT = NULL
AS
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM Student WHERE StId = @StId
    )
    BEGIN
        RAISERROR('Student not found.', 16, 1);
        RETURN;
    END

    IF @TrackID IS NOT NULL
       AND NOT EXISTS (SELECT 1 FROM Track WHERE TrackID = @TrackID)
    BEGIN
        RAISERROR('Invalid Track ID.', 16, 1);
        RETURN;
    END

    UPDATE Student
    SET StName  = ISNULL(@StName, StName),
        StEmail = ISNULL(@StEmail, StEmail),
        TrackID = ISNULL(@TrackID, TrackID)
    WHERE StId = @StId;
END
GO


CREATE PROCEDURE sp_Student_Delete
    @StId INT
AS
BEGIN
    DELETE FROM Student
    WHERE StId = @StId
END
GO

CREATE PROCEDURE sp_Student_Select
    @StId INT = NULL  -- If NULL, return all students, if provided, return specific one
AS
BEGIN
    SELECT 
        S.StId,
        S.StName,
        S.StEmail,
        S.TrackID,
        T.TrackName,
        D.DeptName
    FROM Student S
    JOIN Track T ON S.TrackID = T.TrackID
    JOIN Department D ON T.DeptID = D.DeptID
    WHERE (@StId IS NULL OR S.StId = @StId)
    ORDER BY S.StId
END
GO

--test cases
/*
EXEC sp_Student_Insert 'Ziad Tamer', 'ziad@iti.com', 2;
EXEC sp_Student_Insert 'Adam Tamer', 'Adam@iti.com', 3;
EXEC sp_Student_Insert 'Tamer', 'Tamer@iti.com', 5;

EXEC sp_Student_Select;  -- All students

EXEC sp_Student_Select @StId = 2;  -- Specific student

EXEC sp_Student_Update @StId = 4, @StName = 'Tamer Abd El Hafeez', @StEmail = 'tamer.zaza@iti.com', @TrackID = 2;

EXEC sp_Student_Delete @StId = 4;

-- Update only the name
EXEC sp_Student_Update @StId = 2, @StName = 'Only Ziad';

-- Update only the email
EXEC sp_Student_Update @StId = 10, @StEmail = 'mohamed.new@iti.com';

-- Update only the track
EXEC sp_Student_Update @StId = 10, @TrackID = 3;

-- Update name and track, leave email unchanged
EXEC sp_Student_Update @StId = 10, @StName = 'Ahmed Ali', @TrackID = 5;

-- Update all fields
EXEC sp_Student_Update @StId = 10, 
                        @StName = 'Sara Khaled', 
                        @StEmail = 'sara@iti.com', 
                        @TrackID = 2;

*/